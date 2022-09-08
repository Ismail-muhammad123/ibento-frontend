import 'package:flutter/foundation.dart';
import 'package:ibento/data/data.dart';
import 'package:ibento/database/database.dart';

class BookingsProvider extends ChangeNotifier {
  DatabaseClass db = DatabaseClass();

  Future<List<Event>> getAllEvents() async => await db.fetchEvents();

  Future<List<String>> addEvent(
    Event event, {
    bool repeat = false,
    int repeatations = 0,
    String repeatPattern = "d",
  }) async {
    if (event.from.isBefore(DateTime.now())) {
      return [
        "Selected Date is in the past, update the date and time to a time in the future",
      ];
    }
    if (repeat) {
      List<Event> repeatEvents = [];
      DateTime startDate = event.from;
      DateTime finishDate = event.to;

      int r = repeatations;

      while (r > 0) {
        switch (repeatPattern.toLowerCase()) {
          case "d":
            Event ev = Event(
              null,
              createdAt: event.createdAt,
              name: event.name,
              phone: event.phone,
              address: event.phone,
              email: event.email,
              amountPaid: event.amountPaid,
              balance: event.amountPaid,
              eventName: event.eventName,
              background: event.background,
              isAllDay: event.isAllDay,
              from: DateTime(
                startDate.year,
                startDate.month,
                startDate.day +
                    r, // add days = (current iteartion of repeatation) * one day, to starting day
                startDate.hour,
                startDate.minute,
                startDate.second,
              ),
              to: DateTime(
                startDate.year,
                startDate.month,
                startDate.day +
                    r, // add days = (current iteartion of repeatation) * one day, to starting day
                finishDate.hour,
                finishDate.minute,
                finishDate.second,
              ),
            );
            repeatEvents.add(ev);
            break;
          case "w":
            Event ev = Event(
              null,
              createdAt: event.createdAt,
              name: event.name,
              phone: event.phone,
              address: event.phone,
              email: event.email,
              amountPaid: event.amountPaid,
              balance: event.amountPaid,
              eventName: event.eventName,
              background: event.background,
              isAllDay: event.isAllDay,
              from: DateTime(
                startDate.year,
                startDate.month,
                startDate.day +
                    7 * r, // add days = (current iteartion of repeatation) * week days, to starting day
                startDate.hour,
                startDate.minute,
                startDate.second,
              ),
              to: DateTime(
                startDate.year,
                startDate.month,
                startDate.day +
                    7 * r, // add days = (current iteartion of repeatation) * week days, to starting day
                finishDate.hour,
                finishDate.minute,
                finishDate.second,
              ),
            );
            repeatEvents.add(ev);
            break;
          case "m":
            Event ev = Event(
              null,
              createdAt: event.createdAt,
              name: event.name,
              phone: event.phone,
              address: event.phone,
              email: event.email,
              amountPaid: event.amountPaid,
              balance: event.amountPaid,
              eventName: event.eventName,
              background: event.background,
              isAllDay: event.isAllDay,
              from: DateTime(
                startDate.year,
                startDate.month +
                    r, // add days = current iteartion of repeatation, to starting month
                startDate.day,
                startDate.hour,
                startDate.minute,
                startDate.second,
              ),
              to: DateTime(
                startDate.year,
                startDate.month +
                    r, // add days = current iteartion of repeatation, to starting month
                startDate.day,
                finishDate.hour,
                finishDate.minute,
                finishDate.second,
              ),
            );
            repeatEvents.add(ev);
            break;
          default:
        }

        r--;
      }

      List<String> errors = [];

      // loop through the added events
      for (Event evt in repeatEvents) {
        int result = await db.insert(evt);
        if (result == 0) {
          errors
              .add("Complict has eccured while inserting at date ${evt.from}");
        }
        notifyListeners();
        return errors;
      }
    }

    int result = await db.insert(event);
    if (result == 0) {
      return [
        "a complict has been encountered",
      ];
    } else {
      notifyListeners();
      return [];
    }
  }

  Future<List<String>> updateEvent(Event event) async {
    if (event.from.isBefore(DateTime.now())) {
      return [
        "Selected Date is in the past, update the date and time to a time in the future",
      ];
    }
    int result = await db.updateEvent(event);
    if (result == 0) {
      return [
        "a complict has been encountered",
      ];
    } else {
      notifyListeners();
      return [];
    }
  }
<<<<<<< HEAD
=======

  // Future<Event> getEventDetails(int id) async {}
>>>>>>> eb31bf182700d0e2750699954d460bca41200198
}
