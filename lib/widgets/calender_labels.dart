import 'package:flutter/material.dart';

import 'calender_event_status_label.dart';



class CalenderLabels extends StatelessWidget {
  const CalenderLabels({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CalenderBookingStatusLabel(
          color: Colors.blue,
          label: "Upcomming",
        ),
        CalenderBookingStatusLabel(
          color: Colors.green,
          label: "Attended",
        ),
        CalenderBookingStatusLabel(
          color: Colors.orange,
          label: "Missed",
        ),
        CalenderBookingStatusLabel(
          color: Colors.red,
          label: "Canceled",
        ),
      ],
    );
  }
}
