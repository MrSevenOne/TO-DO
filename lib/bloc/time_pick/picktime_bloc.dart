import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/bloc/time_pick/picktime_event.dart';
import 'package:todo_app/bloc/time_pick/picktime_state.dart';

class TimePickBloc extends Bloc<TimePickEvent, TimepickState> {
  TimePickBloc() : super(TimepickState(selectedTime: TimeOfDay.now())) {
    on<SelectTimeEvent>((event, emit) {
      // Yangi tanlangan vaqtni state ichiga saqlaymiz
      emit(state.copyWith(selectedTime: event.selecttime));
    });
  }
}
