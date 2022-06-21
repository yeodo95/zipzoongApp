import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zipzoongapp/size_config.dart';

import '../../../dashboard/components/room_card.dart';

class BodyDashboard extends StatelessWidget {
  const BodyDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(14),
                  vertical: getProportionateScreenHeight(27)),
              child: Image.asset("assets/logo appbar.png")),
          RoomCard(status: "WaitingPhoto"),
          RoomCard(status: "BiddingInProgress"),
          RoomCard(status: "EndOfBidding"),
        ],
      ),
    );
  }
}
