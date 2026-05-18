// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// void showDatePickerBottomSheet({
//   required BuildContext context,
//   required TextEditingController controller,
//   required VoidCallback onDateSelected,
// }) {
//   DateTime selectedDate = DateTime.now();

//   showModalBottomSheet(
//     context: context,
//     builder: (context) {
//       return SizedBox(
//         height: 250,
//         child: Column(
//           children: [
//             Expanded(
//               child: CupertinoDatePicker(
//                 mode: CupertinoDatePickerMode.date,
//                 initialDateTime: selectedDate,
//                 maximumDate: DateTime.now(),
//                 minimumYear: 1900,
//                 maximumYear: DateTime.now().year,
//                 onDateTimeChanged: (newDate) {
//                   selectedDate = newDate;
//                 },
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 controller.text =
//                     "${selectedDate.year.toString().padLeft(4, '0')}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";

//                 Navigator.of(context).pop();
//                 onDateSelected();
//               },
//               child: const Text("Done"),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showDatePickerBottomSheet({
  required BuildContext context,
  required TextEditingController controller,
  required VoidCallback onDateSelected,
  DateTime? initialDate,
}) {
  DateTime selectedDate = initialDate ?? DateTime.now();

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SizedBox(
        height: 250,
        child: Column(
          children: [
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: selectedDate,
                maximumDate: DateTime.now(),
                minimumYear: 1900,
                maximumYear: DateTime.now().year,
                onDateTimeChanged: (newDate) {
                  selectedDate = newDate;
                },
              ),
            ),
            TextButton(
              onPressed: () {
                // تحديث النص مع تنسيق مرتب
                controller.text = DateFormat('dd-MM-yyyy').format(selectedDate);
                Navigator.of(context).pop();
                onDateSelected();
              },
              child: const Text("Done"),
            ),
          ],
        ),
      );
    },
  );
}
