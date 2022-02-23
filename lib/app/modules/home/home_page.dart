import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:restaurant_app/app/modules/home/widgets/details_of_day.dart';
import 'package:restaurant_app/app/modules/home/widgets/drawer_tiles.dart';
import 'package:restaurant_app/app/modules/home/widgets/idicator_tab.dart';
import 'package:restaurant_app/app/modules/home/widgets/tab_bar.dart';
import 'package:restaurant_app/app/utils/restaurant_colors.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final HomeStore store = Modular.get<HomeStore>();
  late AnimationController _animationController;
  late Animation _animationScalle;
  late Animation _animationOffset;
  double transformScale = 1;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool openDrawer = false;

  @override
  void initState() {
    super.initState();
    HomePageTabBar.tabController =
        TabController(length: store.state.foods!.length, vsync: this);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animationScalle = Tween<double>(begin: 1, end: 0.6).animate(
        CurvedAnimation(
            parent: _animationController, curve: Curves.easeOutCubic));
    _animationOffset = Tween<double>(begin: 0, end: 70).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeOutCubic));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.primarySwatch,
          child: AnimatedBuilder(
              animation: _animationScalle,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_animationOffset.value, 0),
                  child: Transform.scale(
                    scale: _animationScalle.value,
                    alignment: AlignmentDirectional.centerEnd,
                    child: GestureDetector(
                      onTap: () {
                        if (openDrawer) {
                          _animationController.reverse();
                          openDrawer = !openDrawer;
                          setState(() {});
                        }
                      },
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Scaffold(
                            key: scaffoldKey,
                            backgroundColor: AppColors.backgroud,
                            appBar: AppBar(
                              backgroundColor: AppColors.backgroud,
                              elevation: 0,
                              leading: GestureDetector(
                                onTap: () {
                                  if (_animationController.isCompleted) {
                                    _animationController.reverse();
                                    openDrawer = !openDrawer;
                                    // setState(() {});
                                  } else {
                                    _animationController.forward();
                                    openDrawer = !openDrawer;
                                    setState(() {});
                                  }
                                  if (_animationController.isCompleted) {}
                                },
                                child: const Icon(
                                  FlutterRemix.menu_4_line,
                                  color: Colors.black,
                                ),
                              ),
                              excludeHeaderSemantics: true,
                              primary: true,
                              toolbarHeight: kToolbarHeight + 20,
                              bottom: TabBar(
                                  isScrollable: true,
                                  labelPadding: const EdgeInsets.all(17),
                                  controller: HomePageTabBar.tabController,
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  indicator: CircleTabIndicator(
                                      radius: 28, color: Colors.red),
                                  tabs: HomePageTabBar.generateTabsDay(
                                      store.state)),
                            ),
                            body: TabBarView(
                              controller: HomePageTabBar.tabController,
                              children: List.generate(
                                  HomePageTabBar.tabController!.length,
                                  (index) => DetailsOfDay(
                                      food: store.state.foods![index],
                                      confirmationFood: store
                                          .state.confirmed_food_current_user)),
                            )),
                      ),
                    ),
                  ),
                );
              }),
        ),
        if (openDrawer) const TilesDrawer(),
      ],
    );
  }
}
