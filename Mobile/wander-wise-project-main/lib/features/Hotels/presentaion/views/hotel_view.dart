import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/Hotels/logic/HotelCubit/hotel_cubit.dart';
import 'package:wander_wise_app/features/Hotels/logic/HotelCubit/hotel_state.dart';
import 'package:wander_wise_app/features/Hotels/presentaion/widgets/hotel_card.dart';
import 'package:wander_wise_app/features/Hotels/presentaion/widgets/hotel_header.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({Key? key}) : super(key: key);

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Color(0xff3A7CA5)),
                label: const Text(
                  'Back',
                  style: TextStyle(color: Color(0xff3A7CA5)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff81C3D7),
                  side: const BorderSide(color: Color(0xff3A7CA5), width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => HotelCubit(ApiService())..getHotels(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HotelHeader(searchController: searchController),
              SizedBox(height: 50),
              sectionTitle("Most popular"),
              SizedBox(
                height: 200,
                child: BlocConsumer<HotelCubit, HotelState>(
                  listener: (context, state) {
                    if (state is HotelFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          duration: Duration(seconds: 2),
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
                    if (state is HotelFailure) {
                      return Center(child: Text(state.errorMessage));
                    }
                    if (state is HotelLoading) {
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
                    if (state is HotelSuccess) {
                      final hotels = state.hotelModel;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: hotels.length,
                        itemBuilder: (context, index) {
                          final hotel = hotels[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: HotelCard(
                              destinationName: hotel.hotelName ?? 'no name',
                              location: hotel.cityName ?? 'no location',
                              imagePath: hotel.image1 ?? '',
                              ontap: () {
                                GoRouter.of(context).push(
                                  AppRouter.kHotelDetailsScreen,
                                  extra: hotel,
                                );
                              },
                            ),
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
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
