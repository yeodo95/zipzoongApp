import 'package:flutter/material.dart';
import 'package:zipzoongapp/conponents/bottom_nav_bar.dart';
import 'package:zipzoongapp/conponents/custom_drawer.dart';
import 'package:zipzoongapp/size_config.dart';

import 'components/body.dart';
import 'components/room_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavBar(),
      endDrawer: CustomDrawer(),
    );
  }
}
