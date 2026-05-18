import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    required this.isPassword,
    required this.isEditing,
    required this.prefixIcon,
    this.controller,
    required this.hinttext,
    this.keyboardType,
    this.confirmPasswordAgainst, this.onChanged,
  });

  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool isPassword;
  final bool isEditing;
  final String hinttext;
  final TextEditingController? controller;
  final TextEditingController? confirmPasswordAgainst;
  final void Function(String)? onChanged;
  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool isObscure = true;

  void passwordVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEditing,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      cursorColor: kprimaryColor5,
      validator: (value) {
        if (widget.isPassword && value!.length < 8) {
          return 'Password should be at least 8 characters';
        }
        if (widget.keyboardType == TextInputType.emailAddress) {
          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!emailRegex.hasMatch(value!)) {
            return 'Please enter a valid email address';
          }
        }
        if (value == null || value.isEmpty) {
          return 'this Field is required';
        }
        if (widget.confirmPasswordAgainst != null &&
            value != widget.confirmPasswordAgainst!.text) {
          return 'Passwords do not match';
        }
        return null;
      },
      obscureText: widget.isPassword ? isObscure : false,
      style: TextStyle(color: kprimaryColor5, fontSize: 17),
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 15, color: Colors.red),
        filled: true,
        fillColor: Colors.white,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kprimaryColor3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kprimaryColor3),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kprimaryColor3),
        ),
        hintText: widget.hinttext,
        hintStyle: TextStyle(color: kprimaryColor6, fontSize: 12),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: widget.prefixIcon,
            ),
            Container(
              height: 25,
              width: 2,
              color: kprimaryColor4,
              margin: EdgeInsets.symmetric(horizontal: 8),
            ),
          ],
        ),
        prefixIconColor: kprimaryColor6,
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: kprimaryColor5,
                ),
                onPressed: passwordVisibility,
              )
            : null,
      ),
    );
  }
}
