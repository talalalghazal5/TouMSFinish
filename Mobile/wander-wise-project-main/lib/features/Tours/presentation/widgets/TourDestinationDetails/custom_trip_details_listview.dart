import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/core/widgets/custom_buttom.dart';
import 'package:wander_wise_app/features/DestinationsCategory/presentation/views/widgets/tripDetails/custom_location_details.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class CustomTourDestinationsListview extends StatelessWidget {
  const CustomTourDestinationsListview({
    super.key,
    required this.destinationName,
    required this.location,
    required this.description,
  });
  final String destinationName;
  final String location;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kprimaryColor4,
              ),
            ),
          ),
           Center(
                  child: Text('.. $destinationName ..', style: textStyleSize30),
                ),
          Expanded(
            child: ListView(
              children: [
                CustomLocationDetails(location: location),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Description : ', style: textStyleSize20),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 8,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      style: textStyleSize14,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      description,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: kprimaryColor6),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: CustomBottom(
                          title: 'Book a flight',
                          ontap: () {
                            GoRouter.of(context).push(AppRouter.kBookingIdView , extra: {'Type':"CarHire",'hotelid':0});
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
