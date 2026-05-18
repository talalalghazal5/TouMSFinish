import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';

class CarBookingTimePicker extends StatefulWidget {
  final TimeOfDay? selectedTime;
  final Function(TimeOfDay) onTimeSelected;

  const CarBookingTimePicker({
    super.key,
    this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  State<CarBookingTimePicker> createState() => _CarBookingTimePickerState();
}

class _CarBookingTimePickerState extends State<CarBookingTimePicker> {
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.selectedTime;
  }

  Future<void> _pickTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: kprimaryColor5),
            timePickerTheme: const TimePickerThemeData(
              hourMinuteColor: kprimaryColor2,
              hourMinuteTextColor: kprimaryColor5,
              dialTextColor: kprimaryColor5,
              dialHandColor: kprimaryColor2,
              dayPeriodColor: kprimaryColor2,
              dayPeriodTextColor: kprimaryColor5,
              backgroundColor: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() => _selectedTime = picked);
      widget.onTimeSelected(picked); // إرسال الوقت للـ parent
      print('Selected time: ${picked.hour}:${picked.minute}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Choose pickup time', style: textStyleSize15),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => _pickTime(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: kprimaryColor2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              _selectedTime == null
                  ? 'Choose time'
                  : _selectedTime!.format(context), // للعرض فقط
              style: textStyleSize15,
            ),
          ),
        ),
      ],
    );
  }
}
