import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/size_config.dart';

class DrawerDiwget extends StatelessWidget {
  const DrawerDiwget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
