import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:intl/intl.dart';

class CarBookimgDatePicker extends StatefulWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected; 

  const CarBookimgDatePicker({
    super.key,
    this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<CarBookimgDatePicker> createState() => _CarBookimgDatePickerState();
}

class _CarBookimgDatePickerState extends State<CarBookimgDatePicker> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate;
  }

  Future pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2032),
      initialDate: _selectedDate ?? DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onDateSelected(picked);  
      print('Selected date is: $_selectedDate');
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
            _selectedDate == null
                ? 'Pickdate'
                : 'Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
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

