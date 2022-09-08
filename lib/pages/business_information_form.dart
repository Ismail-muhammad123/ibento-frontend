import 'package:flutter/material.dart';

class BusinessInformationForm extends StatefulWidget {
  const BusinessInformationForm({
    Key? key,
  }) : super(key: key);

  @override
  State<BusinessInformationForm> createState() =>
      _BusinessInformationFormState();
}

class _BusinessInformationFormState extends State<BusinessInformationForm> {

  @override
  void initState() {
    
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 600.0,
        child: Form(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.zero,
                  ),
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Business Information Form".toUpperCase(),
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text("Business Name"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text("Business Work Address"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text("Email Address"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text("Phone Number"),
                    ),
                  ),
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () {},
                  child: Text("Save"),
                  color: Colors.blue,
                  minWidth: 250.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
