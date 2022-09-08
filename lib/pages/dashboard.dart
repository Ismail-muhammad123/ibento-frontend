import 'package:flutter/material.dart';
import 'package:ibento/data/data.dart';
import 'package:ibento/providers/bookings_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/dashboardMetricsCard.dart';
import '../widgets/eventsTable.dart';
import 'new_booking.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
        title: const Text("Dashboard"),
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
        child: SingleChildScrollView(
          child: FutureBuilder<List<Event>>(
            future: context.watch<BookingsProvider>().getAllEvents(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (!snapshot.hasData) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                        "You have no Bookings yet. Click on the floating button below to create new booking"),
                  ),
                );
              }
              List<Event> data = _searchController.text.isNotEmpty
                  ? snapshot.data!.where((e) {
                      if ((e.eventName.contains(_searchController.text)) ||
                          (e.name.contains(_searchController.text)) ||
                          (e.phone.contains(_searchController.text))) {
                        return true;
                      }
                      return false;
                    }).toList()
                  : snapshot.data!;
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DashboardMetricsCard(
                          label: "Total Bookings",
                          value: data.length,
                        ),
                      ),
                      Expanded(
                        child: DashboardMetricsCard(
                            label: "Attended Bookings",
                            value: data
                                .where((element) => element.attended)
                                .length),
                      ),
                      Expanded(
                        child: DashboardMetricsCard(
                          label: "Cancelations",
                          value:
                              data.where((element) => element.canceled).length,
                        ),
                      ),
                      Expanded(
                        child: DashboardMetricsCard(
                          label: "Missed Bookings",
                          value: data
                              .where(
                                (element) =>
                                    element.attended == false &&
                                    !element.canceled == false &&
                                    element.to.isBefore(
                                      DateTime.now(),
                                    ),
                              )
                              .length,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _searchController,
                            decoration: const InputDecoration(
                              hintText: "Title, name, phone Number...",
                              label: Text("Search"),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: MaterialButton(
                            color: Colors.yellow,
                            height: 60,
                            child: Icon(Icons.clear),
                            onPressed: () => setState(
                              () => _searchController.clear(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: MaterialButton(
                            onPressed: () => setState(() {}),
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
                    "Bookings".toUpperCase(),
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
                      child: SingleChildScrollView(
                        child: BookingsListTable(
                          events: data,
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
