import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/core/widgets/custom_buttom.dart';
import 'package:wander_wise_app/core/widgets/navigate_with_auth_check.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class CustomPriceRow extends StatelessWidget {
  const CustomPriceRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Price :', style: textStyleSize15),
                    Text(
                      '\$ 20.7',
                      style: textStyleSize14.copyWith(color: kprimaryColor6),
                    ),
                  ],
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
