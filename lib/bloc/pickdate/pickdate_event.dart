abstract class DatePickerEvent {}

class SelectDateEvent extends DatePickerEvent {
  final DateTime selectedDate;

  SelectDateEvent(this.selectedDate);
}
