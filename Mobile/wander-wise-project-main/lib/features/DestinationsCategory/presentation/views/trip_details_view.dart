import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/DestinationsCategory/data/models/destinationModel/destination_model.dart';
import 'package:wander_wise_app/features/DestinationsCategory/presentation/views/widgets/tripDetails/trip_details_body.dart';

class TripDetailsView extends StatelessWidget {
  const TripDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final DestinationModel details =
        GoRouterState.of(context).extra as DestinationModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Destination Details', style: textStyleSize25),
          centerTitle: true,
          backgroundColor: kprimaryColor,
        ),
        body: Container(
          color: kprimaryColor,
          child: TripDetailsBody(
            mainImage: details.image1 ?? '',
            image1: details.image2 ?? '',
            image2: details.image3 ?? '',
            image3: details.image4 ?? '',
            description: details.description ?? 'no description',
            destinationName: details.destinationName ?? 'no name',
            location: details.country ?? 'no location',
          ),
        ),
      ),
    );
  }
}
