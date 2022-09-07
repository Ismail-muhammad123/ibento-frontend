import 'package:flutter/material.dart';

class CalenderBookingStatusLabel extends StatelessWidget {
  CalenderBookingStatusLabel({
    required this.color,
    required this.label,
    Key? key,
  }) : super(key: key);

  Color color;
  String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label),
          )
        ],
      ),
    );
  }
}
