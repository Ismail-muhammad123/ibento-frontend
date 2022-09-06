import 'package:flutter/material.dart';
import 'package:ibento/data/data.dart';
import 'package:intl/intl.dart';

import '../pages/details.dart';
import '../pages/new_booking.dart';

class DashboardMetricsCard extends StatelessWidget {
  final int value;
  final String label;
  const DashboardMetricsCard({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.blue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  bool expanded;
  bool current;
  Widget? trailing;
  Color color;
  MenuTile({
    Key? key,
    required this.title,
    required this.icon,
    this.color = Colors.white,
    this.expanded = true,
    this.current = false,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: Colors.grey,
                ),
              ),
              expanded
                  ? Text(
                      title,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                      ),
                    )
                  : Container(),
              Spacer(),
              expanded ? trailing ?? Container() : Container(),
            ],
          ),
        ),
        width: double.maxFinite,
        height: 50.0,
        decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
                width: 5.0,
                color: color,
              ),
              right: current
                  ? BorderSide(
                      width: 5.0,
                      color: color,
                    )
                  : BorderSide.none),
        ),
      ),
    );
  }
}

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
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      columns: [
        DataColumn(
          label: Text("Booking Title"),
        ),
        DataColumn(
          label: Text("Name"),
        ),
        DataColumn(
          label: Text("Phone Number"),
        ),
        DataColumn(
          label: Text("Date Created"),
        ),
        DataColumn(
          label: Text("Event Date"),
        ),
        DataColumn(
          label: Text("Actions"),
        ),
      ],
      rows: events
          .map(
            (event) => DataRow(
              cells: [
                DataCell(
                  Text(event.eventName),
                ),
                DataCell(Text(event.name)),
                DataCell(Text(event.phone)),
                DataCell(Text(
                    DateFormat('EEE, d MMM, yyyy').format(event.createdAt))),
                DataCell(Text(DateFormat('MMM d, yyyy').format(event.from))),
                DataCell(
                  PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: MaterialButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => BookingDetails(),
                            );
                          },
                          child: Text("Open"),
                        ),
                      ),
                      PopupMenuItem(
                        child: MaterialButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                child: NewBooking(),
                              ),
                            );
                          },
                          child: Text("Edit"),
                        ),
                      ),
                      PopupMenuItem(
                        child: MaterialButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Text(
                                    "Are your sure You want to check in this booking?"),
                                actions: [
                                  MaterialButton(
                                    color: Colors.blueGrey,
                                    child: Text("No"),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                  MaterialButton(
                                    color: Colors.blue,
                                    child: Text("Yes"),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text("Check IN"),
                        ),
                      ),
                      PopupMenuItem(
                        child: MaterialButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Text(
                                    "Are your sure You want to cancel this booking?"),
                                actions: [
                                  MaterialButton(
                                    color: Colors.blueGrey,
                                    child: Text("No"),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                  MaterialButton(
                                    color: Colors.blue,
                                    child: Text("Yes"),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text("Cancel"),
                        ),
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
