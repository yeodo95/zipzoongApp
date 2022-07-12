import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:zipzoongapp/size_config.dart';

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with TickerProviderStateMixin {
  @override
  double percentage = 0.0;
  double newPercentage = 0.0;

  late AnimationController percentageAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    percentageAnimationController = AnimationController(
        vsync: this, duration: new Duration(milliseconds: 3000))
      ..addListener(() {
        setState(() {
          percentage = lerpDouble(
              percentage, newPercentage, percentageAnimationController.value)!;
        });
      });

    setState(() {
      percentage = newPercentage;
      newPercentage = 1.0;
      percentageAnimationController.forward();
    });

    Timer(const Duration(seconds: 1), () {
      Get.toNamed("/create");
    });
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double logoSize = getProportionateScreenWidth(134);
    return Scaffold(
      body: InkWell(
        onTap: () {
          // Get.toNamed("/initial");
        },
        child: Container(
          margin:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(71)),
          child: Center(
              child: Column(
            children: [
              SizedBox(height: (SizeConfig.screenWidth + logoSize) / 2),
              Image.asset(
                "assets/logo.png",
                height: logoSize,
                width: logoSize,
              ),
              SizedBox(height: (SizeConfig.screenWidth / 2 + logoSize) / 4),
              // LinearProgressIndicator(
              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              //   backgroundColor: Color(0xffC4C4C4),
              //   value: percentage,
              //   semanticsLabel: "dd",
              // ),
              Container(
                child: BarProgress(
                  percentage: percentage * 100,
                  backColor: Colors.white,
                  color: Color(0xff0A7AFF),
                  showPercentage: false,
                  textStyle: TextStyle(color: Colors.white, fontSize: 20),
                  stroke: 5,
                  round: false,
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
