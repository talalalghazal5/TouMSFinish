import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: kprimaryColor4,
        index: currentIndex,
        onTap: onTap,
        items: const [
          SizedBox(
            height: 45,
            width: 45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home, size: 22, color: kprimaryColor),
                Text(
                  'Home',
                  style: TextStyle(fontSize: 10, color: kprimaryColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 45,
            width: 45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite, size: 22, color: kprimaryColor),
                Text(
                  'Favorite',
                  style: TextStyle(fontSize: 10, color: kprimaryColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 45,
            width: 45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.receipt_long, size: 22, color: kprimaryColor),
                Text(
                  'Bookings',
                  style: TextStyle(fontSize: 10, color: kprimaryColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 45,
            width: 45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.card_travel, size: 22, color: kprimaryColor),
                Text(
                  'travels',
                  style: TextStyle(fontSize: 10, color: kprimaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
