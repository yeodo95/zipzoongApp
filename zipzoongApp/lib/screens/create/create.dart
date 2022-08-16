import 'package:flutter/material.dart';
import 'package:zipzoongapp/enum.dart';
import 'component/body.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  CreateInfoState createState() => CreateInfoState();
}

class CreateInfoState extends State<Create> with TickerProviderStateMixin {
  int currStep = CreateStepType.step_01.index;
  int maxStep = CreateStepType.end.index + 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }

  void NextStep() {
    setState(() {
      if (currStep != CreateStepType.end.index) currStep++;
    });
    print("currStep: $currStep, maxStep: $maxStep");
  }

  // void showBottomSheet() async {
  //   showModalBottomSheet(
  //     backgroundColor: Colors.transparent,
  //     context: context,
  //     isScrollControlled: true,
  //     builder: (BuildContext context) {
  //       return ClipRRect(
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
  //         child: Container(
  //           height: SizeConfig.screenHeight - getProportionateScreenHeight(47),
  //           color: Color(0xffF2F2F7),
  //           child: SingleChildScrollView(
  //             controller: _scrollController,
  //             child: Container(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.end,
  //                 children: [
  //                   Center(
  //                     child: Container(
  //                       width: getProportionateScreenWidth(36),
  //                       height: getProportionateScreenHeight(5),
  //                       margin: EdgeInsets.only(top: 5),
  //                       decoration: BoxDecoration(
  //                         color: Color.fromARGB(30, 60, 60, 67),
  //                         borderRadius: BorderRadius.all(
  //                           Radius.circular(10),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   IconButton(
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                     },
  //                     icon: Icon(Icons.cancel_outlined),
  //                   ),
  //                   // WebView(
  //                   //   initialUrl: 'https://dev-yakuza.posstree.com/en/',
  //                   //   javascriptMode: JavascriptMode.unrestricted,
  //                   // ),
  //                   Container(
  //                     color: Colors.transparent,
  //                     width: double.infinity,
  //                     height: getProportionateScreenHeight(128),
  //                   ),
  //                   // RemediKopo(),
  //                   Container(
  //                     width: double.infinity,
  //                     height: getProportionateScreenHeight(152),
  //                     margin: EdgeInsets.symmetric(horizontal: 6),
  //                     color: Color(0xffEEEEEE),
  //                   ),
  //                   Text(
  //                     "  연락받으실 번호",
  //                     style: TextStyle(
  //                         color: Colors.black87,
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.w600),
  //                   ),
  //                   ElevatedButton(
  //                     onPressed: () {
  //                       setState(() {
  //                         Navigator.pop(context);
  //                       });
  //                     },
  //                     child: Text("연락요청"),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
