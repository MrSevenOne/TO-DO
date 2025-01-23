import 'package:flutter/material.dart';

abstract class TimePickEvent {}

class SelectTimeEvent extends TimePickEvent {
  final TimeOfDay selecttime;

  SelectTimeEvent({required this.selecttime});
}
