import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/Booking_id/logic/Booking_IdCubit/booking_id_cubit.dart';
import 'package:wander_wise_app/features/Booking_id/logic/Booking_IdCubit/booking_id_state.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class BookingIdViewBody extends StatefulWidget {
  const BookingIdViewBody({super.key});

  @override
  State<BookingIdViewBody> createState() => _BookingIdViewBodyState();
}

class _BookingIdViewBodyState extends State<BookingIdViewBody> {
  final List<String> serviceTypes = ['CarHire', 'Flight', 'Hotel'];
  String? selectedService;

  final List<String> serviceLevels = ['economy', 'VIP', 'super'];
  String? selectedLevel;

  final TextEditingController countController = TextEditingController();
  int? bookingId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final mainExtra = GoRouterState.of(context).extra as Map<String, dynamic>;
    final extra = mainExtra['Type'];
    if (extra != null && extra is String && serviceTypes.contains(extra)) {
      setState(() {
        selectedService = extra;
      });
    }
  }

  @override
  void dispose() {
    countController.dispose();
    super.dispose();
  }

  void submitBookingRequest() {
    if (selectedService != null &&
        selectedLevel != null &&
        countController.text.isNotEmpty) {
      final int? count = int.tryParse(countController.text);
      if (count == null || count <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            duration: const Duration(seconds: 2),
            backgroundColor: kprimaryColor1,
            content: const Text(
              'Please enter a valid number of seats/rooms',
              style: textStyleSize15,
            ),
          ),
        );
        return;
      }

      context.read<BookingIdCubit>().getBookingId(
        bookingFor: selectedService!,
        bookingStatus: selectedLevel!,
        number: count,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: kprimaryColor1,
          content: Text(
            'Please fill all fields to generate booking ID',
            style: textStyleSize15,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mainExtra = GoRouterState.of(context).extra as Map<String, dynamic>;
    final hotelId = mainExtra['hotelid'] as int;
    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        const Text(
          'fill fields to get your booking_id 🎟️',
          style: textStyleSize15,
        ),
        const SizedBox(height: 20),
        const Text('Service Type:', style: textStyleSize15),
        ...serviceTypes.map(
          (type) => RadioListTile<String>(
            title: Text(type, style: textStyleSize15),
            value: type,
            activeColor: kprimaryColor6,
            groupValue: selectedService,
            onChanged: (value) {},
          ),
        ),
        const SizedBox(height: 10),
        const Text('Choose status:', style: textStyleSize15),
        ...serviceLevels.map(
          (level) => RadioListTile<String>(
            title: Text(level, style: textStyleSize15),
            value: level,
            activeColor: kprimaryColor6,
            groupValue: selectedLevel,
            onChanged: (value) {
              setState(() => selectedLevel = value);
            },
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: countController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'seats/rooms/cars ...number',
            labelStyle: textStyleSize14,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: kprimaryColor5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: kprimaryColor5),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: ElevatedButton(
            onPressed: submitBookingRequest,
            style: ElevatedButton.styleFrom(
              backgroundColor: kprimaryColor,
              shadowColor: kprimaryColor5,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('get your id now', style: textStyleSize15),
            ),
          ),
        ),
        const SizedBox(height: 20),
        BlocConsumer<BookingIdCubit, BookingIdState>(
          listener: (context, state) {
            if (state is BookingIdFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            if (state is BookingIdLoading) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: LoadingAnimationWidget.progressiveDots(
                    color: kprimaryColor3,
                    size: 40,
                  ),
                ),
              );
            } else if (state is BookingIdSuccess) {
              final booking = state.bookingIdModel;
              bookingId = booking.id!;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: kprimaryColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: kprimaryColor2, width: 1.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Booking ID: $bookingId', style: textStyleSize20),
                        IconButton(
                          icon: const Icon(Icons.copy, color: kprimaryColor7),
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(text: "$bookingId"),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                duration: const Duration(seconds: 2),
                                backgroundColor: kprimaryColor1,
                                content: Text(
                                  'Booking ID copied to clipboard ✅',
                                  style: textStyleSize15,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  IconButton(
                    onPressed: () {
                      if (selectedService == 'CarHire') {
                        GoRouter.of(context).pop();
                        GoRouter.of(context).push(AppRouter.kWelcomeCarView);
                      }
                      if (selectedService == 'Flight') {
                        //
                      }
                      if (selectedService == 'Hotel') {
                        GoRouter.of(context).pop();
                        GoRouter.of(context).push(
                          AppRouter.kHotelBookingScreen,
                          extra: {"bookingId": "$bookingId", "hotelId": hotelId},
                        );
                      }
                    },
                    icon: Icon(
                      Icons.arrow_circle_right_rounded,
                      size: 40,
                      color: kprimaryColor7,
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
