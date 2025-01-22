class TodoModel {
  final int? id;
  final String title;
  final String description;
  final bool isCompleted;
  final String date;

  TodoModel({
    this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.date,
  });

  // Convert a TodoModel into a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
      'date': date,
    };
  }

  // Create a TodoModel from a Map
  factory TodoModel.fromJson(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isCompleted: map['isCompleted'] == 1,
      date: map['date'],
    );
  }
}
