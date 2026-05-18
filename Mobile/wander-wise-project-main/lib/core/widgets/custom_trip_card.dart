import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/network/endpoints.dart';
import 'package:wander_wise_app/core/utils/styles.dart';


class CustomTripCard extends StatelessWidget {
  const CustomTripCard({
    super.key,
    required this.imagePath,
    required this.destinationName,
    required this.location, required this.type, required this.ontap,
  });
  final String imagePath;
  final String destinationName;
  final String location;
  final String type;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          height: height * 0.3,
          width: width * 0.8,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: kprimaryColor5,
                blurRadius: 0.4,
                offset: Offset(4, 4),
              ),
            ],
            border: Border.all(color: kprimaryColor4.withValues(alpha: 0.8)),
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage('${Endpoints.imageBaseUrl}$imagePath'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 5),
              //   child: CustomOuterIconsRow(),
              // ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            destinationName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textStyleSize20.copyWith(color: kprimaryColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.005),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.white),
                              Text(
                                location,
                                style: textStyleSize14.copyWith(
                                  color: kprimaryColor,
                                ),
                              ),
                            ],
                          ),
                          Text(type,style: textStyleSize14.copyWith(
                                  color: kprimaryColor,
                                ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
