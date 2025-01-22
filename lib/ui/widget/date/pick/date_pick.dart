import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/pickdate/pickdate_bloc.dart';
import '../../../../bloc/pickdate/pickdate_event.dart';
import '../../../../bloc/pickdate/pickdate_state.dart';

class DatePickWidget extends StatelessWidget {
  const DatePickWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatePickerBloc, DatePickerState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            // Sana tanlash oynasini ko'rsatish uchun event yuboriladi
            showDatePicker(
              context: context,
              initialDate: state.selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            ).then((selectedDate) {
              if (selectedDate != null) {
                // Bloc orqali yangi sanani tanlash eventini yuboramiz
                context.read<DatePickerBloc>().add(
                  SelectDateEvent(selectedDate),
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
