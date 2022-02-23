import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:restaurant_app/app/modules/home/home_store.dart';

class SplashStore extends NotifierStore<Exception, int> {
  final HomeStore homeStore;
  SplashStore(
    this.homeStore,
  ) : super(0);

  goToHomePage() async {
    await homeStore.getFoodDetails();

    await Future.delayed(const Duration(seconds: 3)); //Fake Call API

    Modular.to.navigate('/home');
  }
}
