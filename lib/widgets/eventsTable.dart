import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/data.dart';
import '../pages/details.dart';
import '../pages/new_booking.dart';

class BookingsListTable extends StatelessWidget {
  BookingsListTable({
    Key? key,
    required this.events,
  }) : super(key: key);

  List<Event> events;

  @override
  Widget build(BuildContext context) {
    return DataTable(
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
        const DataColumn(
          label: Text(""),
        ),
      ],
      rows: events
          .map(
            (event) => DataRow(
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
                    DateFormat('d/M/yyyy. HH:mm a').format(event.from),
                  ),
                ),
                DataCell(
                  PopupMenuButton<int>(
                    onSelected: (value) {
                      switch (value) {
                        case 0:
                          showDialog(
                            context: context,
                            builder: (context) => BookingDetails(),
                          );
                          break;
                        case 1:
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: SizedBox(
                                width: 500,
                                child: NewBooking(
                                  event: event,
                                ),
                              ),
                            ),
                          );
                          break;
                        case 2:
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text(
                                  "Are your sure You want to check in this booking?"),
                              actions: [
                                MaterialButton(
                                  color: Colors.blueGrey,
                                  child: Text("No"),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                                MaterialButton(
                                  color: Colors.blue,
                                  child: Text("Yes"),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            ),
                          );
                          break;
                        case 3:
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text(
                                  "Are your sure You want to cancel this booking?"),
                              actions: [
                                MaterialButton(
                                  color: Colors.blueGrey,
                                  child: Text("No"),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                                MaterialButton(
                                  color: Colors.blue,
                                  child: Text("Yes"),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            ),
                          );
                          break;
                        default:
                      }
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(
                        value: 0,
                        child: Text("Details"),
                      ),
                      const PopupMenuItem(
                        value: 1,
                        child: Text("Edit"),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text("Check IN"),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Text("Cancel"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
