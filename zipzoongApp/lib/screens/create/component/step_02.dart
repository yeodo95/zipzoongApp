import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:zipzoongapp/conponents/sliding_panel/custom_bottom_sheet.dart';
import 'package:zipzoongapp/contant.dart';
import 'package:zipzoongapp/size_config.dart';

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
      children: <Widget>[
        Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(250),
            ),
            Center(
              child: Text(
                text,
                style: Theme.of(context).primaryTextTheme.bodyLarge,
              ),
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
      minHeight: 0,
      maxHeight: 300,
      defaultPanelState: PanelState.OPEN,
      isDraggable: false,
      panel: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Center(
            child: Wrap(
              spacing: 20,
              children: List.generate(rentType.length, (index) {
                return ChoiceChip(
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 28),
                  backgroundColor: Color.fromARGB(38, 0, 122, 255),
                  selectedColor: Color(0xff007AFF),
                  selected: rentType[index]['isCheck'] == true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  label: Text(
                    rentType[index]['state'],
                    style: rentType[index]['isCheck'] == true
                        ? Theme.of(context).textTheme.overline
                        : Theme.of(context).textTheme.button,
                  ),
                  onSelected: (value) {
                    print(value);
                    setState(() {
                      for (int i = 0; i < 3; i++) {
                        if (index == i)
                          rentType[i]['isCheck'] = true;
                        else
                          rentType[i]['isCheck'] = false;
                      }
                      text = "계약 방식을 알려주세요";
                    });
                  },
                );
              }),
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
