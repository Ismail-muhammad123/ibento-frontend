import 'package:flutter/material.dart';
import 'package:ibento/data/data.dart';
import 'package:ibento/providers/bookings_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../widgets/calender_event_status_label.dart';
import '../widgets/calender_labels.dart';
import 'new_booking.dart';

class BookingsCalender extends StatefulWidget {
  const BookingsCalender({Key? key}) : super(key: key);

  @override
  State<BookingsCalender> createState() => _BookingsCalenderState();
}

class _BookingsCalenderState extends State<BookingsCalender> {
  CalendarView calenderView = CalendarView.month;

  final CalendarController _calendarController = CalendarController();

  @override
  initState() {
    _calendarController.displayDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 30, 54),
        title: const Text("Bookings Calender"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Colors.yellow,
              onPressed: () async {
                DateTime selectedDate = DateTime.now();
                final selected = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2050),
                );
                if (selected != null) {
                  setState(() {
                    _calendarController.displayDate = selected;
                  });
                }
              },
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Find Date",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20.0)),
        ],
      ),
      body: Column(
        children: [
          const CalenderLabels(),
          Expanded(
            child: FutureBuilder<List<Event>>(
                future: context.watch<BookingsProvider>().getAllEvents(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  List<Event> events = snapshot.data ?? [];

                  return Column(
                    children: [
                      Expanded(
                        child: SfCalendar(
                          controller: _calendarController,
                          onTap: (details) {
                            DateTime date = details.date!;
                            if (_calendarController.view != CalendarView.day) {
                              _calendarController.view = CalendarView.day;
                              _calendarController.displayDate = date;
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: SizedBox(
                                      width: 500.0,
                                      child: NewBooking(
                                        dateTime: date,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          showNavigationArrow: true,
                          showDatePickerButton: true,
                          monthViewSettings: const MonthViewSettings(
                            appointmentDisplayMode:
                                MonthAppointmentDisplayMode.appointment,
                          ),
                          view: CalendarView.week,
                          allowedViews: const [
                            CalendarView.day,
                            CalendarView.week,
                            CalendarView.month,
                            CalendarView.schedule,
                          ],
                          dataSource: EventDataSource(events),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
