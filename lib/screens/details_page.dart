import 'package:private_photo/screens/home.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  DateTime pickedDate;
  TimeOfDay time;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Album'),
        backgroundColor: Colors.red[400],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Detailed Description",
                  labelText: "Description",
                  labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                  border: UnderlineInputBorder()),
              obscureText: false,
              maxLines: 2,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    title: Text(
                        "Date: ${pickedDate.year}, ${pickedDate.month}, ${pickedDate.day},"),
                    trailing: Icon(Icons.calendar_view_day),
                    onTap: _pickDate,
                  ),
                  ListTile(
                    title: Text("Time: ${time.hour}:${time.minute},"),
                    trailing: Icon(Icons.lock_clock),
                    onTap: _pickTime,
                  ),
                ],
              ),
            ),
            FlatButton.icon(
              label: Text('Save'),
              icon: Icon(Icons.save),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              color: Colors.red,
            ),
          ]),
        ),
      ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDate,
    );

    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  _pickTime() async {
    TimeOfDay t = await showTimePicker(
      context: context,
      initialTime: time,
    );

    if (t != null) {
      setState(() {
        time = t;
      });
    }
  }
}
