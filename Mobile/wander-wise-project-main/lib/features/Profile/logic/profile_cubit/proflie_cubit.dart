import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/features/Profile/data/ProfileModel/profile_model.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ApiService apiService;
  String? pickedImage;
  ProfileCubit(this.apiService) : super(const ProfileInitial());

  Future<void> fetchProfile() async {
    emit(ProfileLoading(selectedImage: state.selectedImage));
    try {
      final response = await apiService.getProfile();
      print('Response type: ${response.runtimeType}');
      print('Response body: $response');

      if (response is Map<String, dynamic> &&
          response.containsKey('errormessage')) {
        emit(
          ProfileFailure(
            errorMessage: response['errormessage'].toString(),
            selectedImage: state.selectedImage,
          ),
        );
        return;
      }
      final profilemodel = ProfileModel.fromMap(response);
      print(profilemodel.user?.profile!.address);
      print(profilemodel.user?.name);
      print(profilemodel.user?.profile!.dateOfBirth);
      print(profilemodel.user?.email);

      emit(
        ProfileSuccess(
          profileModel: profilemodel,
          selectedImage: state.selectedImage,
        ),
      );
    } catch (e) {
      emit(
        ProfileFailure(
          errorMessage: e.toString(),
          selectedImage: state.selectedImage,
        ),
      );
    }
  }

  void startEditing(ProfileModel profile) {
    emit(
      ProfileEditing(profileModel: profile, selectedImage: state.selectedImage),
    );
  }

  void setPickedImage(String image) {
    pickedImage = image;
    emit(
      ProfileEditing(
        profileModel: (state as ProfileEditing).profileModel,
        selectedImage: File(pickedImage!),
      ),
    );
  }

  // Future<File> _compressImage(File file) async {
  //   final targetPath = file.path.replaceAll('.jpg', '_compressed.jpg');
  //   final compressedFile = await FlutterImageCompress.compressAndGetFile(
  //     file.absolute.path,
  //     targetPath,
  //     quality: 70, // جربي 70 أو أقل حسب الحاجة
  //   );
  //   return compressedFile ?? file;
  // }

  Future<void> submitProfileEdits({
    required String name,
    required String address,
    required dynamic dateOfBirth,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "address": address,
        "date-of-birth": dateOfBirth,
        if (pickedImage != null)
          "image": await MultipartFile.fromFile(
            pickedImage!,
            filename: pickedImage!.split("/").last,
          ),
      });

      final response = await apiService.updateProfile(formData);
      final profilemodel = ProfileModel.fromMap(response);
      final updatedModel = profilemodel.copyWith(
        user: profilemodel.user?.copyWith(
          name: name,
          profile: profilemodel.user?.profile?.copyWith(
            address: address,
            dateOfBirth: dateOfBirth,
            image: profilemodel.user?.profile?.image,
          ),
        ),
      );
      print("✅ Updated address: ${profilemodel.user?.profile!.address}");
      print("✅ Updated name: ${profilemodel.user?.name}");
      print(
        "✅ Updated dateOfBirth: ${profilemodel.user?.profile!.dateOfBirth}",
      );
      print("✅ Updated image: ${profilemodel.user?.profile!.image}");
      // emit(ProfileSaved(profileModel: updatedModel));
      emit(
        ProfileSuccess(
          profileModel: updatedModel,
          selectedImage: null,
        ),
      );
      pickedImage = null;
    } on DioException catch (e) {
      emit(
        ProfileFailure(errorMessage: e.response?.data['message'] ?? e.message),
      );
    }
  }
}
