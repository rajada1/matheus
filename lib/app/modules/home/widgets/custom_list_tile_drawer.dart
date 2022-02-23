import 'package:flutter/material.dart';

class CustomListTileDrawer extends StatelessWidget {
  final String title;
  final IconData icon;
  const CustomListTileDrawer(
    this.title,
    this.icon, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      leading: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
