import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/time_pick/picktime_bloc.dart';
import 'package:todo_app/bloc/time_pick/picktime_event.dart';
import 'package:todo_app/bloc/time_pick/picktime_state.dart';

class TimePickWidget extends StatelessWidget {
  const TimePickWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimePickBloc, TimepickState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            showTimePicker(
              context: context, initialTime: TimeOfDay.now(),
            ).then((selectedTime) {
              if (selectedTime != null) {
                // Bloc orqali yangi sanani tanlash eventini yuboramiz
                context.read<TimePickBloc>().add(
                      SelectTimeEvent(selecttime: selectedTime),
                    );
              }
            });
          },
          icon: Icon(Icons.lock_clock),
        );
      },
    );
  }
}
