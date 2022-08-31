import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BookingsCalender extends StatefulWidget {
  const BookingsCalender({Key? key}) : super(key: key);

  @override
  State<BookingsCalender> createState() => _BookingsCalenderState();
}

class _BookingsCalenderState extends State<BookingsCalender> {
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 12);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
        Meeting('Match', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }

  CalendarView calenderView = CalendarView.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 42, 75),
        title: const Text("Bookings Calender"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            color: Color.fromARGB(255, 238, 238, 238),
            width: double.maxFinite,
            child: Row(
              children: [
                Text("Calender View"),
                Spacer(),
                MaterialButton(
                  onPressed: () => setState(
                    () => calenderView = CalendarView.month,
                  ),
                  child: Text("Month"),
                ),
                MaterialButton(
                  onPressed: () => setState(
                    () => calenderView = CalendarView.timelineMonth,
                  ),
                  child: Text("Timeline month"),
                ),
                MaterialButton(
                  onPressed: () => setState(
                    () => calenderView = CalendarView.day,
                  ),
                  child: Text("day"),
                ),
                MaterialButton(
                  onPressed: () => setState(
                    () => calenderView = CalendarView.timelineDay,
                  ),
                  child: Text("Day Timeline"),
                ),
                MaterialButton(
                  onPressed: () => setState(
                    () => calenderView = CalendarView.week,
                  ),
                  child: Text("Day Timeline"),
                ),
              ],
            ),
          ),
          Expanded(
            child: SfCalendar(
              showNavigationArrow: true,
              showDatePickerButton: true,
              monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              ),
              view: calenderView,
              dataSource: MeetingDataSource(_getDataSource()),
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
