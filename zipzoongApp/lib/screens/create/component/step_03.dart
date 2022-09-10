import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:zipzoongapp/contant.dart';
import 'package:zipzoongapp/screens/create/component/custom_bottom_button.dart';
import 'package:zipzoongapp/size_config.dart';

class Step_03 extends StatefulWidget {
  const Step_03({Key? key}) : super(key: key);

  @override
  State<Step_03> createState() => _Step_03State();
}

class _Step_03State extends State<Step_03> {
  String text = "당신의 집을 조금 더 알려주세요";
  String text2 = "정확히 선택하시면 보다 빠르게 집을 내놓을 수 있어요.";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(250),
            ),
            Center(
              child: Text(
                text,
                style: Theme.of(context).primaryTextTheme.bodyLarge,
              ),
            ),
            Center(
              child: Text(
                text2,
                style: Theme.of(context).primaryTextTheme.caption,
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
        _bottomSheet(),
      ],
    );
  }

  _bottomSheet() {
    return SlidingUpPanel(
      minHeight: 0,
      maxHeight: 420,
      defaultPanelState: PanelState.OPEN,
      isDraggable: false,
      panel: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: InkWell(
                onTap: () {
                  setState(() {
                    for (int i = 0; i < houseType.length; i++) {
                      houseType[i]['isCheck'] = false;
                    }
                    for (int i = 0; i < floorType.length; i++) {
                      floorType[i]['isCheck'] = false;
                    }
                    for (int i = 0; i < numberOfRooms.length; i++) {
                      numberOfRooms[i]['isCheck'] = false;
                    }
                    for (int i = 0; i < numberOfToilets.length; i++) {
                      numberOfToilets[i]['isCheck'] = false;
                    }
                    for (int i = 0; i < duplex.length; i++) {
                      duplex[i]['isCheck'] = false;
                    }
                    for (int i = 0; i < option.length; i++) {
                      option[i]['isCheck'] = false;
                    }
                  });
                },
                child: Text(
                  "초기화",
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            Container(
                height: 250,
                child: ListView(
                  children: [
                    Text(
                      "건물 유형",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Container(
                      child: Wrap(
                        spacing: 5,
                        children: List.generate(houseType.length, (index) {
                          return ChoiceChip(
                            backgroundColor: Color(0xffF2F2F7),
                            selectedColor: Color(0xffE3E3E3),
                            selected: houseType[index]['isCheck'] == true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                            label: Text(
                              houseType[index]['state'],
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            onSelected: (value) {
                              // IsSelected = true;
                              // selectIndex = index;
                              setState(() {
                                for (int i = 0; i < houseType.length; i++) {
                                  if (index == i)
                                    houseType[i]['isCheck'] = true;
                                  else
                                    houseType[i]['isCheck'] = false;
                                }
                              });
                            },
                          );
                        }),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      height: 1,
                      width: double.infinity,
                      color: Color(0xffE0E0E0),
                    ),
                    Text(
                      "층수",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Container(
                      child: Wrap(
                        spacing: 5,
                        children: List.generate(floorType.length, (index) {
                          return ChoiceChip(
                            backgroundColor: Color(0xffF2F2F7),
                            selectedColor: Color(0xffE3E3E3),
                            selected: floorType[index]['isCheck'] == true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                            label: Text(
                              floorType[index]['state'],
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            onSelected: (value) {
                              // IsSelected = true;
                              // selectIndex = index;
                              setState(() {
                                for (int i = 0; i < floorType.length; i++) {
                                  if (index == i)
                                    floorType[i]['isCheck'] = true;
                                  else
                                    floorType[i]['isCheck'] = false;
                                }
                              });
                            },
                          );
                        }),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      height: 1,
                      width: double.infinity,
                      color: Color(0xffE0E0E0),
                    ),
                    Text(
                      "방구조",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Container(
                      child: Wrap(
                        spacing: 5,
                        children: List.generate(numberOfRooms.length, (index) {
                          return ChoiceChip(
                            backgroundColor: Color(0xffF2F2F7),
                            selectedColor: Color(0xffE3E3E3),
                            selected: numberOfRooms[index]['isCheck'] == true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                            label: Text(
                              numberOfRooms[index]['state'],
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            onSelected: (value) {
                              // IsSelected = true;
                              // selectIndex = index;
                              setState(() {
                                for (int i = 0; i < numberOfRooms.length; i++) {
                                  if (index == i)
                                    numberOfRooms[i]['isCheck'] = true;
                                  else
                                    numberOfRooms[i]['isCheck'] = false;
                                }
                              });
                            },
                          );
                        }),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Wrap(
                            spacing: 5,
                            children:
                                List.generate(numberOfToilets.length, (index) {
                              return ChoiceChip(
                                // padding: EdgeInsets.symmetric(
                                //     vertical: 7,
                                //     horizontal: getProportionateScreenWidth(10)),
                                backgroundColor: Color(0xffF2F2F7),
                                selectedColor: Color(0xffE3E3E3),
                                selected:
                                    numberOfToilets[index]['isCheck'] == true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                label: Text(
                                  numberOfToilets[index]['state'],
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                onSelected: (value) {
                                  // IsSelected = true;
                                  // selectIndex = index;
                                  setState(() {
                                    for (int i = 0;
                                        i < numberOfToilets.length;
                                        i++) {
                                      if (index == i)
                                        numberOfToilets[i]['isCheck'] = true;
                                      else
                                        numberOfToilets[i]['isCheck'] = false;
                                    }
                                  });
                                },
                              );
                            }),
                          ),
                          SizedBox(width: 5),
                          Wrap(
                            spacing: 5,
                            children: List.generate(duplex.length, (index) {
                              return ChoiceChip(
                                backgroundColor: Color(0xffF2F2F7),
                                selectedColor: Color(0xffE3E3E3),
                                selected: duplex[index]['isCheck'] == true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                label: Text(
                                  duplex[index]['state'],
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                onSelected: (value) {
                                  // IsSelected = true;
                                  // selectIndex = index;
                                  setState(() {
                                    for (int i = 0; i < duplex.length; i++) {
                                      duplex[index]['isCheck'] =
                                          !duplex[index]['isCheck'];
                                    }
                                  });
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      height: 1,
                      width: double.infinity,
                      color: Color(0xffE0E0E0),
                    ),
                    Text(
                      "옵션",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Wrap(
                      spacing: 5,
                      children: List.generate(option.length, (index) {
                        return ChoiceChip(
                          backgroundColor: Color(0xffF2F2F7),
                          selectedColor: Color(0xffE3E3E3),
                          selected: option[index]['isCheck'] == true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          label: Text(
                            option[index]['state'],
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          onSelected: (value) {
                            // IsSelected = true;
                            // selectIndex = index;
                            setState(() {
                              for (int i = 0; i < option.length; i++) {
                                option[index]['isCheck'] =
                                    !option[index]['isCheck'];
                              }
                            });
                          },
                        );
                      }),
                    ),
                  ],
                )),

            SizedBox(height: 15),
            // Center(
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       padding: EdgeInsets.symmetric(horizontal: 154, vertical: 15),
            //       primary: Color.fromARGB(42, 0, 123, 255),
            //       shadowColor: Colors.transparent,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(14), //모서리
            //         side: BorderSide(color: Color(0xffF2F2F7)), //테두리
            //       ),
            //     ),
            //     onPressed: () {
            //       setState(() {
            //         for (int i = 0; i < houseType.length; i++) {
            //           houseType[i]['isCheck'] = false;
            //         }
            //         for (int i = 0; i < floorType.length; i++) {
            //           floorType[i]['isCheck'] = false;
            //         }
            //         for (int i = 0; i < numberOfRooms.length; i++) {
            //           numberOfRooms[i]['isCheck'] = false;
            //         }
            //         for (int i = 0; i < numberOfToilets.length; i++) {
            //           numberOfToilets[i]['isCheck'] = false;
            //         }
            //         for (int i = 0; i < duplex.length; i++) {
            //           duplex[i]['isCheck'] = false;
            //         }
            //       });
            //     },
            //     child: Text(
            //       "초기화",
            //       style: Theme.of(context).textTheme.button,
            //     ),
            //   ),
            // ),
            Spacer(),
            CustomBottomButton(),
          ],
        ),
      ),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(35),
      ),
    );
  }
}
