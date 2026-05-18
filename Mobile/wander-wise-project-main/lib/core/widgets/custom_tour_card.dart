import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/network/endpoints.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/core/widgets/custom_tour_favorite_row.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class CustomTourCard extends StatelessWidget {
  const CustomTourCard({
    super.key,
    required this.imagePath,
    required this.destinationName,
    required this.description,
    required this.duration,
    required this.price,
    required this.id,
    required this.initialFavorite,
  });
  final String imagePath;
  final String destinationName;
  final String description;
  final String duration;
  final String price;
  final int id;
  final bool initialFavorite;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDestinationsToEachTourView , extra: destinationName);
        // GoRouter.of(context).push(AppRouter.kBookingIdView);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          height: height * 0.6,
          width: width * 0.9,
          decoration: BoxDecoration(
            color: kprimaryColor,
            boxShadow: [
              BoxShadow(
                color: kprimaryColor5,
                blurRadius: 0.4,
                offset: Offset(4, 4),
              ),
            ],
            border: Border.all(color: kprimaryColor4.withValues(alpha: 0.8)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Container(
                  height: height * 0.25,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(color: kprimaryColor5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        '${Endpoints.imageBaseUrl}$imagePath',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTourFavoriteRow(
                          tourId: id,
                          initialFavorite: initialFavorite,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "..$destinationName..",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textStyleSize20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.timelapse, color: kprimaryColor6),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "duration : $duration",
                            style: textStyleSize15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.dollarSign,
                          color: kprimaryColor6,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "Average prices : $price",
                            style: textStyleSize15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Description:",
                      style: textStyleSize15,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      description,
                      style: textStyleSize15,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Show Destinations in this Tour",
                        style: textStyleSize15,
                      ),
                      Icon(
                        Icons.arrow_circle_right_rounded,
                        color: kprimaryColor6,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
