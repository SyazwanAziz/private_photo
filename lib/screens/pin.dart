import 'package:private_photo/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class HomePin extends StatelessWidget {
  final String pinNumber = '1111';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Pin'),
        backgroundColor: Colors.red[300],
        elevation: 0,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter pin number',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 30.0),
              PinCodeTextField(
                backgroundColor: Colors.transparent,
                appContext: context,
                length: 4,
                onChanged: (value) {
                  print(value);
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  inactiveColor: Colors.red,
                  activeColor: Colors.white,
                  selectedColor: Colors.white70,
                ),
                onCompleted: (value) {
                  if (value == pinNumber) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  } else {
                    AlertDialog(
                      title: Text("Invalid Pin"),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePin(),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
