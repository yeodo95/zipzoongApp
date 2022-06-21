import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zipzoongapp/contant.dart';
import 'package:zipzoongapp/size_config.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({Key? key, required this.status}) : super(key: key);

  final String? status;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: getProportionateScreenWidth(24),
        right: getProportionateScreenWidth(24),
        bottom: getProportionateScreenHeight(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: getProportionateScreenHeight(4)),
            margin: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xffEEEEEE)),
              ),
            ),
            child: Text("${ForSaleText['$status']}"),
          ),
          Container(
            height: getProportionateScreenHeight(300),
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: getProportionateScreenHeight(55),
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "주소\n원룸 가격",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        InkWell(
                          onTap: () {
                            print("push");
                            switch (status) {
                              case "WaitingPhoto":
                                Get.toNamed("/home");
                                break;
                              case "BiddingInProgress":
                                Get.toNamed("/bid_info");
                                break;
                              case "EndOfBidding":
                                break;
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(31),
                              vertical: getProportionateScreenHeight(4),
                            ),
                            child: Text(
                              "${ForSaleInput['$status']}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff9F9D9D),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
