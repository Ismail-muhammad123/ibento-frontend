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
  Event(
    this.eventName,
    this.from,
    this.to,
    this.background,
    this.isAllDay,
    this.createdAt,
    this.assignedVenue,
    this.ammendments,
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
    this.paymentMethod,
    this.amountPayed,
    this.balance,
    this.status,
    this.refunded,
    this.amountRefunded,
    this.checkInTime,
    this.checkoutTime,
  );

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

  // Date at which the records was created
  DateTime createdAt;

  // Venue assigned for this booking
  Venue assignedVenue;

  // number of times the booking was updated
  int ammendments;

  // Name of the person making the booking
  String name;

  // Email of the person making the booking
  String email;

  // telephone number of the person making the booking
  String phoneNumber;

  // Address of the person making the booking
  String address;

  // method of payment
  String paymentMethod;

  // amount payed
  double amountPayed;

  // balance left for payment
  double balance;

  // weather the booking is attended, canceled or missed
  int status;

  // weather the booking paymen ir refunded
  bool refunded;

  // amount refunded if refunded
  double amountRefunded;

  // checkin time
  DateTime checkInTime;

  // checkout Time
  DateTime checkoutTime;
}

class Venue {
  String name;
  bool isAvailable;

  Venue({
    required this.name,
    this.isAvailable = true,
  });
}
