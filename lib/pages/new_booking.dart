import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibento/data/data.dart';
import 'package:ibento/providers/bookings_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class NewBooking extends StatefulWidget {
  NewBooking({
    Key? key,
    this.dateTime,
    this.event,
  }) : super(key: key);

  DateTime? dateTime;
  Event? event;

  @override
  State<NewBooking> createState() => _NewBookingState();
}

class _NewBookingState extends State<NewBooking> {
  DateTime selectedDate = DateTime.now();

  bool repeat = false;
  String repeatPattern = "d";
  TimeOfDay eventStartTime = TimeOfDay.now();
  TimeOfDay eventFinishTime = TimeOfDay.now();
  int status = 0;

  bool _updating = false;

  bool _loading = false;

  bool _saved = false;

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _finishTimeController = TextEditingController();
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _repeatationsController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _amountPaidController = TextEditingController();
  final TextEditingController _balanceController = TextEditingController();

  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
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
    TimeOfDay startTime = widget.dateTime != null
        ? TimeOfDay(
            hour: widget.dateTime!.hour, minute: widget.dateTime!.minute)
        : TimeOfDay.now();
    final selected = await showTimePicker(
      context: context,
      initialTime: startTime,
    );
    if (selected != null) {
      setState(() {
        startTime = selected;
      });
    }
    return startTime;
  }

  Future<TimeOfDay> _selectFinishTime(BuildContext context) async {
    TimeOfDay startTime = widget.dateTime != null
        ? TimeOfDay(
            hour: widget.dateTime!.hour, minute: widget.dateTime!.minute)
        : TimeOfDay.now();
    TimeOfDay finishTime =
        TimeOfDay(hour: startTime.hour + 1, minute: startTime.minute);
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

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  Event _getNewEvent() {
    DateTime eventDate = selectedDate;
    DateTime eventstartDate = DateTime(
      eventDate.year,
      eventDate.month,
      eventDate.day,
      eventStartTime.hour,
      eventStartTime.minute,
    );
    DateTime eventfinishDate = DateTime(
      eventDate.year,
      eventDate.month,
      eventDate.day,
      eventFinishTime.hour,
      eventFinishTime.minute,
    );
    Event event = Event(
      _updating ? widget.event!.id : null,
      attended: _updating ? widget.event!.attended : false,
      canceled: _updating ? widget.event!.canceled : false,
      createdAt: _updating ? widget.event!.createdAt : DateTime.now(),
      name: _nameController.text,
      phone: _phoneNumberController.text,
      address: _phoneNumberController.text,
      email: _emailController.text,
      amountPaid: int.parse(_amountPaidController.text.isEmpty
          ? "0"
          : _amountPaidController.text),
      balance: int.parse(
          _balanceController.text.isEmpty ? "0" : _balanceController.text),
      background: Colors.blue,
      eventName: _eventNameController.text,
      from: eventstartDate,
      to: eventfinishDate,
      isAllDay: _updating ? widget.event!.isAllDay : false,
    );
    return event;
  }

  @override
  void initState() {
    if (widget.event != null) {
      // set the mode to updating
      _updating = true;

      // populate the form fields with the value
      _dateController.text =
          DateFormat('MMM d, yyyy').format(widget.event!.from);
      _startTimeController.text = DateFormat.jm().format(widget.event!.from);
      _finishTimeController.text = DateFormat.jm().format(widget.event!.from);
      _eventNameController.text = widget.event!.eventName;
      _nameController.text = widget.event!.name;
      _phoneNumberController.text = widget.event!.phone;
      _emailController.text = widget.event!.email;
      _addressController.text = widget.event!.address;
      _amountPaidController.text = widget.event!.amountPaid.toString();
      _balanceController.text = widget.event!.balance.toString();

      // set the variables with the data from the event
      selectedDate = widget.event!.from;
      eventStartTime = TimeOfDay(
          hour: widget.event!.from.hour, minute: widget.event!.from.minute);
      eventFinishTime = TimeOfDay(
          hour: widget.event!.from.hour + 1, minute: widget.event!.from.minute);
    } else {
      eventStartTime = widget.dateTime != null
          ? TimeOfDay(
              hour: widget.dateTime!.hour, minute: widget.dateTime!.minute)
          : TimeOfDay.now();
      eventFinishTime = TimeOfDay(
          hour: eventStartTime.hour + 1, minute: eventStartTime.minute);
      _dateController.text =
          DateFormat('MMM d, yyyy').format(widget.dateTime ?? selectedDate);
      selectedDate = widget.dateTime ?? selectedDate;
      _startTimeController.text =
          DateFormat.jm().format(widget.dateTime ?? selectedDate);
    }
    super.initState();
  }

  @override
  void dispose() {
    _dateController.dispose();
    _startTimeController.dispose();
    _finishTimeController.dispose();
    _eventNameController.dispose();
    _repeatationsController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _amountPaidController.dispose();
    _balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "New Booking",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _nameController,
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
                            keyboardType: TextInputType.phone,
                            controller: _phoneNumberController,
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
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
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
                            controller: _addressController,
                            keyboardType: TextInputType.streetAddress,
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
                            controller: _eventNameController,
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
                            // initialValue: getTime(
                            //   TimeOfDay(
                            //     hour: widget.dateTime!.hour,
                            //     minute: widget.dateTime!.minute,
                            //   ),
                            // ),
                            controller: _startTimeController,
                            onTap: () => _selectStartTime(context).then(
                              (value) => setState(
                                () {
                                  eventStartTime = value;
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
                            onTap: () => _selectFinishTime(context).then(
                              (value) => setState(
                                () {
                                  eventFinishTime = value;
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
                          onChanged: _updating
                              ? null
                              : (val) => setState(
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
                                value: "d",
                              ),
                              DropdownMenuItem(
                                child: Text("Weekly"),
                                value: "w",
                              ),
                              DropdownMenuItem(
                                child: Text("Monthly"),
                                value: "m",
                              ),
                            ],
                            onChanged: repeat
                                ? (v) =>
                                    setState(() => repeatPattern = v as String)
                                : null,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _repeatationsController,
                            enabled: repeat,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              suffix: Text("times"),
                              label: Text("Number of repetations"),
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
                            controller: _amountPaidController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
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
                            controller: _balanceController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                              label: Text("Balance"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  MaterialButton(
                    onPressed: _saved
                        ? null
                        : _updating
                            ? () async {
                                // update event
                                if (_eventNameController.text.isEmpty) {
                                  await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Text(
                                          "Event Name Field must not be empty"),
                                      actions: [
                                        MaterialButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("okay".toUpperCase()),
                                        ),
                                      ],
                                    ),
                                  );
                                  return;
                                }

                                setState(() {
                                  _loading = true;
                                });
                                List<String> errors = await context
                                    .read<BookingsProvider>()
                                    .updateEvent(
                                      _getNewEvent(),
                                    );
                                if (errors.length > 0) {
                                  await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Row(
                                        children: [
                                          Icon(
                                            Icons.error,
                                            color: Colors.red,
                                          ),
                                          Text(
                                            "Error",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.red,
                                            ),
                                          )
                                        ],
                                      ),
                                      actions: [
                                        MaterialButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: Text("OKAY"),
                                          color: Colors.blue,
                                        )
                                      ],
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children:
                                            errors.map((e) => Text(e)).toList(),
                                      ),
                                    ),
                                  );
                                }
                                setState(() {
                                  _loading = false;
                                  _saved = true;
                                });
                              }
                            : () async {
                                // save new event
                                if (_eventNameController.text.isEmpty) {
                                  await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Text(
                                          "Event Name Field must not be empty"),
                                      actions: [
                                        MaterialButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("okay".toUpperCase()),
                                        ),
                                      ],
                                    ),
                                  );
                                  return;
                                }

                                setState(() {
                                  _loading = true;
                                });
                                List<String> errors = await context
                                    .read<BookingsProvider>()
                                    .addEvent(
                                      _getNewEvent(),
                                      repeat: repeat,
                                      repeatations: _repeatationsController
                                              .text.isNotEmpty
                                          ? int.parse(
                                              _repeatationsController.text)
                                          : 0,
                                      repeatPattern: repeatPattern,
                                    );
                                if (errors.length > 0) {
                                  await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Row(
                                        children: [
                                          Icon(
                                            Icons.error,
                                            color: Colors.red,
                                          ),
                                          Text(
                                            "Error",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.red,
                                            ),
                                          )
                                        ],
                                      ),
                                      actions: [
                                        MaterialButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: Text("OKAY"),
                                          color: Colors.blue,
                                        )
                                      ],
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children:
                                            errors.map((e) => Text(e)).toList(),
                                      ),
                                    ),
                                  );
                                }
                                setState(() {
                                  _loading = false;
                                  _saved = true;
                                });
                              },
                    height: 50,
                    minWidth: 250,
                    color: Colors.blue,
                    child: Text(_saved
                        ? "Finished"
                        : _updating
                            ? "Update"
                            : "Save"),
                  )
                ],
              ),
      ),
    );
  }
}
