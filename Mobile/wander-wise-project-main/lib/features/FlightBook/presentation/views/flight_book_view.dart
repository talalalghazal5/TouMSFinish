import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/features/FlightBook/presentation/views/widgets/flight_book_body.dart';

class FlightBookView extends StatelessWidget {
  const FlightBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back , color: kprimaryColor5,),
          ),
        ),
        body: const FlightBookBody(),
      ),
    );
  }
}
