import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/core/widgets/custom_trip_card.dart';
import 'package:wander_wise_app/features/DestinationsCategory/logic/EntertainmentCubit/entertainment_cubit.dart';
import 'package:wander_wise_app/features/DestinationsCategory/logic/EntertainmentCubit/entertainment_state.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class EntertainmentTripsView extends StatefulWidget {
  const EntertainmentTripsView({super.key});

  @override
  State<EntertainmentTripsView> createState() => _EntertainmentTripsViewState();
}

class _EntertainmentTripsViewState extends State<EntertainmentTripsView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocConsumer<EntertainmentCubit, EntertainmentState>(
        listener: (context, state) {
          if (state is EntertainmentFailure) {
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
          if (state is EntertainmentFailure) {
            return Center(child: Text(state.errorMessage));
          }
          if (state is EntertainmentLoading) {
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
          if (state is EntertainmentSuccess) {
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
                print('${destination.image1}');
                print('${destination.image2}');
                print('${destination.image3}');
                print('${destination.image4}');
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

// class EntertainmentTripsView extends StatelessWidget {
//   const EntertainmentTripsView({super.key});

//   static final List<String> images = [
//     ImagesPaths.placeImage,
//     ImagesPaths.louvreMuseum,
//     ImagesPaths.detailsImage1,
//     ImagesPaths.detailsImage3,
//     ImagesPaths.detailsImage2,
//     ImagesPaths.concord,
//     ImagesPaths.shanshalizaStreet,
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: BlocBuilder<EntertainmentCubit, EntertainmentState>(
//         builder: (context, state) {
//           if (state is EntertainmentFailure) {
//             return Center(child: Text(state.errorMessage));
//           }
//           if (state is EntertainmentSuccess) {
//             final destinations = state.destinations;
//             return GridView.builder(
//               itemCount: destinations.length,
//               clipBehavior: Clip.none,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 1,
//                 childAspectRatio: 1.67,
//                 mainAxisSpacing: 5,
//               ),
//               itemBuilder: (context, index) {
//                 final destination = destinations[index];
//                 return CustomTripCard(
//                   imagePath: images[index],
//                   destinationName: destination.destinationName ?? 'no name',
//                   location: destination.country ?? 'no country',
//                 );
//               },
//             );
//           }
//           return const SizedBox.shrink();
//         },
//       ),
//     );
//   }
// }
