// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class BottomButton extends StatelessWidget {
//   const BottomButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//               primary: Colors.transparent,
//               shadowColor: Colors.transparent,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10), //모서리
//                 side: BorderSide(color: Colors.black), //테두리
//               ),
//             ),
//             onPressed: () {
//               if (currStep.index != 0) {
//                 currStep = InputType.values[(currStep.index - 1)];
//                 panelSize();
//               } else {
//                 Get.back();
//               }
//             },
//             child: Text(
//               "이전",
//               style: TextStyle(color: Colors.black, fontSize: 18),
//             ),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//               primary: Colors.black,
//               shadowColor: Colors.transparent,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10), //모서리
//                 side: BorderSide(color: Colors.black), //테두리
//               ),
//             ),
//             onPressed: () {
//               print(currStep);
//               if (currStep.index != InputType.end.index - 1) {
//                 currStep = InputType.values[(currStep.index + 1)];
//                 panelSize();
//               } else {
//                 Get.toNamed("/home");
//               }
//             },
//             child: Text(
//               "다음",
//               style: TextStyle(color: Colors.white, fontSize: 18),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }