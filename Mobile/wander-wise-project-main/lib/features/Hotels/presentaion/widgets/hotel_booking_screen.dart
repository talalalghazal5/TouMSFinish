import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/core/widgets/custom_buttom.dart';
import 'package:wander_wise_app/features/BookCar/presentation/views/widgets/custom_car_text_field.dart';
import 'package:wander_wise_app/features/Hotels/logic/BookHotelCubit/book_hotel_cubit.dart';
import 'package:wander_wise_app/features/Hotels/logic/BookHotelCubit/book_hotel_state.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key});

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  final TextEditingController bookingIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mainExtra = GoRouterState.of(context).extra as Map<String, dynamic>;
    final hotelId = mainExtra['hotelId'] as int;
    final bookingId = mainExtra['bookingId'] as String;

    return BlocProvider(
      create: (context) => BookHotelCubit(ApiService()),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: BlocConsumer<BookHotelCubit, BookHotelState>(
                listener: (context, state) {
                  if (state is BookHotelSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        duration: Duration(milliseconds: 150),
                        backgroundColor: kprimaryColor1,
                        content: Text(state.message, style: textStyleSize15),
                      ),
                    );
                    Future.delayed(const Duration(seconds: 2), () {
                      GoRouter.of(context).pop();
                    });
                  } else if (state is BookHotelFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        duration: Duration(milliseconds: 150),
                        backgroundColor: kprimaryColor1,
                        content: Text(
                          state.errorMessage,
                          style: textStyleSize15,
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Enter Booking ID",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      CustomCarTextField(controller: bookingIdController),
                      const SizedBox(height: 20),

                      // لو كان لودينغ عرض زر مع دائرة دوران
                      if (state is BookHotelLoading)
                        const CircularProgressIndicator()
                      else
                        CustomBottom(
                          title: "Book Now",
                          ontap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<BookHotelCubit>().storeHotel(
                                bookingId: bookingIdController.text,
                                hotelId: hotelId,
                              );
                            }
                          },
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
