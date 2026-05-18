import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/assets.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/core/widgets/custom_trip_card.dart';
import 'package:wander_wise_app/features/DestinationsCategory/logic/HistoricalCubit/historical_cubit.dart';
import 'package:wander_wise_app/features/DestinationsCategory/logic/HistoricalCubit/historical_state.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class HistoricalTripsView extends StatelessWidget {
  const HistoricalTripsView({super.key});

  static final List<String> images = [
    ImagesPaths.placeImage,
    ImagesPaths.detailsImage1,
    ImagesPaths.detailsImage2,
    ImagesPaths.detailsImage3,
    ImagesPaths.concord,
    ImagesPaths.louvreMuseum,
    ImagesPaths.shanshalizaStreet,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocConsumer<HistoricalCubit, HistoricalState>(
        listener: (context, state) {
          if (state is HistoricalFailure) {
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
          if (state is HistoricalFailure) {
            return Center(child: Text(state.errorMessage));
          }
          if (state is HistoricalLoading) {
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
          if (state is HistoricalSuccess) {
            final destinations = state.destinations;
            return GridView.builder(
              itemCount: destinations.length,
              clipBehavior: Clip.none,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.67,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                final destination = destinations[index];
                print("////////////// ${destination}");
                return CustomTripCard(
                  ontap: () {
                    GoRouter.of(
                      context,
                    ).push(AppRouter.kTripDetailsView, extra: destination);
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
