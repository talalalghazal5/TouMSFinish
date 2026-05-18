// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:wander_wise_app/core/constants/constants.dart';
// import 'package:wander_wise_app/core/utils/styles.dart';
// import 'package:wander_wise_app/core/widgets/custom_buttom.dart';
// import 'package:wander_wise_app/features/BookCar/logic/BookCarCubit/book_car_cubit.dart';
// import 'package:wander_wise_app/features/BookCar/logic/BookCarCubit/book_car_state.dart';
// import 'package:wander_wise_app/features/BookCar/presentation/views/widgets/car_bookimg_date_picker.dart';
// import 'package:wander_wise_app/features/BookCar/presentation/views/widgets/car_booking_time_picker.dart';
// import 'package:wander_wise_app/features/BookCar/presentation/views/widgets/custom_car_text_field.dart';

// class CarBookingBottomSheet extends StatefulWidget {
//   const CarBookingBottomSheet({
//     super.key,
//     required this.cubit,
//     required this.rootContext,
//   });
//   final BookCarCubit cubit;
//   final BuildContext rootContext;

//   @override
//   State<CarBookingBottomSheet> createState() => _CarBookingBottomSheetState();
// }

// class _CarBookingBottomSheetState extends State<CarBookingBottomSheet> {
//   TimeOfDay? selectedTime;
//   DateTime? selectedDate;

//   final bookingIdController = TextEditingController();
//   final pickUpLocationController = TextEditingController();
//   final dropOffLocationController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     bookingIdController.dispose();
//     pickUpLocationController.dispose();
//     dropOffLocationController.dispose();
//     super.dispose();
//   }

//   void _submitForm(BookCarCubit cubit) {
//     if (selectedDate == null) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('Please select a date')));
//       return;
//     }

//     if (selectedTime == null) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('Please select a time')));
//       return;
//     }

//     int? bookingId = int.tryParse(bookingIdController.text);
//     if (bookingId == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Booking ID must be a number')),
//       );
//       return;
//     }
//     final pickupTimeString =
//         '${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}';

//     widget.cubit.storeCar(
//       pickUpLocation: pickUpLocationController.text,
//       dropOffLocation: dropOffLocationController.text,
//       pickupTime: pickupTimeString,
//       pickdate: selectedDate!,
//       bookingId: bookingId,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<BookCarCubit, BookCarState>(
//       listener: (context, state) {
//         if (state is BookCarFailure) {
//           ScaffoldMessenger.of(
//             widget.rootContext,
//           ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
//         } else if (state is BookCarSuccess) {
//           print("state is successfull .......................");

//           Navigator.of(context).pop();

//           ScaffoldMessenger.of(widget.rootContext).showSnackBar(
//             SnackBar(
//               content: Text(
//                 state.bookCarModel.message ?? 'Car booked successfully',
//               ),
//             ),
//           );
//         }
//       },
//       builder: (context, state) {
//         final cubit = context.read<BookCarCubit>();
//         return Container(
//           decoration: BoxDecoration(
//             color: kprimaryColor,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Padding(
//             padding: EdgeInsets.only(
//               bottom: MediaQuery.of(context).viewInsets.bottom,
//               left: 16,
//               right: 16,
//               top: 20,
//             ),
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.65,
//               color: kprimaryColor,
//               child: ListView(
//                 padding: EdgeInsets.zero,
//                 children: [
//                   Center(
//                     child: Container(
//                       width: 50,
//                       height: 5,
//                       decoration: BoxDecoration(
//                         color: kprimaryColor3,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   const Center(
//                     child: Text('Car Booking', style: textStyleSize25),
//                   ),
//                   const SizedBox(height: 30),

//                   // Booking ID
//                   Text('Enter Your Booking ID', style: textStyleSize15),
//                   const SizedBox(height: 8),
//                   CustomCarTextField(controller: bookingIdController),
//                   const SizedBox(height: 30),

//                   // Pick Up Location
//                   Text('Enter Pick Up Location', style: textStyleSize15),
//                   const SizedBox(height: 8),
//                   CustomCarTextField(controller: pickUpLocationController),
//                   const SizedBox(height: 30),

//                   // Drop Off Location
//                   Text('Enter Drop Off Location', style: textStyleSize15),
//                   const SizedBox(height: 8),
//                   CustomCarTextField(controller: dropOffLocationController),
//                   const SizedBox(height: 30),

