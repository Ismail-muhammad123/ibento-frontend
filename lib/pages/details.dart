import 'package:flutter/material.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text("Ibento Technologies Limited"),
            Text("Booking Recipt"),
            Text("Booking ID: #45o89GF7"),
            Row(
              children: [
                Expanded(
                  child: Text("Name: Ismail Muhammad Lawan"),
                ),
                Expanded(
                  child: Text("Address: Kano State"),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text("Name: Ismail Muhammad Lawan"),
                ),
                Expanded(
                  child: Text("Address: Kano State"),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text("Name: Ismail Muhammad Lawan"),
                ),
                Expanded(
                  child: Text("Address: Kano State"),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
