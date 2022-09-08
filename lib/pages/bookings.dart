import 'package:flutter/material.dart';
import 'package:ibento/data/data.dart';
import 'package:ibento/pages/details.dart';
import 'package:ibento/pages/new_booking.dart';
import 'package:ibento/providers/bookings_provider.dart';
import 'package:ibento/widgets/calender_labels.dart';
import 'package:provider/provider.dart';

import '../widgets/eventsTable.dart';

class Bookings extends StatefulWidget {
  Bookings({Key? key}) : super(key: key);

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 42, 75),
        title: Text("Bookings"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: SizedBox(
                  width: 500.0,
                  child: NewBooking(),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const CalenderLabels(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: "Name, title or phone number",
                        label: Text("Search"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text("Search"),
                      minWidth: 150,
                      color: Colors.blue,
                      height: 60,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            Divider(),
            Text(
              "All Bookings".toUpperCase(),
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height - 280.0,
                child: FutureBuilder<List<Event>>(
                  future: context.watch<BookingsProvider>().getAllEvents(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                              "You have no Bookings yet. Click on the floating button below to create new booking"),
                        ),
                      );
                    }
                    List<Event> data = _searchController.text.isNotEmpty
                        ? snapshot.data!.where((e) {
                            if ((e.eventName
                                    .contains(_searchController.text)) ||
                                (e.name.contains(_searchController.text)) ||
                                (e.phone.contains(_searchController.text))) {
                              return true;
                            }
                            return false;
                          }).toList()
                        : snapshot.data!;
                    return BookingsListTable(
                      events: data,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
