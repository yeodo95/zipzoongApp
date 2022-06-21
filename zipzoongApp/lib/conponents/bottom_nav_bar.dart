import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zipzoongapp/conponents/custom_icon_button.dart';
import 'package:zipzoongapp/size_config.dart';

import '../screens/home/home.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeState? parent = context.findAncestorStateOfType<HomeState>();
    return Container(
      color: Colors.white,
      height: 72,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomIcon(
              svgIcon: "assets/icons/Home Icon.svg",
              text: "등록한 집",
              press: () {
                Get.toNamed("/dashboard");
              },
            ),
            CustomIcon(
              svgIcon: "assets/icons/Add Icon.svg",
              text: "추가요청",
              press: () {
                Get.toNamed("/input");
              },
            ),
            CustomIcon(
              svgIcon: "assets/icons/Notification Icon.svg",
              text: "알림",
              press: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }
}
