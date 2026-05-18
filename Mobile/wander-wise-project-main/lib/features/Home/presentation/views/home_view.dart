import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wander_wise_app/core/network/endpoints.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/Favorite/presentaion/views/favorite_trips_view.dart';
import 'package:wander_wise_app/features/Home/presentation/widgets/BottomNav.dart';
import 'package:wander_wise_app/features/Home/presentation/widgets/offer_section.dart';
import 'package:wander_wise_app/features/Home/presentation/widgets/seaction.dart';
import 'package:wander_wise_app/features/Home/presentation/widgets/search_barr.dart';
import 'package:wander_wise_app/features/Home/presentation/widgets/slider.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 245, 245),
      appBar: currentIndex == 0
          ? AppBar(
              backgroundColor: const Color.fromARGB(255, 241, 245, 245),
              elevation: 0,
              centerTitle: true,
              title: Text('Hi,${Endpoints.userName}', style: textStyleSize25),
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              actions: [
                Container(
                  width: 50,
                  height: 50,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Color(0Xff16425B),
                      size: 30,
                    ),
                    onPressed: () {
                      debugPrint('Notifications pressed');
                    },
                  ),
                ),
              ],
            )
          : null,
    
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 90),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff81C3D7),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xff3A7CA5), width: 2),
              ),
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kProfileView);
                },
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff81C3D7),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xff3A7CA5), width: 2),
              ),
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Support'),
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kFAQSupportView);
                },
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff81C3D7),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xff3A7CA5), width: 2),
              ),
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  GoRouter.of(context).pop();
                  GoRouter.of(context).push(AppRouter.kWelcomePagerView);
                },
              ),
            ),
          ],
        ),
      ),
    
      body: buildBody(currentIndex),
    
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  Widget buildBody(int state) {
    switch (state) {
      case 0:
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: SearchingBar(),
            ),
            SizedBox(height: 250, child: SliderWidget()),
            SizedBox(height: 100, child: Section()),
            const Align(
              alignment: Alignment.topLeft,
              child: Text("  OffersSections", style: textStyleSize20),
            ),
            const SizedBox(height: 10),
            const Expanded(child: DummyOffersWidget()),
            const SizedBox(height: 10),
          ],
        );
      case 1:
       return FavoriteTripsView(); 
      case 2:
        return const Center(child: Text("My Bookings Screen"));
      case 3:
        return const Center(child: Text("My Travels Screen"));
      default:
        return const Center(child: Text("Unknown Page"));
    }
  }
}
