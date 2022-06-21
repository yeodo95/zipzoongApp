import 'package:flutter/material.dart';
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
    return Stack(
      children: <Widget>[
        Container(
          width: getProportionateScreenWidth(339),
          height: getProportionateScreenHeight(128),
          margin: EdgeInsets.all(getProportionateScreenWidth(18)),
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(14)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                IsRequestComplete = !IsRequestComplete;
              });
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.amber,
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
                  Container(
                    color: Colors.blueAccent,
                    margin: EdgeInsets.all(5),
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
