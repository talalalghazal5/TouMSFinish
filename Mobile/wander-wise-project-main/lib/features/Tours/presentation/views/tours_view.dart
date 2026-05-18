import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/Tours/logic/TourCubit/tour_cubit.dart';
import 'package:wander_wise_app/features/Tours/presentation/widgets/tours_view_body.dart';

class ToursView extends StatefulWidget {
  const ToursView({super.key});

  @override
  State<ToursView> createState() => _ToursViewState();
}

class _ToursViewState extends State<ToursView> {
  @override
  void initState() {
    super.initState();
    context.read<TourCubit>().gettours();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TourCubit(ApiService())..gettours(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kprimaryColor,
          title: Text('Tours', style: textStyleSize20),
          centerTitle: true,
        ),
        body: SafeArea(child: ToursViewBody()),
      ),
    );
  }
}
