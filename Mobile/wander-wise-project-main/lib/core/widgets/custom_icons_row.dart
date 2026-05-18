import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';

class CustomCardIconsRow extends StatefulWidget {
  const CustomCardIconsRow({
    super.key,
  });
  @override
  State<CustomCardIconsRow> createState() => _CustomCardIconsRowState();
}

class _CustomCardIconsRowState extends State<CustomCardIconsRow> {
  bool isFavorite = false;
  double userRating = 4.9;

  
  void showRatingDialog() {

  showDialog(
    context: context,
    builder: (context) {
      int tempRating = userRating.toInt();
      return Dialog(
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.all(20), 
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Rate this trip', style: textStyleSize25),
              const SizedBox(height: 20),
              StatefulBuilder(
                builder: (context, setStateDialog) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          index < tempRating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 32,
                        ),
                        onPressed: () {
                          setStateDialog(() {
                            tempRating = index + 1;
                          });
                        },
                      );
                    }),
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel', style: TextStyle(color: kprimaryColor4)),
                  ),
                  TextButton(
                    onPressed: () {
                      if (tempRating > 0) {
                        setState(() {
                          userRating = tempRating.toDouble();
                        });
                      }
                      Navigator.pop(context);
                    },
                    child: const Text('Submit', style: TextStyle(color: kprimaryColor6)),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: showRatingDialog,
            child: Container(
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
                  Text(
                    userRating.toStringAsFixed(1),
                    style: textStyleSize14,
                  ),
                ],
              ),
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
                  isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border_sharp,
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
