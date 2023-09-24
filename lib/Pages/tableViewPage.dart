import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_1/Data/dimensions.dart';
import 'package:mini_1/Modals/attendanceModel.dart';
import 'package:mini_1/Providers/attendanceProvider.dart';

class attendanceTable extends ConsumerWidget {
  const attendanceTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Attendance> attendanceList = ref.watch(attendanceProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('Attendace Record'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                if (attendanceList.isEmpty) ...[
                  noData(context)
                ] else ...[
                  dataTable(
                    attendanceList: attendanceList,
                  )
                ]
              ],
            ),
          ),
        ));
  }
}

Widget noData(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.red,
    ),
    height: 200,
    width: getDimensionWidth(context),
    child: const Center(
        child: Text(
      'No attendance recorded yet ...',
      style: TextStyle(color: Colors.white, fontSize: 24),
    )),
  );
}

class dataTable extends StatelessWidget {
  const dataTable({
    super.key,
    required this.attendanceList,
  });

  final List<Attendance> attendanceList;

  @override
  Widget build(BuildContext context) {
    return DataTable(
        dividerThickness: 2,
        headingRowColor: MaterialStateProperty.all(Colors.black12),
        columns: [
          DataColumn(
            label: Text('Class'),
          ),
          DataColumn(label: _verticalDivider),
          DataColumn(
            label: Text('Subject'),
          ),
          DataColumn(label: _verticalDivider),
          DataColumn(
            label: Text('Date'),
          ),
          DataColumn(label: _verticalDivider),
          DataColumn(
            label: Text('Attendance'),
          ),
          DataColumn(label: _verticalDivider),
          DataColumn(
            label: Text('Image'),
          ),
        ],
        rows: [
          // DataRow(
          //   cells: [
          //     DataCell(Text('Hello World')),
          //     DataCell(Text('Hello World')),
          //     DataCell(Text('Hello World')),
          //     DataCell(Text('Hello World')),
          //     DataCell(Text('Hello World')),
          //   ],
          // ),
          // DataRow(
          //   cells: [
          //     DataCell(Text('Hello World')),
          //     DataCell(Text('Hello World')),
          //     DataCell(Text('Hello World')),
          //     DataCell(Text('Hello World')),
          //     DataCell(Text('Hello World')),
          //   ],
          // )
          for (int i = 0; i < attendanceList.length; i++) ...[
            DataRow(cells: [
              DataCell(Text(attendanceList[i].className)),
              DataCell(_verticalDivider),
              DataCell(Text(attendanceList[i].subjet)),
              DataCell(_verticalDivider),
              DataCell(Text(attendanceList[i].dateTime)),
              DataCell(_verticalDivider),
              DataCell(Text(attendanceList[i].count.toString())),
              DataCell(_verticalDivider),
              DataCell(TextButton(
                child: Text("Click to View Image"),
                onPressed: () {},
              )),
            ])
          ]
        ]);
  }
}

Widget _verticalDivider = const VerticalDivider(
  color: Colors.black,
  thickness: 1,
);
