import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/food_details.dart';

class HomePageTabBar {
  static TabController? tabController;

  static List<Widget> generateTabsDay(ListFoodDetails foodDetails) {
    List<DateTime?> days = [];

    for (var element in foodDetails.foods!) {
      days.add(element!.foodDetailsClass!.date);
    }

    ValueNotifier<int> selectedIndex = ValueNotifier(tabController!.length);

    tabController!.addListener(() {
      selectedIndex.value = tabController!.index;
    });

    List<Widget> tabs = List.generate(
        days.length,
        (index) => Tab(
              child: ValueListenableBuilder(
                valueListenable: selectedIndex,
                builder: (context, value, child) => Column(
                  children: [
                    Text(
                      // '',
                      days[index]!.day.toString(),
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: tabController!.index == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    Text(
                      toBeginningOfSentenceCase(
                          DateFormat('EEEE', Platform.localeName)
                              .format(days[index]!)
                              .substring(0, 3))!,
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: tabController!.index == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ));
    return tabs;
  }
}
