import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/Auth/presentation/views/widgets/custom_text_field.dart';

class CustomAuthField extends StatefulWidget {
  const CustomAuthField({
    super.key,
    required this.labeltext,
    required this.isPassword,
    required this.isEditing,
    required this.hinttext,
    required this.prefixIcon,
    this.keyboardType,
    this.controller,
    this.confirmPasswordAgainst, this.onChanged,
  });
  final Widget? prefixIcon;
  final String? labeltext;
  final String hinttext;
  final TextInputType? keyboardType;
  final bool isPassword;
  final bool isEditing;
  final TextEditingController? controller;
  final TextEditingController? confirmPasswordAgainst;
 final void Function(String)? onChanged;
  @override
  State<CustomAuthField> createState() => _CustomAuthFieldState();
}

class _CustomAuthFieldState extends State<CustomAuthField> {
  bool isObscure = true;

  void passwordVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${widget.labeltext}", style:textStyleSize15 ),
          CustomTextfield(
            onChanged:widget.onChanged ,
            prefixIcon: widget.prefixIcon,
            hinttext: widget.hinttext,
            keyboardType: widget.keyboardType,
            isEditing: widget.isEditing,
            isPassword: widget.isPassword,
            confirmPasswordAgainst: widget.confirmPasswordAgainst,
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}
