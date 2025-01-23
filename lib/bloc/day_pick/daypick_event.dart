abstract class DaypickEvent {}

class SelectDayEvent extends DaypickEvent {
  final DateTime selectedDay;

  SelectDayEvent(this.selectedDay);
}
