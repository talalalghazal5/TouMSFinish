import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/welcome/presentation/views/first_welcome_view.dart';
import 'package:wander_wise_app/features/welcome/presentation/views/second_welcome_view.dart';
import 'package:wander_wise_app/features/welcome/presentation/views/third_welcome_view.dart';

class WelcomePagerView extends StatefulWidget {
  const WelcomePagerView({super.key});

  @override
  State<WelcomePagerView> createState() => _WelcomePagerViewState();
}

class _WelcomePagerViewState extends State<WelcomePagerView> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: const [
              FirstWelcomeView(),
              SecondWelcomeView(),
              ThirdWelcomeView(),
            ],
          ),
          // Skip  فقط في الشاشتين الأولى والثانية في
          if (currentPage != 2)
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(3, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentPage == index
                                ? Colors.black
                                : kprimaryColor1.withValues(alpha: 0.5),
                            border: Border.all(color: kprimaryColor1),
                          ),
                        ),
                      );
                    }),
                  ),
                  TextButton(
                    onPressed: () {
                      print('Skip pressed, going to page 3');
                      if (currentPage == 0) {
                        _controller.animateToPage(
                          1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        _controller.animateToPage(
                          2,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      "Skip",
                      style: textStyleSize25.copyWith(color: kprimaryColor1),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
