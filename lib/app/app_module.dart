import 'package:flutter_modular/flutter_modular.dart';
import 'package:restaurant_app/app/modules/home/home_page.dart';
import 'package:restaurant_app/app/modules/home/home_store.dart';
import 'package:restaurant_app/app/modules/splash/splash_page.dart';
import 'package:restaurant_app/app/modules/splash/splash_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => SplashStore(i<HomeStore>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const SplashPage()),
    ChildRoute('/home',
        child: (context, args) => const HomePage(),
        transition: TransitionType.size),
  ];
}
