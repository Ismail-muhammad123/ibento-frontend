import 'package:flutter/material.dart';
import 'package:ibento/providers/bookings_provider.dart';
import 'package:intl/intl.dart';
import '../data/data.dart';
import '../pages/details.dart';
import '../pages/new_booking.dart';
import 'package:provider/provider.dart';

class BookingsListTable extends StatefulWidget {
  BookingsListTable({
    Key? key,
    required this.events,
  }) : super(key: key);

  List<Event> events;

  @override
  State<BookingsListTable> createState() => _BookingsListTableState();
}

class _BookingsListTableState extends State<BookingsListTable> {
  Event? selectedEvent;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: selectedEvent == null
                  ? null
                  : () {
                      // TODO create open details
                    },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Details",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              color: Colors.grey,
            ),
            MaterialButton(
              onPressed: selectedEvent == null
                  ? null
                  : () {
                      // TODO create mark as attended functions
                    },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Mark as attended",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              color: Colors.green,
            ),
            MaterialButton(
              onPressed: selectedEvent == null
                  ? null
                  : () {
                      // TODO create mark as canceled functions
                    },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Cancel Booking",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              color: Colors.red,
            ),
            MaterialButton(
              onPressed: selectedEvent == null
                  ? null
                  : () {
                      // TODO create editing function
                    },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              color: Colors.blue,
            ),
          ],
        ),
        SizedBox(
          width: double.maxFinite,
          child: DataTable(
            showBottomBorder: true,
            headingTextStyle: const TextStyle(
              color: Color.fromARGB(255, 1, 30, 54),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            columns: [
              DataColumn(
                label: Text("ID".toUpperCase()),
              ),
              DataColumn(
                label: Text("Title".toUpperCase()),
              ),
              DataColumn(
                label: Text("Name".toUpperCase()),
              ),
              DataColumn(
                label: Text("Phone".toUpperCase()),
              ),
              DataColumn(
                label: Text("Date".toUpperCase()),
              ),
            ],
            rows: widget.events
                .map(
                  (event) => DataRow(
                    selected: selectedEvent == event,
                    onSelectChanged: (val) => setState(() {
                      selectedEvent = (val as bool) ? event : null;
                    }),
                    cells: [
                      DataCell(
                        Text(
                          (event.id ?? 0).toString(),
                        ),
                      ),
                      DataCell(
                        Text(event.eventName),
                      ),
                      DataCell(
                        Text(event.name),
                      ),
                      DataCell(
                        Text(event.phone),
                      ),
                      DataCell(
                        Text(
                          DateFormat('d/M/yyyy. HH:mm a').format(event.to),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
