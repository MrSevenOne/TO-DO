import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../bloc/day_pick/daypick_bloc.dart';
import '../../../../../bloc/day_pick/daypick_event.dart';
import '../../../../../bloc/day_pick/daypick_state.dart';



class DatePickWidget extends StatelessWidget {
  const DatePickWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayPickerBloc, DaypickState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            // Sana tanlash oynasini ko'rsatish uchun event yuboriladi
            showDatePicker(
              context: context,
              initialDate: state.selectedDay,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            ).then((selectedDate) {
              if (selectedDate != null) {
                // Bloc orqali yangi sanani tanlash eventini yuboramiz
                context.read<DayPickerBloc>().add(
                  SelectDayEvent(selectedDate),
                );
              }
            });
          },
          icon: Icon(Icons.calendar_month),
        );
      },
    );
  }
}
