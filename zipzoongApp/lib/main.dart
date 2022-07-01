import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io'; //Platform 사용을 위한 패키지
import 'package:flutter/services.dart'; //PlatformException 사용을 위한 패키지
import 'package:device_info_plus/device_info_plus.dart'; // 디바이스 정보 사용 패키지

import 'package:zipzoongapp/screens/bid_infomation/bid_infomation.dart';
import 'package:zipzoongapp/screens/dashboard/dashboard.dart';
import 'package:zipzoongapp/theme.dart';
import 'package:zipzoongapp/screens/initial/initial.dart';
import 'package:zipzoongapp/screens/home/home.dart';
import 'package:zipzoongapp/screens/Input/input_page.dart';
import 'package:zipzoongapp/screens/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  @override
  void initState() {
    super.initState();
    // print("print mobileId: $getMobileId()");
    getMobileId();
  }

  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zipzoong Demo',
      theme: theme(),
      initialRoute: "/",
      // routes: {
      //   "/": (context)=>Home(),
      //   "/first":(context)=>FirstNamedPage(),
      //   "/second":(context)=>SecondNamedPage(),
      // },
      getPages: [
        GetPage(name: "/", page: () => Home(), transition: Transition.fadeIn),
        GetPage(
            name: "/loading",
            page: () => Loading(),
            transition: Transition.fadeIn),
        GetPage(
            name: "/initial",
            page: () => Initial(),
            transition: Transition.fadeIn),
        GetPage(
            name: "/input", page: () => Input(), transition: Transition.fadeIn),
        GetPage(
            name: "/dashboard",
            page: () => Dashboard(),
            transition: Transition.fadeIn),
        GetPage(
            name: "/bid_info",
            page: () => BidInfomation(),
            transition: Transition.fadeIn),
        // GetPage(name:"/second", page: ()=>SecondNamedPage(), transition: Transition.fadeIn),
      ],
    );
  }

  Future<String?> getMobileId() async {
    String? id = '';
    try {
      // 플랫폼 확인
      if (Platform.isAndroid) {
        // 안드로이드의 경우 androidInfo를 이용
        // 이때 await으로 데이터 받을때까지 대기를 해야함
        final AndroidDeviceInfo androidData =
            await deviceInfoPlugin.androidInfo;
        // 전달 받은 변수의 멤버 변수인 androidId가 고유 id이다.
        id = androidData.androidId;
      } else if (Platform.isIOS) {
        // iOS의 경우 iosInfo를 이용
        // 이때 await으로 데이터 받을때까지 대기를 해야함
        final IosDeviceInfo iosData = await deviceInfoPlugin.iosInfo;
        // 전달 받은 변수의 멤버 변수인 identifierForVendor가 고유 id이다.
        id = iosData.identifierForVendor;
      }
    } on PlatformException {
      // 어떠한 원인으로 실패할 경우
      id = '';
    }
    // id 한번 출력해보고
    print('id: $id');
    return id;
  }
}
