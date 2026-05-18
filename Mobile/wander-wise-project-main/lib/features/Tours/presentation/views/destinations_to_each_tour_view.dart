import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/Tours/logic/TourDestinationsCubit/tour_destinations_cubit.dart';
import 'package:wander_wise_app/features/Tours/presentation/widgets/destinations_to_each_tour_view_body.dart';

class DestinationsToEachTourView extends StatelessWidget {
  const DestinationsToEachTourView({super.key});

  @override
  Widget build(BuildContext context) {
    final String tourName = GoRouterState.of(context).extra.toString();
    return BlocProvider(
      create: (context) => TourDestinationsCubit(ApiService())..getDestinationToEachTour(tourName),
      child: Scaffold(
        appBar: AppBar(title: Text("Destinations", style: textStyleSize20)),
        body: DestinationsToEachTourViewBody(),
      ),
    );
  }
}
