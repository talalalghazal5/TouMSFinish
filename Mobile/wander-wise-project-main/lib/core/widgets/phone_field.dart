import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';

class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField({super.key, this.isEditing, this.controller});
  final bool? isEditing;
  final TextEditingController? controller;
  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Phone Number:', style: textStyleSize15),
          IntlPhoneField(
            flagsButtonPadding: EdgeInsetsGeometry.symmetric(
              horizontal: 10,
              vertical: 17,
            ),
            controller: widget.controller,
            enabled: widget.isEditing ?? true,
            cursorColor: kprimaryColor7,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Phone Number',
              fillColor: kprimaryColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: kprimaryColor4),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: kprimaryColor4),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: kprimaryColor4),
              ),
            ),
            initialCountryCode: 'SY',
            style: textStyleSize15,
            onChanged: (phone) {
              print(phone.completeNumber);
            },
          ),
        ],
      ),
    );
  }
}
