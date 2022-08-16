import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:zipzoongapp/conponents/sliding_panel/custom_bottom_sheet.dart';

class Step_02 extends StatefulWidget {
  const Step_02({Key? key}) : super(key: key);

  @override
  State<Step_02> createState() => _Step_02State();
}

class _Step_02State extends State<Step_02> {
  List<bool> _selections = List.generate(3, (index) => false);
  String text = "어떻게 계약하길 원하시나요?";

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
        _bottomSheet(),
      ],
    );
  }

  _bottomSheet() {
    return SlidingUpPanel(
      // panelSnapping: false,
      minHeight: 200,
      maxHeight: 300,
      // isDraggable: false,
      panel: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Center(
            child: ToggleButtons(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text("전세"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text("월세"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text("매매"),
                ),
              ],
              isSelected: _selections,
              onPressed: (int index) {
                print(index);
                setState(() {
                  for (int i = 0; i < 3; i++) {
                    if (index == i)
                      _selections[i] = true;
                    else
                      _selections[i] = false;
                  }
                  text = "계약 방식을 알려주세요";
                });
              },
            ),
          ),
        ],
      ),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(35),
      ),
    );
  }
}
