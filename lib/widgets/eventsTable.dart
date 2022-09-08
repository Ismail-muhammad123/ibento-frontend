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
                    Icons.visibility,
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
                  : selectedEvent!.canceled || selectedEvent!.attended
                      ? null
                      : () async {
                          await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text(
                                  "Are you sure you want to mark this booking as attended?"),
                              actions: [
                                MaterialButton(
                                  onPressed: () => Navigator.of(context).pop(0),
                                  child: Text("NO"),
                                  color: Colors.grey,
                                ),
                                MaterialButton(
                                  onPressed: () => Navigator.of(context).pop(1),
                                  child: Text("Yes"),
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          ).then(
                            (value) async {
                              if (value == 1) {
                                Event ev = selectedEvent!;
                                ev.attended = true;
                                List<String> errors = await context
                                    .read<BookingsProvider>()
                                    .updateEvent(ev);
                                if (errors.isNotEmpty) {
                                  await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Row(
                                        children: const [
                                          Icon(
                                            Icons.error,
                                            color: Colors.red,
                                          ),
                                          Text(
                                            "Error",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.red,
                                            ),
                                          )
                                        ],
                                      ),
                                      actions: [
                                        MaterialButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          color: Colors.blue,
                                          child: const Text("OKAY"),
                                        )
                                      ],
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children:
                                            errors.map((e) => Text(e)).toList(),
                                      ),
                                    ),
                                  ).then(
                                    (value) => Navigator.of(context).pop(),
                                  );
                                }
                              }
                            },
                          );
                          return;
                        },
              color: Colors.green,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Mark as attended",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: selectedEvent == null
                  ? null
                  : selectedEvent!.canceled || selectedEvent!.attended
                      ? null
                      : () async {
                          await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              actions: [
                                MaterialButton(
                                  onPressed: () => Navigator.of(context).pop(0),
                                  child: Text("NO"),
                                  color: Colors.blueGrey,
                                ),
                                MaterialButton(
                                  onPressed: () => Navigator.of(context).pop(1),
                                  child: Text("Yes"),
                                  color: Colors.red,
                                ),
                              ],
                              title: Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Icon(Icons.warning),
                                  ),
                                  Text("WARNING")
                                ],
                              ),
                              content: const Text(
                                  "Are you sure you want to cancel this booking?"),
                            ),
                          ).then((value) async {
                            if (value == 1) {
                              Event ev = selectedEvent!;
                              ev.canceled = true;
                              List<String> errors = await context
                                  .read<BookingsProvider>()
                                  .updateEvent(ev);
                              if (errors.isNotEmpty) {
                                await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Row(
                                      children: const [
                                        Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          "Error",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                    actions: [
                                      MaterialButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text("OKAY"),
                                        color: Colors.blue,
                                      )
                                    ],
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children:
                                          errors.map((e) => Text(e)).toList(),
                                    ),
                                  ),
                                ).then(
                                  (value) => Navigator.of(context).pop(),
                                );
                              }
                            }
                          });
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
                  : selectedEvent!.canceled || selectedEvent!.attended
                      ? null
                      : () async {
                          if (selectedEvent!.attended) {
                            await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Text(
                                    "This Booking is already marked as attended, Create a new Booking instead."),
                                actions: [
                                  MaterialButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text("OK"),
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                            );
                            return;
                          }
                          if (selectedEvent!.isMissed) {
                            await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Text(
                                    "This Booking is already missed, Create a new Booking instead."),
                                actions: [
                                  MaterialButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text("OK"),
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                            );
                            return;
                          }
                          if (selectedEvent!.canceled) {
                            await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Text(
                                    "This Booking is already canceled, Create a new Booking instead."),
                                actions: [
                                  MaterialButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text("OK"),
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                            );
                            return;
                          } else {
                            await showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                child: NewBooking(
                                  event: selectedEvent,
                                ),
                              ),
                            );
                          }
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
        Expanded(
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: DataTable(
                showBottomBorder: true,
                headingTextStyle: const TextStyle(
                  color: Color.fromARGB(255, 1, 30, 54),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                columns: [
                  DataColumn(
                    label: Text(""),
                  ),
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
                            Container(
                              alignment: Alignment.center,
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: event.getStatusColor(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
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
          ),
        ),
      ],
    );
  }
}
