import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomBottomButton extends StatelessWidget {
  const CustomBottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              primary: Color(0xffF2F2F7),
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14), //모서리
                side: BorderSide(color: Color(0xffF2F2F7)), //테두리
              ),
            ),
            onPressed: () {
              // if (currStep.index != 0) {
              //   currStep = InputType.values[(currStep.index - 1)];
              //   panelSize();
              // } else {
              //   Get.back();
              // }
            },
            child: Row(
              children: [
                Image.asset('assets/icons/Left Vector Icon.png'),
                Text(
                  "  이전",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 42,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              primary: Color(0xff2C2C2E),
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14), //모서리
                side: BorderSide(color: Color(0xff2C2C2E)), //테두리
              ),
            ),
            onPressed: () {
              // print(currStep);
              // if (currStep.index != InputType.end.index - 1) {
              //   currStep = InputType.values[(currStep.index + 1)];
              //   panelSize();
              // } else {
              //   Get.toNamed("/home");
              // }
            },
            child: Row(
              children: [
                Text(
                  "다음  ",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Image.asset('assets/icons/Right Vector Icon.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
