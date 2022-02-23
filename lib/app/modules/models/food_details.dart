// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'confirmed_food_current_user.dart';
import 'food.dart';

class ListFoodDetails {
  List<Food?>? foods;
  ConfirmedFoodCurrentUser? confirmed_food_current_user;
  ListFoodDetails({
    this.foods,
    this.confirmed_food_current_user,
  });

  Map<String, dynamic> toMap() {
    return {
      'foods': foods?.map((x) => x?.toMap()).toList(),
      'confirmed_food_current_user': confirmed_food_current_user?.toMap(),
    };
  }

  factory ListFoodDetails.fromMap(Map<String, dynamic> map) {
    return ListFoodDetails(
      foods: map['foods'] != null
          ? List<Food?>.from(map['foods']?.map((x) => Food?.fromMap(x)))
          : null,
      confirmed_food_current_user: map['confirmed_food_current_user'] != null
          ? ConfirmedFoodCurrentUser.fromMap(map['confirmed_food_current_user'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListFoodDetails.fromJson(String source) =>
      ListFoodDetails.fromMap(json.decode(source));
}
