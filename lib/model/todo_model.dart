class TodoModel {
  final int? id;
  final String title;
  final String description;
  final bool isCompleted;
  final String day;
  final String time;

  TodoModel({
    this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.day,
    required this.time
  });

  // Convert a TodoModel into a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted ? 0 : 1,
      'day': day,
      'time': time
    };
  }

  // Create a TodoModel from a Map
  factory TodoModel.fromJson(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isCompleted: map['isCompleted'] == 1,
      day: map['day'],
      time: map['time']
    );
  }
}
