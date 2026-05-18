import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';

class SelectCountryFrom extends StatefulWidget {
  const SelectCountryFrom({super.key});

  @override
  State<SelectCountryFrom> createState() => _SelectCountryFromState();
}

class _SelectCountryFromState extends State<SelectCountryFrom> {
  String? selectedCountryFrom;
  List<String> countries = [
    'France',
    'Italy',
    'Japan',
    'Turkey',
    'United Arab Emirates',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: kprimaryColor2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          style: textStyleSize15,
          dropdownColor: kprimaryColor,
          value: selectedCountryFrom,
          hint: const Text('Select country', style: textStyleSize15),
          icon: const Icon(Icons.arrow_drop_down, color: kprimaryColor5),
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedCountryFrom = value;
            });
          },
          items: countries.map((country) {
            return DropdownMenuItem(value: country, child: Text(country));
          }).toList(),
        ),
      ),
    );
  }
}
