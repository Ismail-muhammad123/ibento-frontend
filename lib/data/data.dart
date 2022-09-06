import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  EventDataSource(List<Event> source) {
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

  Event _getMeetingData(int index) {
    final dynamic event = appointments![index];
    late final Event eventData;
    if (event is Event) {
      eventData = event;
    }

    return eventData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.

class Event {
  /// Creates a meeting class with required details.
  Event({
    required this.eventName,
    required this.from,
    required this.to,
    required this.background,
    required this.isAllDay,
    required this.name,
    required this.phone,
    this.email = "",
    this.address = "",
    this.amountPaid = 0,
    this.balance = 0,
  });

  factory Event.fromMap(Map<String, dynamic> eventMap) {
    return Event(
      background: Colors.blue,
      from: DateTime.fromMillisecondsSinceEpoch(eventMap["startTime"]),
      to: DateTime.fromMillisecondsSinceEpoch(eventMap["endTime"]),
      eventName: eventMap["eventName"],
      isAllDay: false,
      name: eventMap["name"],
      phone: eventMap["phone"],
      email: eventMap["email"],
      address: eventMap["address"],
      amountPaid: eventMap["amountPaid"],
      balance: eventMap["balance"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "eventName": eventName,
      "startTime": from.millisecondsSinceEpoch,
      "endTime": to.millisecondsSinceEpoch,
      "name": name,
      "phone": phone,
      "email": email,
      "address": address,
      "amountPaid": amountPaid,
      "balance": balance,
    };
  }

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

  String name, phone, email, address;

  int amountPaid, balance;
}
