import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zipzoongapp/size_config.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: getProportionateScreenWidth(258),
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
            margin: EdgeInsets.all(0),
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    title: Text("알림"),
                    leading: Icon(Icons.keyboard_arrow_right),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: Text("안 읽은 알림"),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text("지우기"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: Text("List tile1"),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            title: Text("List tile2"),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            title: Text("List tile3"),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );
  }
}
