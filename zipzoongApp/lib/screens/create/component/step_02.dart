import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:zipzoongapp/conponents/sliding_panel/custom_bottom_sheet.dart';
import 'package:zipzoongapp/contant.dart';
import 'package:zipzoongapp/size_config.dart';
import 'package:zipzoongapp/theme.dart';

import 'custom_bottom_button.dart';

class Step_02 extends StatefulWidget {
  const Step_02({Key? key}) : super(key: key);

  @override
  State<Step_02> createState() => _Step_02State();
}

class _Step_02State extends State<Step_02> {
  String text = "어떻게 계약하길 원하시나요?";
  bool IsSelected = false;
  int selectIndex = 0;

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
      maxHeight: 385,
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
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
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
                    IsSelected = true;
                    selectIndex = index;
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
          Visibility(
              visible: IsSelected,
              child: Stack(
                children: [
                  Visibility(
                    visible:
                        rentType[selectIndex]['state'] == '월세' ? true : false,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(20),
                          horizontal: getProportionateScreenWidth(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "보증금",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const TextField(
                            decoration: InputDecoration(
                                hintText: '원 단위로 입력해주세요',
                                hintStyle: TextStyle(fontSize: 15),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: Color.fromARGB(255, 78, 78, 78)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide: BorderSide(
                                      width: 0.5, color: Color(0xffC0C0C0)),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15)),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            rentType[selectIndex]['state'],
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const TextField(
                            decoration: InputDecoration(
                                hintText: '원 단위로 입력해주세요',
                                hintStyle: TextStyle(fontSize: 15),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: Color.fromARGB(255, 78, 78, 78)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide: BorderSide(
                                      width: 0.5, color: Color(0xffC0C0C0)),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15)),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible:
                        rentType[selectIndex]['state'] == '전세' ? true : false,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(20),
                          horizontal: getProportionateScreenWidth(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "전세금",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const TextField(
                            decoration: InputDecoration(
                                hintText: '원 단위로 입력해주세요',
                                hintStyle: TextStyle(fontSize: 15),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: Color.fromARGB(255, 78, 78, 78)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide: BorderSide(
                                      width: 0.5, color: Color(0xffC0C0C0)),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15)),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible:
                        rentType[selectIndex]['state'] == '매매' ? true : false,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(20),
                          horizontal: getProportionateScreenWidth(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "매매가",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const TextField(
                            decoration: InputDecoration(
                                hintText: '원 단위로 입력해주세요',
                                hintStyle: TextStyle(fontSize: 15),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: Color.fromARGB(255, 78, 78, 78)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide: BorderSide(
                                      width: 0.5, color: Color(0xffC0C0C0)),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15)),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Spacer(),
          CustomBottomButton(),
        ],
      ),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(35),
      ),
    );
  }
}
