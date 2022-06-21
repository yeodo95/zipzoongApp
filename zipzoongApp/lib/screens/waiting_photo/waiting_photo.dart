import 'package:flutter/material.dart';
import 'package:zipzoongapp/conponents/bottom_nav_bar.dart';
import 'package:zipzoongapp/conponents/custom_drawer.dart';

import 'components/body.dart';

class WaitingPhoto extends StatelessWidget {
  const WaitingPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavBar(),
      endDrawer: CustomDrawer(),
    );
  }
}
