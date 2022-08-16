import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zipzoongapp/enum.dart';
import 'package:zipzoongapp/screens/create/create.dart';
import 'package:zipzoongapp/size_config.dart';

class Step_01 extends StatelessWidget {
  const Step_01({Key? key}) : super(key: key);

  // String postCode = '-';
  // String roadAddress = '-';
  // String jibunAddress = '-';
  // String latitude = '-';
  // String longitude = '-';
  // String kakaoLatitude = '-';
  // String kakaoLongitude = '-';
  @override
  Widget build(BuildContext context) {
    CreateInfoState? parent =
        context.findAncestorStateOfType<CreateInfoState>();
    return Column(
      children: [
        Text(
          "당신의 집은 어디에 있나요?",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: () async {
            parent!.NextStep();
            return;
            // await Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => KpostalView(
            //       useLocalServer: true,
            //       localPort: 1024,
            //       // kakaoKey: '{Add your KAKAO DEVELOPERS JS KEY}',
            //       callback: (Kpostal result) {
            //         // setState(() {
            //         //   this.postCode = result.postCode;
            //         //   this.roadAddress = result.address;
            //         //   this.jibunAddress = result.jibunAddress;
            //         //   this.latitude = result.latitude.toString();
            //         //   this.longitude = result.longitude.toString();
            //         //   this.kakaoLatitude = result.kakaoLatitude.toString();
            //         //   this.kakaoLongitude = result.kakaoLongitude.toString();
            //         // });
            //       },
            //     ),
            //   ),
            // );
            // print(roadAddress);
          },
          child: Container(
            width: 300,
            height: 44,
            padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
            child: Row(children: [
              Icon(Icons.search),
              Text(
                "주소 검색하기",
                style: TextStyle(color: Colors.black),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

// class Step_01 extends StatefulWidget {
//   const Step_01({Key? key}) : super(key: key);

//   @override
//   State<Step_01> createState() => _Step_01State();
// }

// class _Step_01State extends State<Step_01> {
//   @override
//   String postCode = '-';
//   String roadAddress = '-';
//   String jibunAddress = '-';
//   String latitude = '-';
//   String longitude = '-';
//   String kakaoLatitude = '-';
//   String kakaoLongitude = '-';

//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           "당신의 집은 어디에 있나요?",
//           style: Theme.of(context).textTheme.bodyLarge,
//         ),
//         SizedBox(
//           height: 8,
//         ),
//         InkWell(
//           onTap: () async {
//             await Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => KpostalView(
//                   useLocalServer: true,
//                   localPort: 1024,
//                   // kakaoKey: '{Add your KAKAO DEVELOPERS JS KEY}',
//                   callback: (Kpostal result) {
//                     setState(() {
//                       this.postCode = result.postCode;
//                       this.roadAddress = result.address;
//                       this.jibunAddress = result.jibunAddress;
//                       this.latitude = result.latitude.toString();
//                       this.longitude = result.longitude.toString();
//                       this.kakaoLatitude = result.kakaoLatitude.toString();
//                       this.kakaoLongitude = result.kakaoLongitude.toString();
//                     });
//                   },
//                 ),
//               ),
//             );
//             print(roadAddress);
//           },
//           child: Container(
//             width: 300,
//             height: 44,
//             padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
//             decoration: BoxDecoration(
//                 color: Colors.white, borderRadius: BorderRadius.circular(100)),
//             child: Row(children: [
//               Icon(Icons.search),
//               Text(
//                 "주소 검색하기",
//                 style: TextStyle(color: Colors.black),
//               ),
//             ]),
//           ),
//         ),
//       ],
//     );
//   }
// }
