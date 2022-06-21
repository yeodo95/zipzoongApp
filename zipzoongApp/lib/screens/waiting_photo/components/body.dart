import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zipzoongapp/conponents/custom_input_button.dart';
import 'package:zipzoongapp/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          color: Color(0xff003BF7),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  '이제 사진만 등록하면\n중개수수료 제안이 시작됩니다.',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(13),
                    vertical: getProportionateScreenHeight(14)),
                child: Text(
                  '사진을 등록해주세요.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: getProportionateScreenHeight(279),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: getProportionateScreenWidth(327),
                      height: getProportionateScreenHeight(200),
                      color: Colors.grey[300],
                    ),
                    CustomInputButton(
                      width: getProportionateScreenWidth(327),
                      height: getProportionateScreenHeight(34),
                      text: "집 정보 수정",
                      press: () {
                        Get.toNamed("/input");
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(35)),
              Container(
                height: getProportionateScreenHeight(255),
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '가장빠른 집내놓기 "집중"',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff525252)),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        "assets/icons/Circle Star Icon.svg",
                      ),
                      title: Text(
                        "사진 등록 대기",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        "assets/icons/Circle Timer Icon.svg",
                      ),
                      title: Text(
                        "승인 요청",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        "assets/icons/Circle Timer Icon.svg",
                      ),
                      title: Text(
                        "입찰 개시",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
