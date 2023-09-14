import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class NewAttendance extends StatefulWidget {
  const NewAttendance({super.key});

  @override
  _NewAttendanceState createState() => _NewAttendanceState();
}

class _NewAttendanceState extends State<NewAttendance> {
  String selectedOption1 = "None";
  String selectedOption2 = 'AIA 1';
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 30));

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate.subtract(Duration(days: 30)),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
                          "None",
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
              TextButton(onPressed: () {}, child: Text("+ Add Subject")),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
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
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Select Date'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              TextButton(onPressed: () {}, child: Text("+ Add Class")),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Handle button click here
                },
                child: Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdowns and DatePicker'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showBottomSheet(context);
          },
          child: Text('Open Bottom Sheet'),
        ),
      ),
    );
  }
}
