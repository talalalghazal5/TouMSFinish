import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';

class GuideSelectionRow extends StatefulWidget {
  const GuideSelectionRow({super.key});

  @override
  State<GuideSelectionRow> createState() => _GuideSelectionRowState();
}

class _GuideSelectionRowState extends State<GuideSelectionRow> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildOption('with', 'with a private guide 👤✔️'),
          buildOption('without', 'without a guide 👤✖️'),
        ],
      ),
    );
  }

  Widget buildOption(String value, String label) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: selectedOption,
          activeColor: kprimaryColor7,
          onChanged: (value) {
            setState(() {
              selectedOption = value;
            });
          },
        ),
        Text(label, style: textStyleSize15),
      ],
    );
  }
}
