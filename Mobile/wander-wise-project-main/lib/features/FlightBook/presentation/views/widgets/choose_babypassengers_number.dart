import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChooseBabypassengersNumber extends StatefulWidget {
  const ChooseBabypassengersNumber({super.key});

  @override
  State<ChooseBabypassengersNumber> createState() =>
      _ChooseBabypassengersNumberState();
}

class _ChooseBabypassengersNumberState
    extends State<ChooseBabypassengersNumber> {
  int numberOfBaby = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 55,
          width: 140,
          decoration: BoxDecoration(
            border: Border.all(color: kprimaryColor2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(FontAwesomeIcons.child, color: kprimaryColor5),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                child: Container(color: kprimaryColor5, width: 0.4),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                  width: 35,
                  child: Center(
                    child: Text('$numberOfBaby', style: textStyleSize20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                child: Container(color: kprimaryColor5, width: 0.4),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        numberOfBaby++;
                      });
                    },
                    child: Icon(Icons.arrow_drop_up, color: kprimaryColor5),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (numberOfBaby != 0) {
                          numberOfBaby--;
                        }
                      });
                    },
                    child: Icon(Icons.arrow_drop_down, color: kprimaryColor5),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text('(Ages 1 to 17)', style: textStyleSize14.copyWith(fontSize: 12)),
      ],
    );
  }
}
