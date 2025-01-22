import 'package:bloc/bloc.dart';
import 'pickdate_event.dart';
import 'pickdate_state.dart';

class DatePickerBloc extends Bloc<DatePickerEvent, DatePickerState> {
  DatePickerBloc()
      : super(DatePickerState(selectedDate: DateTime.now())) {
    on<SelectDateEvent>((event, emit) {
      emit(state.copyWith(selectedDate: event.selectedDate));
    });
  }
}
