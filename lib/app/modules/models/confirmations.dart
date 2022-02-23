import 'dart:convert';

class Confirmations {
  int? userId;
  int? foodId;
  int? foodMembers;
  Confirmations({
    this.userId,
    this.foodId,
    this.foodMembers,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'foodId': foodId,
      'foodMembers': foodMembers,
    };
  }

  factory Confirmations.fromMap(Map<String, dynamic> map) {
    return Confirmations(
      userId: map['userId']?.toInt(),
      foodId: map['foodId']?.toInt(),
      foodMembers: map['foodMembers']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Confirmations.fromJson(String source) =>
      Confirmations.fromMap(json.decode(source));
}
