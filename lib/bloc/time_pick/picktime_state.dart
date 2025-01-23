import 'package:flutter/material.dart';

class TimepickState {
  final TimeOfDay selectedTime;

  TimepickState({required this.selectedTime});

  TimepickState copyWith({TimeOfDay? selectedTime}) {
    return TimepickState(
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }
}