//                   // Date picker
//                   CarBookimgDatePicker(
//                     selectedDate: selectedDate,
//                     onDateSelected: (date) =>
//                         setState(() => selectedDate = date),
//                   ),
//                   const SizedBox(height: 30),

//                   // Time picker
//                   CarBookingTimePicker(
//                     selectedTime: selectedTime,
//                     onTimeSelected: (value) =>
//                         setState(() => selectedTime = value),
//                   ),
//                   const SizedBox(height: 30),

//                   // Submit Button
//                   state is BookCarLoading
//                       ? Center(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 20),
//                             child: LoadingAnimationWidget.progressiveDots(
//                               color: kprimaryColor3,
//                               size: 40,
//                             ),
//                           ),
//                         )
//                       : CustomBottom(
//                           title: 'Book Your Car',
//                           ontap: () {
//                             _submitForm(cubit);
//                           },
//                         ),
//                   const SizedBox(height: 25),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/core/widgets/custom_buttom.dart';
import 'package:wander_wise_app/features/BookCar/logic/BookCarCubit/book_car_cubit.dart';
import 'package:wander_wise_app/features/BookCar/logic/BookCarCubit/book_car_state.dart';
import 'package:wander_wise_app/features/BookCar/presentation/views/widgets/car_bookimg_date_picker.dart';
import 'package:wander_wise_app/features/BookCar/presentation/views/widgets/car_booking_time_picker.dart';
import 'package:wander_wise_app/features/BookCar/presentation/views/widgets/custom_car_text_field.dart';

class CarBookingPage extends StatefulWidget {
  const CarBookingPage({super.key, required this.cubit});

  final BookCarCubit cubit;

  @override
  State<CarBookingPage> createState() => _CarBookingPageState();
}

class _CarBookingPageState extends State<CarBookingPage> {
  TimeOfDay? selectedTime;
  DateTime? selectedDate;

  final bookingIdController = TextEditingController();
  final pickUpLocationController = TextEditingController();
  final dropOffLocationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    bookingIdController.dispose();
    pickUpLocationController.dispose();
    dropOffLocationController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() != true) return;

    if (selectedDate == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a date')));
      return;
    }

    if (selectedTime == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a time')));
      return;
    }

    final bookingId = int.tryParse(bookingIdController.text);
    if (bookingId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Booking ID must be a number')),
      );
      return;
    }

    final pickupTimeString =
        '${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}';

    widget.cubit.storeCar(
      pickUpLocation: pickUpLocationController.text,
      dropOffLocation: dropOffLocationController.text,
      pickupTime: pickupTimeString,
      pickdate: selectedDate!,
      bookingId: bookingId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCarCubit, BookCarState>(
      bloc: widget.cubit,
      listener: (context, state) {
        if (state is BookCarFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        } else if (state is BookCarSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              duration: Duration(milliseconds: 150),
              backgroundColor: kprimaryColor1,
              content: Text(
                state.bookCarModel.message ?? 'Car Requested successfully',
                style: textStyleSize15,
              ),
            ),
          );
          Navigator.of(context).pop(); 
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Car Booking')),
          body: Form(
            key: _formKey,
            child: Container(
              color: kprimaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  Text('Enter Your Booking ID', style: textStyleSize15),
                  const SizedBox(height: 8),
                  CustomCarTextField(
                    controller: bookingIdController,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Booking ID required'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  Text('Enter Pick Up Location', style: textStyleSize15),
                  const SizedBox(height: 8),
                  CustomCarTextField(
                    controller: pickUpLocationController,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Pick up location required'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  Text('Enter Drop Off Location', style: textStyleSize15),
                  const SizedBox(height: 8),
                  CustomCarTextField(
                    controller: dropOffLocationController,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Drop off location required'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  CarBookimgDatePicker(
                    selectedDate: selectedDate,
                    onDateSelected: (date) =>
                        setState(() => selectedDate = date),
                  ),
                  const SizedBox(height: 20),
                  CarBookingTimePicker(
                    selectedTime: selectedTime,
                    onTimeSelected: (time) =>
                        setState(() => selectedTime = time),
                  ),
                  const SizedBox(height: 30),
                  state is BookCarLoading
                      ? Center(
                          child: LoadingAnimationWidget.progressiveDots(
                            color: kprimaryColor3,
                            size: 40,
                          ),
                        )
                      : CustomBottom(
                          title: 'Book Your Car',
                          ontap: _submitForm,
                        ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
