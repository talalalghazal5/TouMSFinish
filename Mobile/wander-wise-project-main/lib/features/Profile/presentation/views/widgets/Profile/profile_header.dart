import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';

class ProfileHeader extends StatelessWidget {
  final TextEditingController controller;
  final bool isEditing;

  const ProfileHeader({
    super.key,
    required this.controller,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: TextField(
            showCursor: false,
            textAlign: TextAlign.center,
            enabled: isEditing,
            controller: controller,
            cursorColor: kprimaryColor5,
            style: TextStyle(color: kprimaryColor, fontSize: 22),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.transparent, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
