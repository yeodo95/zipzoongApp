import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(child: Image.asset("assets/logo.png")),
            Text(
              "내놓으시려는 집 주소를 알려주세요",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffCECECE), width: 1.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                ),
                // onTap: () => {Get.toNamed("/input")},
                onTap: () async {
                  // await Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       fullscreenDialog: false,
                  //       builder: (_) => KpostalView(
                  //         callback: (Kpostal result) {
                  //           print("test ${result.address}");
                  //         },
                  //       ),
                  //     ));
                  // 입력했을 때 분기 처리
                  Get.toNamed("/input");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
