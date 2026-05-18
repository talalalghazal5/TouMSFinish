import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';

class CustomOuterIconsRow extends StatefulWidget {
  const CustomOuterIconsRow({super.key});

  @override
  State<CustomOuterIconsRow> createState() => _CustomOuterIconsRowState();
}

class _CustomOuterIconsRowState extends State<CustomOuterIconsRow> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 27,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.star, color: Colors.amber),
                Text("4.9", style: textStyleSize14),
              ],
            ),
          ),
          CircleAvatar(
            radius: 18.5,
            backgroundColor: Colors.white,
            child: Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_sharp,
                  color: isFavorite ? Colors.red : kprimaryColor4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
