import 'package:flutter/material.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  TextStyle _contetnt_style = TextStyle(
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                Text(
                  "Ibento Technologies Limited".toUpperCase(),
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text("Booking Recipt"),
                Text("Booking ID: #45o89GF7"),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Name:",
                      style: _contetnt_style,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                    ),
                    Text(
                      "Ismail Muhammad Lawan",
                      style: _contetnt_style,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Address:",
                      style: _contetnt_style,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                    ),
                    Text(
                      "Kano State",
                      style: _contetnt_style,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Email:",
                        style: _contetnt_style,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "hjmbemr,afsjhn@gmail.com",
                        style: _contetnt_style,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          "Mobile Number:",
                          style: _contetnt_style,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "3456789567",
                        style: _contetnt_style,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Event Title:",
                        style: _contetnt_style,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Match",
                        style: _contetnt_style,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
