class DaypickState {
  final DateTime selectedDay;

  DaypickState({required this.selectedDay});

  DaypickState copyWith({DateTime? selectedDay}) {
    return DaypickState(
      selectedDay: selectedDay ?? this.selectedDay,
    );
  }
}
