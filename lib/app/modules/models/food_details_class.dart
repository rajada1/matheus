import 'dart:convert';

class FoodDetails {
  int? id;
  DateTime? date;
  String? imagePath;
  String? title;
  String? description;
  FoodDetails({
    this.id,
    this.date,
    this.imagePath,
    this.title,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'image_path': imagePath,
      'title': title,
      'description': description,
    };
  }

  factory FoodDetails.fromMap(Map<String, dynamic> map) {
    return FoodDetails(
      id: map['id']?.toInt(),
      date: DateTime.parse(map['date']),
      imagePath: map['image_path'],
      title: map['title'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodDetails.fromJson(String source) =>
      FoodDetails.fromMap(json.decode(source));
}
