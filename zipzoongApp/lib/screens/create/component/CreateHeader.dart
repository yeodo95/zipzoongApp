import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:zipzoongapp/contant.dart';
import 'package:zipzoongapp/screens/create/component/step_01.dart';
import 'package:zipzoongapp/size_config.dart';

import '../create.dart';

class CreateHeader extends StatefulWidget {
  const CreateHeader({Key? key, required this.currStep, required this.maxStep})
      : super(key: key);

  final int currStep;
  final int maxStep;

  @override
  State<CreateHeader> createState() => _CreateHeaderState();
}

class _CreateHeaderState extends State<CreateHeader>
    with TickerProviderStateMixin {
  double logoSize = getProportionateScreenWidth(134);
  bool visible = false;
  late double topMargin;
  late AnimationController logoAnimationController;
  late ScrollController _scrollController;
  double progressBarWidth =
      (SizeConfig.screenWidth - (getProportionateScreenWidth(41) * 2));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      topMargin = (SizeConfig.screenWidth + logoSize) / 2;
    });

    logoAnimationController = AnimationController(
        vsync: this, duration: new Duration(milliseconds: 5000))
      ..addListener(() {
        setState(() {
          topMargin = lerpDouble(topMargin, getProportionateScreenHeight(47),
              logoAnimationController.value)!;
        });
      });
    _scrollController = ScrollController();

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
    CreateInfoState? parent =
        context.findAncestorStateOfType<CreateInfoState>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(41)),
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
                          percentage:
                              100 * (widget.currStep + 1) / widget.maxStep,
                          backColor: Colors.white,
                          color: Color(0xff0A7AFF),
                          showPercentage: false,
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 20),
                          stroke: 7,
                          round: true,
                        ),
                        // Container(
                        //   margin: EdgeInsets.only(
                        //       top: 5,
                        //       left: progressBarWidth /
                        //               widget.maxStep *
                        //               widget.currStep -
                        //           7),
                        //   child: Text("$widget.currStep/$widget.maxStep"),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 65,
                  ),
                  Visibility(
                    visible: true,
                    // visible: CreateStepType.values[currStep] ==
                    //         CreateStepType.step_01
                    //     ? true
                    //     : false,
                    child: Step_01(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
