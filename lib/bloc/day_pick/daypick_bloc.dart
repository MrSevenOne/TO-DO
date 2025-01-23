import 'package:bloc/bloc.dart';
import 'daypick_event.dart';
import 'daypick_state.dart';

class DayPickerBloc extends Bloc<DaypickEvent, DaypickState> {
  DayPickerBloc()
      : super(DaypickState(selectedDay: DateTime.now())) {
    on<SelectDayEvent>((event, emit) {
      emit(state.copyWith(selectedDay: event.selectedDay));
    });
  }
}
