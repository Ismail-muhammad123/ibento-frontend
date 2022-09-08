import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import '../data/data.dart';
import 'package:path/path.dart' as path;
import 'dart:ui' as ui;
// import 'package:pdf/widgets.dart' as pw;

class BookingDetails extends StatefulWidget {
  BookingDetails({
    Key? key,
    required this.event,
  }) : super(key: key);

  Event event;

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  final TextStyle _contetntStyle = const TextStyle(
    fontSize: 16,
  );

  final TextStyle headingStyle = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  final GlobalKey genKey = GlobalKey();

  Future _printReciept() async {
    Event event = widget.event;
    RenderRepaintBoundary? boundary =
        genKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    ui.Image? image = await boundary?.toImage();
    ByteData? byteData = await image?.toByteData(
      format: ui.ImageByteFormat.png,
    );
    // Read the image as bytes
    Uint8List? pngBytes = byteData?.buffer.asUint8List();

    // Write the image bytes to a temporary file

    // var directory = (await getApplicationDocumentsDirectory()).path;

    var dir = Directory(path.join(
            (await getApplicationDocumentsDirectory()).path,
            'booking-reciepts'))
        .create()
        .then((value) => value.path);
    File imgFile = File(path.join(
        await dir, 'Reciept-${event.id}-${event.eventName}-${event.name}.jpg'));

    return await imgFile.writeAsBytes(pngBytes!);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600.0,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: RepaintBoundary(
                  key: genKey,
                  child: Container(
                    width: double.maxFinite,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        children: [
                          Text(
                            "Ibento Technologies Limited".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            "Booking Reciept",
                            style: headingStyle,
                          ),
                          Text(
                            "Booking ID: #${widget.event.id.toString().padLeft(5, '0')}",
                            style: headingStyle,
                          ),
                          Divider(),
                          // Customer info
                          Container(
                            padding: EdgeInsets.all(12.0),
                            width: double.maxFinite,
                            color: Colors.blue.withOpacity(0.3),
                            child: Text(
                              "Customer Information".toUpperCase(),
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name:",
                                style: headingStyle,
                              ),
                              Text(
                                widget.event.name,
                                style: _contetntStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Address:",
                                style: headingStyle,
                              ),
                              Text(
                                widget.event.address,
                                style: _contetntStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Email:",
                                style: headingStyle,
                              ),
                              Text(
                                widget.event.email,
                                style: _contetntStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mobile Number:",
                                style: headingStyle,
                              ),
                              Text(
                                widget.event.phone,
                                style: _contetntStyle,
                              ),
                            ],
                          ),
                          // Booking Info
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0)),
                          Container(
                            padding: EdgeInsets.all(12.0),
                            width: double.maxFinite,
                            color: Colors.blue.withOpacity(0.3),
                            child: Text(
                              "Booking Information".toUpperCase(),
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Title:",
                                style: headingStyle,
                              ),
                              Text(
                                widget.event.eventName,
                                style: _contetntStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Date:",
                                style: headingStyle,
                              ),
                              Text(
                                DateFormat('MMMM d, yyyy')
                                    .format(widget.event.from),
                                style: _contetntStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "From:",
                                style: headingStyle,
                              ),
                              Text(
                                DateFormat('h:mm a').format(widget.event.from),
                                style: _contetntStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "To",
                                style: headingStyle,
                              ),
                              Text(
                                DateFormat('h:mm a').format(widget.event.to),
                                style: _contetntStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Status",
                                style: headingStyle,
                              ),
                              Text(
                                widget.event.isMissed
                                    ? "Missed"
                                    : widget.event.attended
                                        ? "Attended"
                                        : widget.event.canceled
                                            ? "Canceled"
                                            : "Upcomming",
                                style: _contetntStyle.copyWith(
                                    color: widget.event.getStatusColor()),
                              ),
                            ],
                          ),
                          // Payment information
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0)),
                          Container(
                            padding: EdgeInsets.all(12.0),
                            width: double.maxFinite,
                            color: Colors.blue.withOpacity(0.3),
                            child: Text(
                              "Payment Information".toUpperCase(),
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Amount Paid",
                                style: headingStyle,
                              ),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0)),
                              Text(
                                "NGN ${widget.event.amountPaid}",
                                style: _contetntStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Balance Left",
                                style: headingStyle,
                              ),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0)),
                              Text(
                                "NGN ${widget.event.balance}",
                                style: _contetntStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              minWidth: double.maxFinite,
              onPressed: () async => await _printReciept(),
              color: Colors.blue,
              child: Text("Print"),
            ),
          ),
        ],
      ),
    );
  }
}
