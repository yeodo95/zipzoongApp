import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:zipzoongapp/conponents/sliding_panel/custom_bottom_sheet.dart';
import 'package:zipzoongapp/screens/bid_infomation/bid_infomation.dart';
import 'package:zipzoongapp/size_config.dart';

class BrokerInfo extends StatefulWidget {
  BrokerInfo({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<BrokerInfo> createState() => _BrokerInfoState();
}

class _BrokerInfoState extends State<BrokerInfo> {
  bool IsRequestComplete = false;
  @override
  Widget build(BuildContext context) {
    BidInfomationState? parent =
        context.findAncestorStateOfType<BidInfomationState>();
    return Stack(
      children: <Widget>[
        Container(
          width: getProportionateScreenWidth(339),
          height: getProportionateScreenHeight(128),
          margin: EdgeInsets.all(getProportionateScreenWidth(18)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(35),
                    ),
                    child: Container(
                      height: getProportionateScreenHeight(521),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            width: getProportionateScreenWidth(48),
                            height: getProportionateScreenHeight(8),
                            margin: EdgeInsets.fromLTRB(0, 8, 0, 4),
                            decoration: BoxDecoration(
                              color: Color(0xffEEEEEE),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: getProportionateScreenWidth(339),
                              height: getProportionateScreenHeight(128),
                              color: Colors.yellow,
                            ),
                          ),
                          Center(
                            child: Container(
                              width: getProportionateScreenWidth(327),
                              height: getProportionateScreenHeight(152),
                              color: Color(0xffEEEEEE),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                IsRequestComplete = !IsRequestComplete;
                                Navigator.pop(context);
                              });
                            },
                            child: Text("연락요청"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
              // parent?.setState(() {
              //   parent.panelController.open();
              //   print("tap");
              // });
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: getProportionateScreenHeight(90),
                            height: getProportionateScreenHeight(90),
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "https://i.imgur.com/BoN9kdC.png"),
                              ),
                            ),
                          ),
                          Text(
                            "${widget.name} 중개사",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      margin: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.name}부동산중개",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "87만원",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "★★★★☆   4.7     >",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: IsRequestComplete,
          child: Container(
            width: getProportionateScreenWidth(339),
            height: getProportionateScreenHeight(128),
            margin: EdgeInsets.all(getProportionateScreenWidth(18)),
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(14)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromARGB(153, 0, 0, 0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: getProportionateScreenHeight(110),
                  height: getProportionateScreenHeight(110),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          new NetworkImage("https://i.imgur.com/BoN9kdC.png"),
                    ),
                  ),
                ),
                Text(
                  "연락요청 완료",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10.5),
                      vertical: getProportionateScreenHeight(9.5),
                    ),
                    child: Text(
                      "다시요청",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff9F9D9D),
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
