import 'dart:io';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/core/network/endpoints.dart';
import 'package:wander_wise_app/core/utils/assets.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/core/widgets/pick_widget.dart';
import 'package:wander_wise_app/features/Profile/logic/profile_cubit/profile_state.dart';
import 'package:wander_wise_app/features/Profile/logic/profile_cubit/proflie_cubit.dart';
import 'package:wander_wise_app/features/Profile/presentation/views/widgets/Profile/profile_fields.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final userNameController = TextEditingController();
  final addressController = TextEditingController();
  final birthDateController = TextEditingController();
  final emailController = TextEditingController();

  bool _controllersInitialized = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProfileCubit>().fetchProfile();
    });
  }

  @override
  void dispose() {
    userNameController.dispose();
    addressController.dispose();
    birthDateController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _initializeControllers(ProfileState state) async {
    if (!_controllersInitialized && (state is ProfileSuccess)) {
      final profile = state.profileModel.user;
      if (profile!.profile != null) {
        emailController.text = profile.email ?? '';
        userNameController.text = profile.name ?? '';
        addressController.text = profile.profile!.address ?? '';
        if (profile.profile!.dateOfBirth != null) {
          try {
            final parsed = DateTime.tryParse(profile.profile!.dateOfBirth!);
            birthDateController.text = parsed != null
                ? DateFormat('dd-MM-yyyy').format(parsed)
                : profile.profile!.dateOfBirth!;
          } catch (_) {
            birthDateController.text = profile.profile!.dateOfBirth!;
          }
        }

        _controllersInitialized = true;
      } else {
        ApiService apiService = ApiService();
        final profileResponse = await apiService.postProfile({
          'phone': '12345678',
          'image': await MultipartFile.fromFile(
            ImagesPaths.profile,
            filename: ImagesPaths.profile.split("/").last,
          ),
        });
        if (profileResponse is Map<String, dynamic> &&
            profileResponse.containsKey('message:')) {
          print(profileResponse['message:']);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
        if (state is ProfileSaved) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              duration: const Duration(seconds: 2),
              backgroundColor: kprimaryColor1,
              content: const Text("changes saved ✅", style: textStyleSize15),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: LoadingAnimationWidget.horizontalRotatingDots(
                color: kprimaryColor3,
                size: 40,
              ),
            ),
          );
        }

        if (state is ProfileSuccess || state is ProfileEditing) {
          _initializeControllers(state);
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagesPaths.profileBackground),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      const SizedBox(height: 180),
                      Expanded(
                        child: ProfileFields(
                          height: size.height,
                          isEditing: state is ProfileEditing,
                          addressController: addressController,
                          emailController: emailController,
                          birthDateController: birthDateController,
                          userNameController: userNameController,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: size.height * 0.1,
                  left: (size.width - 140) / 2,
                  child: PickWidget(
                    height: 140,
                    width: 140,
                    iconAvatar: Icons.camera_alt,
                    photoAvatar: () {
                      if (state is ProfileEditing &&
                          state.selectedImage != null) {
                        // صورة جديدة من الجهاز
                        return state.selectedImage!.path;
                      } else if (state is ProfileEditing &&
                          state.selectedImage == null) {
                        // أثناء التعديل وما اخترت صورة جديدة → لازم أجيب الصورة القديمة من السيرفر
                        return "${Endpoints.imageBaseUrl}${state.profileModel.user?.profile?.image}";
                      } else if (state is ProfileSuccess) {
                        // وضع العرض العادي
                        return "${Endpoints.imageBaseUrl}${state.profileModel.user?.profile?.image}";
                      } else {
                        // fallback
                        return 'assets/images/profile1.jpg';
                      }
                    }(),

                    onTap: state is ProfileEditing
                        ? () async {
                            final picked = await ImagePicker().pickImage(
                              source: ImageSource.gallery,
                            );
                            if (picked != null) {
                              context.read<ProfileCubit>().setPickedImage(
                                picked.path.split("/").last,
                              );
                            }
                          }
                        : () {},
                    showEditIcon: state is ProfileEditing,
                  ),
                ),
                if (state is ProfileEditing)
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: FloatingActionButton(
                      backgroundColor: Colors.green,
                      mini: true,
                      onPressed: () {
                        final dateText = birthDateController.text;
                        DateTime? parsedDate;
                        try {
                          parsedDate = DateFormat('dd-MM-yyyy').parse(dateText);
                        } catch (_) {
                          parsedDate = null;
                        }

                        final formattedDate = parsedDate != null
                            ? DateFormat('yyyy-MM-dd').format(parsedDate)
                            : dateText;
                        context.read<ProfileCubit>().submitProfileEdits(
                          name: userNameController.text,
                          address: addressController.text,
                          dateOfBirth: formattedDate,
                        );
                        // GoRouter.of(context).push(AppRouter.kFAQSupportView);
                      },
                      child: const Icon(Icons.check, color: Colors.white),
                    ),
                  ),
              ],
            ),
          );
        }

        if (state is ProfileFailure) {
          return Center(child: Text("error: ${state.errorMessage}"));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
