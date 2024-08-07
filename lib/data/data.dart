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
    Event e = _getMeetingData(index);

    if (e.canceled) {
      return Colors.red;
    } else if (e.attended == false &&
        e.canceled == false &&
        e.to.isBefore(
          DateTime.now(),
        )) {
      return Colors.orange;
    } else if (e.attended) {
      return Colors.green;
    } else {
      return Colors.blue;
    }
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
  /// Creates an Event Booking class with required details.
  Event(
    this.id, {
    required this.eventName,
    required this.from,
    required this.to,
    required this.createdAt,
    required this.background,
    required this.isAllDay,
    required this.name,
    required this.phone,
    this.attended = false,
    this.canceled = false,
    this.email = "",
    this.address = "",
    this.amountPaid = 0,
    this.balance = 0,
  });

  factory Event.fromMap(Map<String, dynamic> eventMap) {
    return Event(
      eventMap['id'],
      background: Colors.blue,
      from: DateTime.fromMillisecondsSinceEpoch(eventMap["startTime"]),
      to: DateTime.fromMillisecondsSinceEpoch(eventMap["endTime"]),
      createdAt: DateTime.fromMillisecondsSinceEpoch(eventMap["createdAt"]),
      eventName: eventMap["eventName"],
      isAllDay: false,
      name: eventMap["name"],
      phone: eventMap["phone"],
      email: eventMap["email"],
      address: eventMap["address"],
      amountPaid: eventMap["amountPaid"],
      balance: eventMap["balance"],
      attended: eventMap['attended'] == 1,
      canceled: eventMap['canceled'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      "eventName": eventName,
      "startTime": from.millisecondsSinceEpoch,
      "endTime": to.millisecondsSinceEpoch,
      "createdAt": createdAt.millisecondsSinceEpoch,
      "name": name,
      "phone": phone,
      "email": email,
      "address": address,
      "amountPaid": amountPaid,
      "balance": balance,
      "attended": attended ? 1 : 0,
      "canceled": canceled ? 1 : 0,
    };

    if (id != null) {
      data['id'] = id;
    }
    return data;
  }

  getStatusColor() {
    if (canceled) {
      return Colors.red;
    } else if (attended == false &&
        canceled == false &&
        to.isBefore(
          DateTime.now(),
        )) {
      return Colors.orange;
    } else if (attended) {
      return Colors.green;
    } else {
      return Colors.blue;
    }
  }

  get isMissed => (attended == false &&
      canceled == false &&
      to.isBefore(
        DateTime.now(),
      ));

  get isUpcomming => (!attended &&
      !canceled &&
      to.isAfter(
        DateTime.now(),
      ));

  int? id;

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  DateTime createdAt;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;

  bool attended;

  bool canceled;

  String name, phone, email, address;

  int amountPaid, balance;
}
