import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/DestinationsCategory/presentation/views/comments-buttom_sheet.dart';

class CustomLocationDetails extends StatelessWidget {
  const CustomLocationDetails({super.key, required this.location});
final String location;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Location: ',
                style: textStyleSize20,
              ),
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: kprimaryColor5),
                Text(
                  location,
                  style: textStyleSize14,
                ),
              ],
            ),
          ],
        ),
        
      ],
    );
  }
}

// IconButton(
//           onPressed: () {
//             showModalBottomSheet(
//               context: context,
//               isScrollControlled: true,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//               ),
//               builder: (context) => const CommentsBottomSheet(),
//             );
//           },
//           icon: Icon(Icons.comment, color: kprimaryColor5),
//         ),