import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:zipzoongapp/size_config.dart';

class Step_05 extends StatefulWidget {
  const Step_05({Key? key}) : super(key: key);

  @override
  State<Step_05> createState() => _Step_05State();
}

class _Step_05State extends State<Step_05> {
  String text = "등록완료";
  String text2 = "지금부터 중개사 입찰이 시작됩니다.";
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
            Center(
              child: Text(
                text2,
                style: Theme.of(context).primaryTextTheme.bodyLarge,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                primary: Color(0xff2C2C2E),
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14), //모서리
                  side: BorderSide(color: Color(0xff2C2C2E)), //테두리
                ),
              ),
              onPressed: () {
                setState(() {});
                Get.toNamed("/home");
              },
              child: Text(
                "홈으로",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ],
    );
  }
}
