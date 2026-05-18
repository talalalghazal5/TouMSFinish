import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wander_wise_app/features/Flight/presentaion/widgets/flight_date_picker.dart';
import 'package:wander_wise_app/features/Flight/presentaion/widgets/flight_form_header.dart';
import 'package:wander_wise_app/features/Flight/presentaion/widgets/flight_text_field.dart';

class FlightForm extends StatefulWidget {
  const FlightForm({super.key});

  @override
  State<FlightForm> createState() => _FlightFormState();
}

class _FlightFormState extends State<FlightForm> {
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final passengersController = TextEditingController(text: "1");

  String flightClass = "Economy";
  DateTime departDate = DateTime.now();
  DateTime returnDate = DateTime.now().add(const Duration(days: 7));
  bool isRoundTrip = true;

  Future<void> _selectDate(BuildContext context, bool isDepart) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isDepart ? departDate : returnDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        if (isDepart) {
          departDate = picked;
        } else {
          returnDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd MMMM');

    return Column(
      children: [
        const FlightFormHeader(),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                ToggleButtons(
                  borderRadius: BorderRadius.circular(30),
                  isSelected: [isRoundTrip, !isRoundTrip],
                  onPressed: (index) {
                    setState(() {
                      isRoundTrip = index == 0;
                    });
                  },
                  selectedColor: Colors.white,
                  fillColor: const Color(0xff3A7CA5),
                  color: const Color(0xff3A7CA5),
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Round Trip"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Oneway"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                FlightTextField(
                  label: "From",
                  controller: fromController,
                  icon: Icons.flight_takeoff,
                ),
                const SizedBox(height: 10),

                FlightTextField(
                  label: "To",
                  controller: toController,
                  icon: Icons.flight_land,
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: FlightDatePicker(
                        label: "Depart",
                        date: formatter.format(departDate),
                        onTap: () => _selectDate(context, true),
                      ),
                    ),
                    const SizedBox(width: 10),
                    if (isRoundTrip)
                      Expanded(
                        child: FlightDatePicker(
                          label: "Return",
                          date: formatter.format(returnDate),
                          onTap: () => _selectDate(context, false),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 10),

                // Row(
                //   children: [
                //     FlightPassengerSelector(
                //       count: int.tryParse(passengersController.text) ?? 1,
                //       onChanged: (newCount) {
                //         setState(() {
                //           passengersController.text = newCount.toString();
                //         });
                //       },
                //     ),
                //     const SizedBox(width: 10),
                //     Expanded(
                //       child: FlightClassDropdown(
                //         value: flightClass,
                //         onChanged: (value) {
                //           if (value != null) {
                //             setState(() {
                //               flightClass = value;
                //             });
                //           }
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Searching flights..."),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3A7CA5),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Search Flights",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
