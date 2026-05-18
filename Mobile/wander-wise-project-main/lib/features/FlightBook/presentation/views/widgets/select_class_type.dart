import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';

class SelectClassType extends StatefulWidget {
  const SelectClassType({super.key});

  @override
  State<SelectClassType> createState() => _SelectClassTypeState();
}

class _SelectClassTypeState extends State<SelectClassType> {
  String? selectedClass;
  List<String> countries = ['Economy Class', 'Business Class', 'First Class'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 140,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: kprimaryColor2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedClass,
          dropdownColor: kprimaryColor,
          hint: const Text('Select class', style: textStyleSize15),
          icon: const Icon(Icons.arrow_drop_down, color: kprimaryColor5),
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selectedClass = value;
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
