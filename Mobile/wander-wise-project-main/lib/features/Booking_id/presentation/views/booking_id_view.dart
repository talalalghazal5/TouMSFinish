import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/Booking_id/logic/Booking_IdCubit/booking_id_cubit.dart';
import 'package:wander_wise_app/features/Booking_id/presentation/widgets/booking_id_view_body.dart';

class BookingIdView extends StatelessWidget {
  const BookingIdView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingIdCubit(ApiService()),
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              const Text('Booking_id', style: textStyleSize20),
              const SizedBox(height: 10),
              Container(width: 150, height: 2, color: kprimaryColor4),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: const BookingIdViewBody(),
      ),
    );
  }
}
