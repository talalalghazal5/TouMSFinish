import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wander_wise_app/core/network/endpoints.dart';
import 'package:wander_wise_app/features/Tours/presentation/widgets/TourDestinationDetails/custom_trip_details_listview.dart';

// ignore: must_be_immutable
class TourDestinationDetailsBody extends StatefulWidget {
  const TourDestinationDetailsBody({
    super.key,
    required this.destinationName,
    required this.location,
    required this.description,
    required this.mainImage,
    required this.image1,
    required this.image2,
    required this.image3,
  });
  final String destinationName;
  final String location;
  final String description;
  final String mainImage;
  final String image1;
  final String image2;
  final String image3;

  @override
  State<TourDestinationDetailsBody> createState() =>
      _TourDestinationDetailsBodyState();
}

class _TourDestinationDetailsBodyState
    extends State<TourDestinationDetailsBody> {
  late PageController _controller;

  late List<String> images;

  @override
  void initState() {
    super.initState();

    _controller = PageController();
    images = [widget.mainImage, widget.image1, widget.image2, widget.image3];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        // 🔥 IMAGE SLIDER
        SizedBox(
          height: height * 0.4,
          width: double.infinity,
          child: Stack(
            children: [
              PageView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: _controller,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      double scale = 1.0;

                      if (_controller.position.haveDimensions) {
                        scale = (_controller.page! - index).abs();
                        scale = 1 - (scale * 0.2);
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 22,
                        ),
                        child: Transform.scale(scale: scale, child: child),
                      );
                    },
                    child: Image.network(
                      "${Endpoints.imageBaseUrl}${images[index]}",
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
              IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.2),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // 🔵 INDICATOR
        SmoothPageIndicator(
          controller: _controller,
          count: images.length,
          effect: ExpandingDotsEffect(
            dotHeight: 6,
            dotWidth: 6,
            activeDotColor: Colors.blue,
          ),
        ),

        const SizedBox(height: 20),
        CustomTourDestinationsListview(
          description: widget.description,
          destinationName: widget.destinationName,
          location: widget.location,
        ),
      ],
    );
  }
}
