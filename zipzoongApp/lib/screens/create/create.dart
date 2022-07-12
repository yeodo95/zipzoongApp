import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:zipzoongapp/size_config.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> with TickerProviderStateMixin {
  double logoSize = getProportionateScreenWidth(134);
  bool visible = false;
  late double topMargin;

  late AnimationController logoAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    logoAnimationController = AnimationController(
        vsync: this, duration: new Duration(milliseconds: 5000))
      ..addListener(() {
        setState(() {
          topMargin = lerpDouble(topMargin, getProportionateScreenHeight(47),
              logoAnimationController.value)!;
        });
      });

    setState(() {
      topMargin = (SizeConfig.screenWidth + logoSize) / 2;
    });
    Timer(Duration(milliseconds: 500), () {
      logoAnimationController.forward();
    });

    Timer(Duration(milliseconds: 1500), () {
      setState(() {
        visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int currStep = 1;
    int maxStep = 5;
    double progressBarWidth =
        (SizeConfig.screenWidth - (getProportionateScreenWidth(41) * 2));

    return Scaffold(
      body: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(41)),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: topMargin),
              Image.asset(
                "assets/logo.png",
                height: logoSize,
                width: logoSize,
              ),
              AnimatedOpacity(
                opacity: visible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 1000),
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(5)),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BarProgress(
                            percentage: 100 * currStep / maxStep,
                            backColor: Colors.white,
                            color: Color(0xff0A7AFF),
                            showPercentage: false,
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 20),
                            stroke: 7,
                            round: true,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 5,
                                left:
                                    progressBarWidth / maxStep * currStep - 7),
                            child: Text("$currStep/$maxStep"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 65,
                    ),
                    Text(
                      "당신의 집은 어디에 있나요?",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        print("tap");
                      },
                      child: Container(
                        width: 300,
                        height: 44,
                        padding: EdgeInsets.only(
                            left: getProportionateScreenWidth(10)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: Row(children: [
                          Icon(Icons.search),
                          Text(
                            "주소 검색하기",
                            style: TextStyle(color: Colors.black),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
