import 'package:flutter/material.dart';

class DrawerDivider extends StatelessWidget {
  const DrawerDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 100,
      child: const Divider(
        color: Color.fromRGBO(255, 255, 255, 0.6),
        height: 10,
        thickness: 2,
      ),
    );
  }
}
