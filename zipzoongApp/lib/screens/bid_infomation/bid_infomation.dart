import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zipzoongapp/conponents/bottom_nav_bar.dart';
import 'package:zipzoongapp/conponents/custom_drawer.dart';

import 'components/body.dart';

class BidInfomation extends StatelessWidget {
  const BidInfomation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavBar(),
      endDrawer: CustomDrawer(),
    );
  }
}
