import 'package:flutter/material.dart';
import 'package:zipzoongapp/size_config.dart';
import 'dart:convert';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF007AFF);
const kTextColor = Color(0xFFFFFFFF);

const kDisplayTextColor = Color(0xFFFFFFFF);
const kBodyTextColor = Color(0xFFFFFFFF);
const kBottomSheetTextColor = Color(0xff000000);
const kButtonColor = Color(0xFF007AFF);
const kInputBoxTextColor = Colors.black;
const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

const String ForSaleStatusText =
    '{"WaitingPhoto":"사진 등록을 기다리고 있어요", "BiddingInProgress":"입찰이 진행되고 있어요","EndOfBidding":"입찰이 완료되었어요"}';

const String ForSaleStatusInput =
    '{"WaitingPhoto":"사진 등록", "BiddingInProgress":"상세 조회","EndOfBidding":"집 정보 수정"}';

const String ForCreateStepText =
    '{"InputAddress":"당신의 집은 어디에 있나요?", "InputType":"어떻게 계약하길 원하시나요?","InputTypeDetail":"계약 방식을 알려주세요", "InputStructure":"당신의 집을 조금 더 알려주세요","UploadPhoto":"마지막이에요!사진을 올려주세요","EndOfInput":"등록 완료 지금부터 중개사 입찰이 시작됩니다" }';

Map<String, dynamic> ForSaleText = jsonDecode(ForSaleStatusText);
Map<String, dynamic> ForSaleInput = jsonDecode(ForSaleStatusInput);
Map<String, dynamic> ForCreateText = jsonDecode(ForCreateStepText);

List<Map<String, dynamic>> rentType = [
  {'state': '월세', 'isCheck': 'false'},
  {'state': '전세', 'isCheck': 'false'},
  {'state': '매매', 'isCheck': 'false'},
];

List<Map<String, dynamic>> houseType = [
  {'state': '주택', 'isCheck': 'false'},
  {'state': '빌라', 'isCheck': 'false'},
  {'state': '아파트', 'isCheck': 'false'},
  {'state': '오피스텔', 'isCheck': 'false'},
];

List<Map<String, dynamic>> floorType = [
  {'state': '반지하', 'isCheck': 'false'},
  {'state': '1층', 'isCheck': 'false'},
  {'state': '2-5층', 'isCheck': 'false'},
  {'state': '6층 이상', 'isCheck': 'false'},
  {'state': '옥탑', 'isCheck': 'false'},
];

List<Map<String, dynamic>> numberOfRooms = [
  {'state': '원룸', 'isCheck': 'false'},
  {'state': '1.5룸', 'isCheck': 'false'},
  {'state': '투룸', 'isCheck': 'false'},
  {'state': '쓰리룸', 'isCheck': 'false'},
  {'state': '포룸 이상', 'isCheck': 'false'},
];

List<Map<String, dynamic>> numberOfToilets = [
  {'state': '화장실 1개', 'isCheck': 'false'},
  {'state': '화장실 2개', 'isCheck': 'false'},
];

List<Map<String, dynamic>> duplex = [
  {'state': '복층', 'isCheck': false},
];

List<Map<String, dynamic>> option = [
  {'state': '에어컨', 'isCheck': false},
  {'state': '냉장고', 'isCheck': false},
  {'state': '붙박이장', 'isCheck': false},
  {'state': '가스레인지', 'isCheck': false},
  {'state': '세탁기', 'isCheck': false},
  {'state': 'TV', 'isCheck': false},
  {'state': '전자레인지', 'isCheck': false},
  {'state': '침대', 'isCheck': false},
  {'state': '책상', 'isCheck': false},
];
