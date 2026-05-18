import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/widgets/show_date_picker.dart';
import 'package:wander_wise_app/features/Auth/presentation/views/widgets/custom_auth_field.dart';
import 'package:wander_wise_app/features/Profile/presentation/views/widgets/Profile/profile_header.dart';

class ProfileFields extends StatelessWidget {
  final double height;
  final bool isEditing;
  final TextEditingController emailController;
  final TextEditingController addressController;
  final TextEditingController birthDateController;
  final TextEditingController userNameController;
  const ProfileFields({
    super.key,
    required this.height,
    required this.isEditing,
    required this.emailController,
    required this.addressController,
    required this.birthDateController,
    required this.userNameController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withValues(alpha: 0.5),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(height: 10),
          ProfileHeader(controller: userNameController, isEditing: isEditing),
          SizedBox(height: 20),
          CustomAuthField(
            hinttext: 'Enter your Email Address',
            prefixIcon: const Icon(Icons.email),
            labeltext: 'Email Address',
            isPassword: false,
            isEditing: false,
            controller: emailController,
          ),
          SizedBox(height: height * 0.03),
          CustomAuthField(
            hinttext: 'Enter your address',
            prefixIcon: const Icon(Icons.location_city),
            isEditing: isEditing,
            controller: addressController,
            labeltext: 'Address',
            isPassword: false,
          ),
          SizedBox(height: height * 0.03),
          GestureDetector(
            onTap: isEditing
                ? () {
                    showDatePickerBottomSheet(
                      context: context,
                      controller: birthDateController,
                      onDateSelected: () {},
                    );
                  }
                : null,
            child: AbsorbPointer(
              child: CustomAuthField(
                hinttext: 'Enter your Date of Birth',
                controller: birthDateController,
                labeltext: 'Date Of Birth',
                isEditing: isEditing,
                isPassword: false,
                prefixIcon: const Icon(Icons.calendar_today),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
