class DatePickerState {
  final DateTime selectedDate;

  DatePickerState({required this.selectedDate});

  DatePickerState copyWith({DateTime? selectedDate}) {
    return DatePickerState(
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }
}
