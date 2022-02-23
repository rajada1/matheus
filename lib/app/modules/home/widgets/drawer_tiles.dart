import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_list_tile_drawer.dart';
import 'tile_divider.dart';

class TilesDrawer extends StatelessWidget {
  const TilesDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              CustomListTileDrawer(
                'Perfil',
                FontAwesomeIcons.userCircle,
              ),
              DrawerDivider(),
              CustomListTileDrawer(
                'Dependentes',
                Icons.group_add_outlined,
              ),
              DrawerDivider(),
              CustomListTileDrawer(
                'Histórico',
                FontAwesomeIcons.history,
              ),
              DrawerDivider(),
              CustomListTileDrawer(
                'Config',
                FlutterRemix.settings_line,
              ),
              SizedBox(
                height: 60,
              ),
              CustomListTileDrawer('Sair', Icons.logout),
            ],
          ),
        ),
      ),
    );
  }
}
