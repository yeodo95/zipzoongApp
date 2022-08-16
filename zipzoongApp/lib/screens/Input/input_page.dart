import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:zipzoongapp/enum.dart';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  InputType currStep = InputType.address;
  double panelHieght = 500.0;
  String _title = "주소를 알려주세요";
  double _progressGauge = 1.0 / (InputType.end.index + 1);
  List<bool> _selections = List.generate(3, (index) => false);
  List<bool> _roomCount = List.generate(3, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          color: Color(0xff003BF7),
          child: Stack(
            children: <Widget>[
              _progressBar(),
              _bottomSheet(),
            ],
          )),
    );
  }

  //// widget
  ///
  _progressBar() {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
            child: Image.asset("assets/Rectangle.png")),
        Text(
          _title,
          style: new TextStyle(
            color: Color(0xffFFFFFF),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child: LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            backgroundColor: Color(0xffC4C4C4),
            value: _progressGauge,
            semanticsLabel: "dd",
          ),
        ),
      ],
    );
  }

  _bottomSheet() {
    return SlidingUpPanel(
      // panelSnapping: false,
      minHeight: panelHieght,
      maxHeight: panelHieght,
      // isDraggable: false,
      panel: Column(
        children: <Widget>[
          SizedBox(height: 30),
          _inputForm(),
          _bottomButton(),
        ],
      ),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(35),
      ),
    );
  }

  _inputForm() {
    return Expanded(
        child: Stack(
      children: <Widget>[
        Visibility(
          visible: currStep == InputType.address ? true : false,
          child: _addressForm(),
        ),
        Visibility(
          visible: currStep == InputType.type ? true : false,
          child: _typeForm(),
        ),
        Visibility(
          visible: currStep == InputType.rent ? true : false,
          child: _rentForm(),
        ),
        Visibility(
          visible: currStep == InputType.structure ? true : false,
          child: _structureForm(),
        ),
      ],
    ));
  }

  Widget _addressForm() {
    return Container(
      child: Text("상세주소 입력"),
    );
  }

  _typeForm() {
    return Center(
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
          });
        },
      ),
    );
  }

  _rentForm() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("보증금"),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffCECECE), width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
            ),
          ),
          Text("월세"),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffCECECE), width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
            ),
          ),
          Text("관리비"),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffCECECE), width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _structureForm() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ToggleButtons(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text("원룸"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text("투룸"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text("오피스텔"),
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
              });
            },
          )
        ],
      ),
    );
  }

  _bottomButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), //모서리
                side: BorderSide(color: Colors.black), //테두리
              ),
            ),
            onPressed: () {
              if (currStep.index != 0) {
                currStep = InputType.values[(currStep.index - 1)];
                panelSize();
              } else {
                Get.back();
              }
            },
            child: Text(
              "이전",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              primary: Colors.black,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), //모서리
                side: BorderSide(color: Colors.black), //테두리
              ),
            ),
            onPressed: () {
              print(currStep);
              if (currStep.index != InputType.end.index - 1) {
                currStep = InputType.values[(currStep.index + 1)];
                panelSize();
              } else {
                Get.toNamed("/home");
              }
            },
            child: Text(
              "다음",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  panelSize() {
    setState(() {
      switch (currStep) {
        case InputType.address:
          _title = "주소를 알려주세요";
          panelHieght = 500.0;
          break;
        case InputType.type:
          _title = "계약방식을 알려주세요";
          panelHieght = 360.0;
          break;
        case InputType.rent:
          _title = "계약금액을 알려주세요";
          panelHieght = 360.0;
          break;
        case InputType.structure:
          _title = "집 구조를 알려주세요";
          panelHieght = 480.0;
          break;
        case InputType.picture:
          _title = "사진 입력";
          panelHieght = 480.0;
          break;
        case InputType.end:
          // TODO: Handle this case.
          break;
      }
      _progressGauge = 1.0 / (InputType.end.index + 1) * (currStep.index + 1);
      print(_progressGauge);
    });
  }
}
