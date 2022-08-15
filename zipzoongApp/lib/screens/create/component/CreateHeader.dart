import 'package:flutter/material.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:zipzoongapp/size_config.dart';

class CreateHeader extends StatelessWidget {
  const CreateHeader(
      {Key? key,
      required this.currStep,
      required this.maxStep,
      required this.progressBarWidth})
      : super(key: key);

  final int currStep;
  final int maxStep;
  final double progressBarWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                textStyle: TextStyle(color: Colors.white, fontSize: 20),
                stroke: 7,
                round: true,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 5, left: progressBarWidth / maxStep * currStep - 7),
                child: Text("$currStep/$maxStep"),
              ),
            ],
          ),
        ),
        SizedBox(height: 65),
      ],
    );
  }
}
