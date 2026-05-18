import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/assets.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/core/widgets/custom_buttom.dart';
import 'package:wander_wise_app/features/FlightBook/presentation/views/widgets/choose_adultpassengers_number.dart';
import 'package:wander_wise_app/features/FlightBook/presentation/views/widgets/choose_babypassengers_number.dart';
import 'package:wander_wise_app/features/FlightBook/presentation/views/widgets/guide_selection_row.dart';
import 'package:wander_wise_app/features/FlightBook/presentation/views/widgets/select_class_type.dart';
import 'package:wander_wise_app/features/FlightBook/presentation/views/widgets/select_country_from.dart';
import 'package:wander_wise_app/features/FlightBook/presentation/views/widgets/select_country_to.dart';
import 'package:wander_wise_app/features/FlightBook/presentation/views/widgets/select_flight_date.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class FlightBookBody extends StatelessWidget {
  const FlightBookBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagesPaths.flightBookImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: height * 0.3),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kprimaryColor,
                border: Border.all(
                  color: kprimaryColor4.withValues(alpha: 0.8),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  padding: EdgeInsets.only(top: 10),
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Book your flight     ',
                            style: textStyleSize15,
                          ),
                          Icon(Icons.flight_takeoff, color: kprimaryColor5),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'From:',
                      style: textStyleSize15.copyWith(fontSize: 17),
                    ),
                    const SizedBox(height: 5),
                    SelectCountryFrom(),
                    const SizedBox(height: 15),
                    Text(
                      'To:',
                      style: textStyleSize15.copyWith(fontSize: 17),
                    ),
                    const SizedBox(height: 5),
                    SelectCountryTo(),
                    const SizedBox(height: 15),
                    Text(
                      'Flight Date:',
                      style: textStyleSize15.copyWith(fontSize: 17),
                    ),
                    const SizedBox(height: 5),
                    SelectFlightDate(),
                    const SizedBox(height: 15),
                    Text(
                      'Passangers Number:',
                      style: textStyleSize15.copyWith(fontSize: 17),
                    ),
                    const SizedBox(height: 5),
                    Expanded(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: ChooseAdultpassengersNumber(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: ChooseBabypassengersNumber(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Travel Class:',
                      style: textStyleSize15.copyWith(fontSize: 17),
                    ),
                    const SizedBox(height: 5),
                    SelectClassType(),
                    const SizedBox(height: 15),
                    GuideSelectionRow(),
                    const SizedBox(height: 15),
                    CustomBottom(
                      title: 'Book',
                      ontap: () {
                        GoRouter.of(context).push(AppRouter.kWelcomeCarView);
                      },
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
