import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class SubjectNotifier extends StateNotifier<List<String>> {
  SubjectNotifier() : super([]);

  void newSubject(String subject) {
    final subjectPresent = state.contains(subject);
    List<String> newSubjects = [];
    if (!subjectPresent) {
      newSubjects = state;
      newSubjects.add(subject);
      state = newSubjects;
    }
  }
}

final SubjectProvider =
    StateNotifierProvider<SubjectNotifier, List<String>>((ref) {
  return SubjectNotifier();
});
