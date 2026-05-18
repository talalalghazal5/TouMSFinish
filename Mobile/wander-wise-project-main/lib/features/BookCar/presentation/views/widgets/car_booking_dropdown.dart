import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';

class CarBookingDropdown extends StatelessWidget {
  final String title;
  final String hint;
  final List<String> items;
  final String? selectedValue;
  final Function(String?) onChanged;

  const CarBookingDropdown({
    super.key,
    required this.title,
    required this.hint,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textStyleSize15),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: kprimaryColor2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              style: textStyleSize15,padding: EdgeInsets.symmetric(horizontal: 10),
              hint: Text(hint, style: textStyleSize15),
              icon: const Icon(Icons.arrow_drop_down, color: kprimaryColor5),
              isExpanded: true,
              onChanged: onChanged,
              items: items.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}