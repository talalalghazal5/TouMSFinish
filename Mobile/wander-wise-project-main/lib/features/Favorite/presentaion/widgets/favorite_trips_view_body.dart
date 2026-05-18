import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/widgets/custom_tour_card.dart';
import 'package:wander_wise_app/features/Tours/logic/TourCubit/tour_cubit.dart';
import 'package:wander_wise_app/features/Tours/logic/TourCubit/tour_state.dart';

class FavoriteTripsViewBody extends StatelessWidget {
  const FavoriteTripsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TourCubit, TourState>(
      builder: (context, state) {
        if (state is TourLoading) {
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

        if (state is TourSuccess) {
          final favoriteTours = state.tours
              .where((tour) => tour.isFavorite)
              .toList();

          if (favoriteTours.isEmpty) {
            return Center(child: Text("No favorites yet"));
          }

          return GridView.builder(
            itemCount: favoriteTours.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 0.8,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              final tour = favoriteTours[index];

              return CustomTourCard(
                initialFavorite: tour.isFavorite,
                id: tour.id!,
                imagePath: tour.image ?? '',
                destinationName: tour.tourName ?? 'no name',
                duration: tour.duration ?? 'no duration',
                price: "${tour.tourPrice}\$",
                description: tour.tourDescription ?? 'no description',
              );
            },
          );
        }

        if (state is TourFailure) {
          return Center(child: Text(state.errorMessage));
        }

        return SizedBox();
      },
    );
  }
}









