import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:zipzoongapp/size_config.dart';

import 'broker_info.dart';

class BodyMain extends StatefulWidget {
  const BodyMain({Key? key}) : super(key: key);

  @override
  State<BodyMain> createState() => _BodyMainState();
}

class _BodyMainState extends State<BodyMain> {
  int LookUp = 0;
  int Bid = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  '지금까지 중개사 $LookUp명이 조회,\n$Bid명이 입찰했습니다.',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(25)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/Circle Timer Icon.svg",
                    ),
                    SizedBox(width: getProportionateScreenHeight(14)),
                    Text(
                      '제안 받는 중 00 : 00 : 00 남음',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  BrokerInfo(name: "홍길동"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
