import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/network/endpoints.dart';
import 'package:wander_wise_app/features/Hotels/data/hotel_model.dart';
import 'package:wander_wise_app/features/Hotels/presentaion/widgets/hotel_booking_screen.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class HotelDetailsScreen extends StatefulWidget {
  const HotelDetailsScreen({super.key});

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  int selectedImageIndex = 0;
  List<String> images = [];
  List<String> aminities = ["WIFI", "PARKING", "POOL"];

  @override
  Widget build(BuildContext context) {
    HotelModel? hotelModel = GoRouterState.of(context).extra as HotelModel;
    images.addAll([
      hotelModel.image1!,
      hotelModel.image2!,
      hotelModel.image3!,
      hotelModel.image4!,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hotel Details',
          style: TextStyle(
            color: Color(0xff3A7CA5),
            fontWeight: FontWeight.bold,
          ),
        ),
       
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
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
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push(
                    AppRouter.kBookingIdView,
                    extra: {'Type': "Hotel", 'hotelid': hotelModel.id},
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff81C3D7),
                  side: const BorderSide(color: Color(0xff3A7CA5), width: 2),
                  shadowColor: const Color(0xff3A7CA5),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Book Now',
                  style: TextStyle(
                    color: Color(0xff3A7CA5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (images.isNotEmpty)
              Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    "${Endpoints.imageBaseUrl}${images[selectedImageIndex]}",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            if (images.length > 1)
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemBuilder: (context, index) {
                    final isSelected = index == selectedImageIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedImageIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: isSelected
                            ? const EdgeInsets.all(4)
                            : EdgeInsets.zero,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.blueAccent.withOpacity(0.6),
                                    blurRadius: 8,
                                    offset: Offset(0, 3),
                                  ),
                                ]
                              : [],
                          border: isSelected
                              ? Border.all(color: Colors.blueAccent, width: 2)
                              : null,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            "${Endpoints.imageBaseUrl}${images[index]}",
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

            // التفاصيل
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotelModel.hotelName!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    hotelModel.cityName!,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'room Status:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(hotelModel.roomStatus!),
                  const SizedBox(height: 12),
                  const Text(
                    'Amenities',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8,
                    children: aminities
                        .map(
                          (e) => Chip(
                            label: Text(e),
                            shape: const StadiumBorder(
                              side: BorderSide(
                                color: Color(0xff3A7CA5),
                                width: 1.5,
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${hotelModel.hotelDayPrice!} / night',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          Text(
                            '${hotelModel.hotelStatus}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
