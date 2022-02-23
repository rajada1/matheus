import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

import '../../models/confirmed_food_current_user.dart';
import '../../models/food_details.dart';

class FoodApi {
  Future<ListFoodDetails> getFoodDetails() async {
    var rest = await rootBundle.loadString('assets/food_details.json');

    log('\x1B[32m SUCESS GET FOOD DETAILS');
    var model = ListFoodDetails.fromMap(
      json.decode(rest),
    );
    confirmValue();
    return model;
  }

  confirmValue({ConfirmedFoodCurrentUser? confirmedFoodCurrentUser}) async {}
}
