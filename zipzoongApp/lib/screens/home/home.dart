import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zipzoongapp/conponents/bottom_nav_bar.dart';
import 'package:zipzoongapp/conponents/custom_drawer.dart';
import 'package:zipzoongapp/size_config.dart';

import 'components/body/body_dashboard.dart';
import 'components/body/body_waiting_photo.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String currWidget = "WaitingPhoto";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BodyWaitingPhoto(),
      bottomNavigationBar: BottomNavBar(),
      endDrawer: CustomDrawer(),
    );
  }
}
