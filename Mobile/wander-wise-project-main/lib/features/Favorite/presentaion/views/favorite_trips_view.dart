import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/Favorite/presentaion/widgets/favorite_trips_view_body.dart';
import 'package:wander_wise_app/features/Tours/logic/TourCubit/tour_cubit.dart';

class FavoriteTripsView extends StatefulWidget {
  const FavoriteTripsView({super.key});

  @override
  State<FavoriteTripsView> createState() => _FavoriteTripsViewState();
}

class _FavoriteTripsViewState extends State<FavoriteTripsView> {
  @override
  void initState() {
    super.initState();
    context.read<TourCubit>().gettours();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        title: Text('FavoriteTours', style: textStyleSize20),
        centerTitle: true,
      ),
      body: SafeArea(child: FavoriteTripsViewBody()),
    );
  }
}
