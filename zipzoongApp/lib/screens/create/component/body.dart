import 'package:flutter/material.dart';
import 'package:zipzoongapp/enum.dart';
import 'package:zipzoongapp/screens/create/component/CreateHeader.dart';

import '../create.dart';
import 'step_02.dart';
import 'step_03.dart';
import 'step_04.dart';
import 'step_05.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateInfoState? parent =
        context.findAncestorStateOfType<CreateInfoState>();
    parent!;

    return Container(
      child: Stack(
        children: <Widget>[
          CreateHeader(currStep: parent.currStep, maxStep: parent.maxStep),
          Visibility(
            visible:
                CreateStepType.values[parent.currStep] == CreateStepType.step_02
                    ? true
                    : false,
            child: Step_02(),
          ),
          Visibility(
            visible:
                CreateStepType.values[parent.currStep] == CreateStepType.step_03
                    ? true
                    : false,
            child: Step_03(),
          ),
          Visibility(
            visible:
                CreateStepType.values[parent.currStep] == CreateStepType.step_04
                    ? true
                    : false,
            child: Step_04(),
          ),
          Visibility(
            visible:
                CreateStepType.values[parent.currStep] == CreateStepType.end
                    ? true
                    : false,
            child: Step_05(),
          ),
        ],
      ),
    );
  }
}
