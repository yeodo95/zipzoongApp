import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:zipzoongapp/conponents/bottom_nav_bar.dart';
import 'package:zipzoongapp/conponents/custom_drawer.dart';
import 'package:zipzoongapp/conponents/sliding_panel/custom_bottom_sheet.dart';
import 'package:zipzoongapp/size_config.dart';

import 'components/body.dart';

class BidInfomation extends StatefulWidget {
  BidInfomation({Key? key}) : super(key: key);

  @override
  BidInfomationState createState() => BidInfomationState();
}

class BidInfomationState extends State<BidInfomation> {
  @override
  final PanelController panelController = PanelController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      // bottomSheet: CustomBottomSheet(
      //   panelHieght: getProportionateScreenHeight(449),
      //   panelController: PanelController(),
      // ),
      bottomNavigationBar: BottomNavBar(),
      endDrawer: CustomDrawer(),
    );
  }
}
