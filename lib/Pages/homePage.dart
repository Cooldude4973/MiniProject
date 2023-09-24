import 'package:flutter/material.dart';
import 'package:mini_1/Pages/NewAttendance.dart';
import 'package:mini_1/Pages/bottomModalPage.dart';
import 'package:mini_1/Pages/tableViewPage.dart';
import 'package:mini_1/Widgets/homePageCard.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    void _openModalOverlay() {
      showModalBottomSheet(
          useSafeArea: true,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          ),
          context: context,
          builder: (cxt) => newAttendance());
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: 50,
          left: 10,
          right: 10,
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                _openModalOverlay();
              },
              child: homePageCard(
                imageURL: "Plus",
                title: "Add Attendance",
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return attendanceTable();
                }));
              },
              child: homePageCard(
                imageURL: "HistoryAttendance",
                title: "Attendance Record",
              ),
            ),
            homePageCard(
              imageURL: "UpdateAttendance",
              title: "Update Attendance",
            ),
            homePageCard(
              imageURL: "ConvertToPDF",
              title: "Convert to PDF",
            ),
            // homePageCard(),
          ],
        ),
      ),
    );
  }
}
