
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/features/Tours/logic/TourCubit/tour_cubit.dart';
import 'package:wander_wise_app/features/Tours/logic/TourCubit/tour_state.dart';

class CustomTourFavoriteRow extends StatelessWidget {
  final int tourId;
  final bool initialFavorite;

  const CustomTourFavoriteRow({
    super.key,
    required this.tourId,
    required this.initialFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 18.5,
            backgroundColor: Colors.white,
            child: BlocBuilder<TourCubit, TourState>(
              builder: (context, state) {
                bool isFavorite = false;
                if (state is TourSuccess) {
                  final tour = state.tours.firstWhere((t) => t.id == tourId);
                  isFavorite = tour.isFavorite;
                }

                return IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () async {
                    final cubit = context.read<TourCubit>();
                    if (isFavorite) {
                      await cubit.removeFromFavorite(tourId);
                    } else {
                      await cubit.addToFavorite(tourId);
                    }
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border_sharp,
                    color: isFavorite ? Colors.red : kprimaryColor4,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
