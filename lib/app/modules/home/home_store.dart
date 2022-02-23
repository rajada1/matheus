import 'package:flutter_triple/flutter_triple.dart';
import 'package:restaurant_app/app/modules/api/food_api/get_food_list.dart';

import '../models/food_details.dart';

class HomeStore extends NotifierStore<Exception, ListFoodDetails> {
  HomeStore() : super(ListFoodDetails());

  final FoodApi foodApi = FoodApi();

  Future<void> getFoodDetails() async {
    setLoading(true);
    var rest = await foodApi.getFoodDetails();
    update(rest);
    setLoading(false);
  }

  Future<void> increment() async {
    state.foods;
  }
}
