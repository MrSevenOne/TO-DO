// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todo_app/widget/intl/date/date_format.dart';
//
// import 'bloc/pickdate/pickdate_bloc.dart';
// import 'bloc/pickdate/pickdate_event.dart';
// import 'bloc/pickdate/pickdate_state.dart';
//
// class DatePickerPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Date Picker with Bloc")),
//       body: Column(
//         children: [
//           // Kalendar sanasi tanlash
//           BlocBuilder<DatePickerBloc, DatePickerState>(
//             builder: (context, state) {
//               return Column(
//                 children: [
//                   Text(
//                     "Selected Date: ${formatDateTime(state.selectedDate)}",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       showDatePicker(
//                         context: context,
//                         initialDate: state.selectedDate,
//                         firstDate: DateTime(2000),
//                         lastDate: DateTime(2100),
//                       ).then((selectedDate) {
//                         if (selectedDate != null) {
//                           // Tanlangan sanani Bloc orqali yangilash
//                           context.read<DatePickerBloc>().add(SelectDateEvent(selectedDate));
//                         }
//                       });
//                     },
//                     child: Text("Pick a Date"),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
