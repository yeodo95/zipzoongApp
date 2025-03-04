import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kpostal/kpostal.dart';
import 'package:zipzoongapp/enum.dart';
import 'package:zipzoongapp/screens/create/create.dart';
import 'package:zipzoongapp/size_config.dart';

import 'custom_bottom_button.dart';

class Step_01 extends StatefulWidget {
  Step_01({Key? key}) : super(key: key);

  @override
  State<Step_01> createState() => _Step_01State();
}

class _Step_01State extends State<Step_01> {
  String postCode = '-';
  String roadAddress = '-';
  String jibunAddress = '-';
  String latitude = '-';
  String longitude = '-';
  String kakaoLatitude = '-';
  String kakaoLongitude = '-';

  @override
  Widget build(BuildContext context) {
    CreateInfoState? parent =
        context.findAncestorStateOfType<CreateInfoState>();
    return Column(
      children: [
        Column(
          children: [
            Text(
              "당신의 집은 어디에 있나요?",
              style: Theme.of(context).primaryTextTheme.bodyLarge,
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => KpostalView(
                      useLocalServer: true,
                      localPort: 1024,
                      // kakaoKey: '{Add your KAKAO DEVELOPERS JS KEY}',
                      callback: (Kpostal result) {
                        setState(() {
                          postCode = result.postCode;
                          roadAddress = result.address;
                          jibunAddress = result.jibunAddress;
                          latitude = result.latitude.toString();
                          longitude = result.longitude.toString();
                          kakaoLatitude = result.kakaoLatitude.toString();
                          kakaoLongitude = result.kakaoLongitude.toString();
                        });
                      },
                    ),
                  ),
                );
              },
              child: Container(
                width: 300,
                height: 44,
                padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: Row(children: [
                  Image.asset("assets/icons/Search Icon.png"),
                  SizedBox(width: 5),
                  // Icon(Icons.search),
                  Text(
                    "주소 검색하기",
                    style: TextStyle(color: Colors.black),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Visibility(
              visible: roadAddress != '-' ? true : false,
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "주소",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: roadAddress,
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 12),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 0.5, color: Color(0xffFFFFFF)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            borderSide: BorderSide(
                                width: 0.5, color: Color(0xffFFFFFF)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15)),
                      // keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "상세주소",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 12),
                      decoration: InputDecoration(
                          hintText: '상세주소를 입력해주세요.',
                          hintStyle: TextStyle(
                              color: Color(0xff818181),
                              fontWeight: FontWeight.w700,
                              fontSize: 12),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            borderSide: BorderSide(
                                width: 0.5, color: Color(0xffFFFFFF)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15)),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        CustomBottomButton(),
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
