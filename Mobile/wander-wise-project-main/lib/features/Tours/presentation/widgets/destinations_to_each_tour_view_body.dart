import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/core/widgets/custom_trip_card.dart';
import 'package:wander_wise_app/features/Tours/logic/TourDestinationsCubit/tour_destinations_cubit.dart';
import 'package:wander_wise_app/features/Tours/logic/TourDestinationsCubit/tour_destinations_state.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class DestinationsToEachTourViewBody extends StatelessWidget {
  const DestinationsToEachTourViewBody({super.key});
  @override
  Widget build(BuildContext context) {
       return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocConsumer<TourDestinationsCubit, TourDestinationsState>(
        listener: (context, state) {
          if (state is TourDestinationsFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                duration: Duration(seconds: 2),
                backgroundColor: kprimaryColor1,
                content: Text(state.errorMessage, style: textStyleSize15),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TourDestinationsFailure) {
            return Center(child: Text(state.errorMessage));
          }
          if (state is TourDestinationsLoading) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: LoadingAnimationWidget.discreteCircle(
                  color: kprimaryColor3,
                  size: 40,
                ),
              ),
            );
          }
          if (state is TourDestinationsSuccess) {
            final destinations = state.tourDestinationModel;
            return GridView.builder(
              itemCount: destinations.length,
              clipBehavior: Clip.none,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.67,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                final destination = state.tourDestinationModel[index];
                print("////////////// ${destination}");
                return CustomTripCard(
                  ontap: () {
                    GoRouter.of(
                      context,
                    ).push(AppRouter.kTourDestinationDetailsView, extra: destination);
                  },
                  type: destination.destinationType ?? 'no type',
                  imagePath: destination.image1 ?? '',
                  destinationName:
                      destination.destinationName ?? 'no name',
                  location: destination.country ?? 'no country',
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
