import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';

class SelectFlightDate extends StatefulWidget {
  const SelectFlightDate({super.key});

  @override
  State<SelectFlightDate> createState() => _SelectFlightDateState();
}

class _SelectFlightDateState extends State<SelectFlightDate> {
  DateTime? selectedDate;
  Future pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: kprimaryColor2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            selectedDate == null
                ? 'select Date to your Flight'
                : 'date: ${selectedDate!.toLocal().toString().split(' ')[0]}',
            style: textStyleSize15,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kprimaryColor,
              elevation: 4,
              shadowColor: kprimaryColor5,
            ),
            onPressed: () => pickDate(context),
            child: Icon(Icons.date_range, color: kprimaryColor7),
          ),
        ],
      ),
    );
  }
}
