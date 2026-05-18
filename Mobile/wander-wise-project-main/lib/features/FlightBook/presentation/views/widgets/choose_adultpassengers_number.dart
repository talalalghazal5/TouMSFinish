import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';

class ChooseAdultpassengersNumber extends StatefulWidget {
  const ChooseAdultpassengersNumber({super.key});

  @override
  State<ChooseAdultpassengersNumber> createState() =>
      _ChooseAdultpassengersNumberState();
}

class _ChooseAdultpassengersNumberState
    extends State<ChooseAdultpassengersNumber> {
  int numberOfAdults = 0;
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
              Icon(FontAwesomeIcons.person, color: kprimaryColor5),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                child: Container(color: kprimaryColor5, width: 0.4),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                  width: 35,
                  child: Center(
                    child: Text('$numberOfAdults', style: textStyleSize20),
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
                        numberOfAdults++;
                      });
                    },
                    child: Icon(Icons.arrow_drop_up, color: kprimaryColor5),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (numberOfAdults != 0) {
                          numberOfAdults--;
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
        Text(
          '(Ages 18 and above)',
          style: textStyleSize14.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
