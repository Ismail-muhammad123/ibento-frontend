import 'package:flutter/material.dart';
import 'package:ibento/data/data.dart';
import 'package:ibento/data/sample_data.dart';
import 'package:intl/intl.dart';

class NewBooking extends StatefulWidget {
  const NewBooking({Key? key}) : super(key: key);

  @override
  State<NewBooking> createState() => _NewBookingState();
}

class _NewBookingState extends State<NewBooking> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay finishTime = TimeOfDay(hour: 23, minute: 59);
  DateTime dateTime = DateTime.now();
  bool showDate = false;
  bool showTime = false;
  bool showDateTime = false;

  Venue assignedVenue = sample_venues[0];
  bool repeat = false;
  int repeatPattern = 0;

  int status = 0;

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _finishTimeController = TextEditingController();

  List<Venue> _getVenues() => sample_venues;

  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

  // Select for Time
  Future<TimeOfDay> _selectStartTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: startTime,
    );
    if (selected != null && selected != startTime) {
      setState(() {
        startTime = selected;
      });
    }
    return startTime;
  }

  Future<TimeOfDay> _selectFinishTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: finishTime,
    );
    if (selected != null && selected != finishTime) {
      setState(() {
        finishTime = selected;
      });
    }
    return finishTime;
  }
  // select date time picker

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
  }

  String getDateTime() {
    // ignore: unnecessary_null_comparison
    if (dateTime == null) {
      return 'select date timer';
    } else {
      return DateFormat('yyyy-MM-dd HH: ss a').format(dateTime);
    }
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  @override
  void dispose() {
    _dateController.dispose();
    _startTimeController.dispose();
    _finishTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text("Name"),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text("Phone Number"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text("Email (optionl)"),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text("Address (optional) "),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text("Booking Title (optional)"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _dateController,
                    onTap: () {
                      _selectDate(context).then(
                        (value) => setState(
                          () => _dateController.text = getDate(),
                        ),
                      );
                    },
                    decoration: InputDecoration(
                      label: Text("Event Date"),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _startTimeController,
                    onTap: () => _selectStartTime(context).then(
                      (value) => setState(
                        () {
                          _startTimeController.text = getTime(value);
                        },
                      ),
                    ),
                    decoration: InputDecoration(
                      label: Text("Start Time"),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _finishTimeController,
                    onTap: () => _selectStartTime(context).then(
                      (value) => setState(
                        () {
                          _finishTimeController.text = getTime(value);
                        },
                      ),
                    ),
                    decoration: InputDecoration(
                      label: Text("Finish Time"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text("Repeat:"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Checkbox(
                  value: repeat,
                  onChanged: (val) => setState(
                    () => repeat = val as bool,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    value: repeatPattern,
                    items: [
                      DropdownMenuItem(
                        child: Text("Daily"),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text("Weekly"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Monthly"),
                        value: 2,
                      ),
                    ],
                    onChanged: repeat
                        ? (v) => setState(() => repeatPattern = v as int)
                        : null,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    hint: Text("Assigned Venue"),
                    value: assignedVenue,
                    items: sample_venues
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(e.name),
                            value: e,
                          ),
                        )
                        .toList(),
                    onChanged: (v) =>
                        setState(() => assignedVenue = v as Venue),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      label: Text("Amount Paid"),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text("Balance"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child: Text("Save"),
                  color: Colors.green,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
