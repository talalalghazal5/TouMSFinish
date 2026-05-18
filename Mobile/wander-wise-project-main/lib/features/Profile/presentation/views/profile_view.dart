import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/Profile/logic/profile_cubit/profile_state.dart';
import 'package:wander_wise_app/features/Profile/logic/profile_cubit/proflie_cubit.dart';
import 'package:wander_wise_app/features/Profile/presentation/views/widgets/Profile/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(ApiService()),
      child: Builder(
        builder: (context) => SafeArea(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                'Profile',
                style: textStyleSize25.copyWith(color: kprimaryColor),
              ),
              actions: [
                PopupMenuButton<String>(
                  color: Colors.white,
                  shadowColor: kprimaryColor3,
                  icon: Icon(Icons.more_vert, size: 30, color: kprimaryColor),
                  onSelected: (value) {
                    if (value == 'edit') {
                      final currentState = context.read<ProfileCubit>().state;
                      if (currentState is ProfileSuccess) {
                        context.read<ProfileCubit>().startEditing(
                          currentState.profileModel,
                        );
                      }
                    }
                  },
                  itemBuilder: (_) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text(
                        'Edit your profile 👤',
                        style: textStyleSize15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            body: const ProfileViewBody(),
          ),
        ),
      ),
    );
  }
}
