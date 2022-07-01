import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Get.toNamed("/initial");
        },
        child: Container(
          child: Center(child: Image.asset("assets/logo.png")),
        ),
      ),
    );
  }
}
