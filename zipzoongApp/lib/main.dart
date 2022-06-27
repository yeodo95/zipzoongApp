import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
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
}
