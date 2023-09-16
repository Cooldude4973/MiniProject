import 'package:flutter/material.dart';
import 'package:mini_1/Pages/CameraPage.dart';

import '../Modals/Formatters.dart';

class newAttendance extends StatefulWidget {
  const newAttendance({super.key});

  @override
  State<newAttendance> createState() => newAttendanceState();
}

class newAttendanceState extends State<newAttendance> {
  String selectedOption1 = 'Foundation Of Artificial Intelligence';
  String selectedOption2 = 'AIA 1';
  DateTime? selectedDate = null;

  Future<void> _selectDate(BuildContext context) async {
    DateTime today = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today.subtract(Duration(days: 30)),
      lastDate: today,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _showDialog(BuildContext context, String hintText, String heading) {
    TextEditingController textController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(heading),
          content: TextField(
            controller: textController,
            decoration: InputDecoration(hintText: hintText),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                String text = textController.text;
                // Handle the 'Save' button press with the entered text value
                // (you can save the text or perform any other action here)
                print('Text entered: $text');
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    value: selectedOption1,
                    onChanged: (newValue) {
                      setState(() {
                        selectedOption1 = newValue!;
                      });
                    },
                    items: <String>[
                      'Foundation Of Artificial Intelligence',
                      'Operating System',
                      'Design Algorithm and Analysis'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          TextButton(
              onPressed: () {
                _showDialog(
                    context, "Example : Operting System", "Enter Subject name");
              },
              child: Text("+ Add Subject")),
          SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    value: selectedOption2,
                    onChanged: (newValue) {
                      setState(() {
                        selectedOption2 = newValue!;
                      });
                    },
                    items: <String>['AIA 1', 'AIA 3'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Text(selectedDate == null
                  ? 'No Selected Date'
                  : formatter.format(selectedDate!)),
              IconButton(
                onPressed: () {
                  _selectDate(context);
                },
                icon: const Icon(Icons.calendar_month),
              )
            ],
          ),
          SizedBox(height: 16.0),
          TextButton(
              onPressed: () {
                _showDialog(context, "Example : AIA 1", "Enter Class name ");
              },
              child: Text("+ Add Class")),
          SizedBox(height: 16.0),
          Center(
            child: FloatingActionButton(
              onPressed: () {
                // Handle button click here
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return CameraPage();
                  }));
                },
                child: Image.asset(
                  "assets/images/ClickImage.png",
                  height: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
