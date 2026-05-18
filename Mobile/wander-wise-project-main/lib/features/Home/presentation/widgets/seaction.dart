import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class Section extends StatelessWidget {
  const Section({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kCategoryView);
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SectionIcon(title: 'Destinations', icon: Icons.category),
              ),
            ),
            InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kToursView);
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SectionIcon(title: 'Tours', icon: Icons.travel_explore),
              ),
            ),
            InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kHotelsScreen);
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SectionIcon(title: 'Hotels', icon: Icons.hotel),
              ),
            ),
            InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kFlightBookingScreen);
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SectionIcon(title: 'Flight', icon: Icons.flight_takeoff),
              ),
            ),
            InkWell(
              onTap: () {
                GoRouter.of(
                  context,
                ).push(AppRouter.kBookingIdView, extra: {"Type": 'CarHire' ,'hotelid':0 });
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SectionIcon(title: 'Car', icon: Icons.directions_car),
              ),
            ),
            /*  InkWell(
              /*  onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CreateBookingScreen()),
                );
              },*/
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SectionIcon(title: 'Booking', icon: Icons.book_online),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

class SectionIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const SectionIcon({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: kprimaryColor4,
            child: Icon(icon, color: kprimaryColor),
          ),
          const SizedBox(height: 8),
          Text(title, style: textStyleSize14),
        ],
      ),
    );
  }
}
