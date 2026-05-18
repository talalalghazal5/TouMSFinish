import 'package:flutter/material.dart';
import 'package:wander_wise_app/features/Flight/presentaion/widgets/flight_path_header.dart';

class SelectFlightscreen extends StatelessWidget {
  const SelectFlightscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات تجريبية فقط
    final tickets = List.generate(3, (index) => "Flight $index");

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 50,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF0A3D62),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: FlightPathHeader(
              fromCode: "DAM",
              fromCity: "Damascus",
              toCode: "DXB",
              toCity: "Dubai",
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "3 Flights Available",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: tickets.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(tickets[index]),
                        ),
                      );
                    },
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
