import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FlightCard extends StatelessWidget {
  final FlightTicket ticket;

  const FlightCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Color(0xff81C3D7),
      color: Color.fromARGB(255, 192, 233, 245),

      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  ticket.fromCode,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                /*     Transform.rotate(
                  angle: 1.57, // زاوية التدوير بالراديان (حوالي -90 درجة)
                  child: Icon(
                    Icons.airplanemode_active,
                    size: 32,
                    color: Color(0xff3A7CA5),
                  ),
                ),*/
                const Spacer(),
                Text(
                  ticket.toCode,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(ticket.fromCity, style: const TextStyle(fontSize: 12)),
                Text(ticket.toCity, style: const TextStyle(fontSize: 12)),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: DottedLine(
                    dashLength: 6,
                    dashGapLength: 3,
                    lineThickness: 1.5,
                    dashColor: Color(0xff3A7CA5),
                  ),
                ),
                SizedBox(width: 8),
                Transform.rotate(
                  angle: 1.57,
                  child: Icon(
                    Icons.airplanemode_active,
                    color: Color(0xff3A7CA5),
                    size: 28,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: DottedLine(
                    dashLength: 6,
                    dashGapLength: 3,
                    lineThickness: 1.5,
                    dashColor: Color(0xff3A7CA5),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Depart",
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd – kk:mm').format(ticket.date),
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      ticket.departTime,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  ticket.duration,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Column(
                  children: [
                    Text(
                      "Arrive",
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd').format(ticket.date),
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      ticket.arriveTime,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  ticket.airline,
                  style: const TextStyle(color: Color(0xff3A7CA5)),
                ),
                const Spacer(),
                Text(
                  ticket.price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "  per Adult",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class FlightTicket {
  final String fromCode;
  final String fromCity;
  final String toCode;
  final String toCity;
  final String airline;
  final String departTime;
  final String arriveTime;
  final DateTime date; // 👈 عدل هنا
  final String duration;
  final String price;

  FlightTicket({
    required this.fromCode,
    required this.fromCity,
    required this.toCode,
    required this.toCity,
    required this.airline,
    required this.departTime,
    required this.arriveTime,
    required this.date, // 👈 تأكد أن النوع DateTime
    required this.duration,
    required this.price,
  });
}