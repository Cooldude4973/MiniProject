import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String selectedOption1 = 'FAI';
  String selectedOption2 = 'AIA 1';
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 30));

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate.subtract(Duration(days: 30)),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  DropdownButton<String>(
                    value: selectedOption1,
                    onChanged: (newValue) {
                      setState(() {
                        selectedOption1 = newValue!;
                      });
                    },
                    items: <String>['FAI', 'DAA', 'OS'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  DropdownButton<String>(
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
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Select Date'),
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Handle button click here
                  Navigator.of(context).pop(); // Close the bottom sheet
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
