import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zipzoongapp/enum.dart';
import 'package:zipzoongapp/screens/create/component/step_01.dart';
import 'package:zipzoongapp/size_config.dart';
import 'component/CreateHeader.dart';
import 'component/step_02.dart';

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

  late ScrollController _scrollController;
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
    InputType currStep = InputType.address;
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
                    CreateHeader(
                        key: UniqueKey(),
                        currStep: currStep.index + 1,
                        maxStep: maxStep,
                        progressBarWidth: progressBarWidth),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    // Container(
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       BarProgress(
                    //         percentage: 100 * currStep / maxStep,
                    //         backColor: Colors.white,
                    //         color: Color(0xff0A7AFF),
                    //         showPercentage: false,
                    //         textStyle:
                    //             TextStyle(color: Colors.white, fontSize: 20),
                    //         stroke: 7,
                    //         round: true,
                    //       ),
                    //       Container(
                    //         margin: EdgeInsets.only(
                    //             top: 5,
                    //             left:
                    //                 progressBarWidth / maxStep * currStep - 7),
                    //         child: Text("$currStep/$maxStep"),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 65,
                    // ),
                    Visibility(
                      visible: currStep == InputType.address ? true : false,
                      child: Step_01(),
                    ),
                    Visibility(
                      visible: currStep == InputType.type ? true : false,
                      child: Step_02(),
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

  void showBottomSheet() async {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          child: Container(
            height: SizeConfig.screenHeight - getProportionateScreenHeight(47),
            color: Color(0xffF2F2F7),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: Container(
                        width: getProportionateScreenWidth(36),
                        height: getProportionateScreenHeight(5),
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(30, 60, 60, 67),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.cancel_outlined),
                    ),
                    // WebView(
                    //   initialUrl: 'https://dev-yakuza.posstree.com/en/',
                    //   javascriptMode: JavascriptMode.unrestricted,
                    // ),
                    Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      height: getProportionateScreenHeight(128),
                    ),
                    // RemediKopo(),
                    Container(
                      width: double.infinity,
                      height: getProportionateScreenHeight(152),
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      color: Color(0xffEEEEEE),
                    ),
                    Text(
                      "  연락받으실 번호",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Text("연락요청"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
