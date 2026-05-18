// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:wander_wise_app/core/network/api_service.dart';
// import 'package:wander_wise_app/core/utils/assets.dart';
// import 'package:wander_wise_app/core/widgets/custom_background_image.dart';
// import 'package:wander_wise_app/core/widgets/custom_buttom.dart';
// import 'package:wander_wise_app/features/BookCar/logic/BookCarCubit/book_car_cubit.dart';
// import 'package:wander_wise_app/features/BookCar/presentation/views/car_booking_bootom_sheet.dart';

// class WelcomeCarView extends StatelessWidget {
//   const WelcomeCarView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: BlocProvider(
//           create: (context) => BookCarCubit(ApiService()),
//           child: Stack(
//             children: [
//               BackGroundImage(photoPath: ImagesPaths.carBooking, width: width),
//               Positioned(
//                 left: 40,
//                 right: 40,
//                 bottom: 10,
//                 child: Builder(
//                   builder: (context) {
//                     return CustomBottom(
//                       title: 'Book Car',
//                       ontap: () {
//                         final cubit = context.read<BookCarCubit>();
// final rootContext = context;
//                         showModalBottomSheet(
//                           context: context,
//                           isScrollControlled: true,
//                           shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.vertical(
//                               top: Radius.circular(20),
//                             ),
//                           ),
//                           builder: (context) => BlocProvider.value(
//                             value: cubit,
//                             child: CarBookingBottomSheet(cubit: cubit ,rootContext: rootContext,),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/core/utils/assets.dart';
import 'package:wander_wise_app/core/widgets/custom_buttom.dart';
import 'package:wander_wise_app/features/BookCar/logic/BookCarCubit/book_car_cubit.dart';
import 'package:wander_wise_app/features/BookCar/presentation/views/car_booking_bootom_sheet.dart';

class WelcomeCarView extends StatelessWidget {
  const WelcomeCarView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => BookCarCubit(ApiService()),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(Icons.arrow_back, color: kprimaryColor5),
            ),
          ),
          body: Stack(
            children: [
              Container(
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImagesPaths.carBooking),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 40,
                right: 40,
                bottom: 10,
                child: Builder(
                  builder: (context) {
                    final cubit = context.read<BookCarCubit>();
                    return CustomBottom(
                      title: 'Book Car',
                      ontap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => CarBookingPage(cubit: cubit),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
