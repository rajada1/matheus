import 'dart:convert';

import 'food_details_class.dart';

class Food {
  FoodDetails? foodDetailsClass;
  Food({
    this.foodDetailsClass,
  });

  Map<String, dynamic> toMap() {
    return {
      'foodDetails': foodDetailsClass?.toMap(),
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      foodDetailsClass: map['foodDetails'] != null
          ? FoodDetails.fromMap(map['foodDetails'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source));
}
