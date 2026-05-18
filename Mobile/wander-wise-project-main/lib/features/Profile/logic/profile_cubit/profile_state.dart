
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:wander_wise_app/features/Profile/data/ProfileModel/profile_model.dart';

abstract class ProfileState extends Equatable {
  final File? selectedImage;

  const ProfileState({this.selectedImage});

  @override
  List<Object?> get props => [selectedImage];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial() : super();
}

class ProfileLoading extends ProfileState {
  const ProfileLoading({super.selectedImage});
}

class ProfileSuccess extends ProfileState {
  final ProfileModel profileModel;
  const ProfileSuccess({
    required this.profileModel,
    super.selectedImage,
  });

  @override
  List<Object?> get props => [selectedImage, profileModel];
}

class ProfileFailure extends ProfileState {
  final String errorMessage;
  const ProfileFailure({
    required this.errorMessage,
    super.selectedImage,
  });

  @override
  List<Object?> get props => [selectedImage, errorMessage];
}

class ProfileSaved extends ProfileState {
  final ProfileModel profileModel;
  const ProfileSaved({
    required this.profileModel,
    super.selectedImage,
  });

  @override
  List<Object?> get props => [selectedImage, profileModel];
}

class ProfileEditing extends ProfileState {
  final ProfileModel profileModel;
  const ProfileEditing({
    required this.profileModel,
    super.selectedImage,
  });

  @override
  List<Object?> get props => [selectedImage, profileModel];
}
