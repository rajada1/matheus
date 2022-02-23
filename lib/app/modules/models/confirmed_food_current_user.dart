import 'dart:convert';

import 'confirmations.dart';

class ConfirmedFoodCurrentUser {
  List<Confirmations?>? confirmations;
  ConfirmedFoodCurrentUser({
    this.confirmations,
  });

  Map<String, dynamic> toMap() {
    return {
      'confirmations': confirmations?.map((x) => x?.toMap()).toList(),
    };
  }

  factory ConfirmedFoodCurrentUser.fromMap(Map<String, dynamic> map) {
    return ConfirmedFoodCurrentUser(
      confirmations: map['confirmations'] != null
          ? List<Confirmations?>.from(
              map['confirmations']?.map((x) => Confirmations?.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfirmedFoodCurrentUser.fromJson(String source) =>
      ConfirmedFoodCurrentUser.fromMap(json.decode(source));
}
