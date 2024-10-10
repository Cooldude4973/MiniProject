import 'package:mini_1/Data/attendanceData.dart';
import 'package:mini_1/Modals/attendanceModel.dart';
import 'package:riverpod/riverpod.dart';

class AttendanceNotifier extends StateNotifier<List<Attendance>> {
  AttendanceNotifier() : super(myAttendance);

  void addAttendance(Attendance attendance) {
    state = [...state, attendance];
    // for (int i = 0; i < state.length; i++) {
    //   print(state[i].className);
    //   print(state[i].subjet);
    //   print(state[i].dateTime);
    //   print(state[i].imageURL);
    // }
  }
}

final attendanceProvider =
    StateNotifierProvider<AttendanceNotifier, List<Attendance>>((ref) {
  return AttendanceNotifier();
});
