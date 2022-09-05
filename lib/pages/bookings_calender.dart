import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'new_booking.dart';

class BookingsCalender extends StatefulWidget {
  const BookingsCalender({Key? key}) : super(key: key);

  @override
  State<BookingsCalender> createState() => _BookingsCalenderState();
}

class _BookingsCalenderState extends State<BookingsCalender> {
  List<Meeting> bookings = [
    Meeting(
      'Match',
      DateTime(2022, 9, 2, 20),
      DateTime(2022, 9, 2, 20, 40),
      const Color(0xFF0F8644),
      false,
    ),
    Meeting(
      'Match',
      DateTime(2022, 9, 4, 5),
      DateTime(2022, 9, 4, 5, 40),
      const Color(0xFF0F8644),
      false,
    ),
    Meeting(
      'Match',
      DateTime(2022, 9, 3, 22),
      DateTime(2022, 9, 3, 22, 40),
      const Color(0xFF0F8644),
      false,
    ),
    Meeting(
      'Match',
      DateTime(2022, 9, 7, 7),
      DateTime(2022, 9, 7, 7, 40),
      const Color(0xFF0F8644),
      false,
    ),
    Meeting(
      'Match',
      DateTime(2022, 9, 8, 12),
      DateTime(2022, 9, 8, 12, 40),
      const Color(0xFF0F8644),
      false,
    ),
    Meeting(
      'Match',
      DateTime(2022, 9, 6, 21),
      DateTime(2022, 9, 6, 21, 40),
      const Color(0xFF0F8644),
      false,
    ),
  ];

  CalendarView calenderView = CalendarView.month;

  final CalendarController _calendarController = CalendarController();

  @override
  initState() {
    _calendarController.displayDate = DateTime(2022, 02, 05);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 0, 91, 161),
        title: const Text("Bookings Calender"),
      ),
      body: Column(
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
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              ),
              view: CalendarView.week,
              allowedViews: const [
                CalendarView.day,
                CalendarView.week,
                CalendarView.month,
                CalendarView.schedule,
              ],
              dataSource: MeetingDataSource(bookings),
            ),
          ),
        ],
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
