import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Step_04 extends StatefulWidget {
  const Step_04({Key? key}) : super(key: key);

  @override
  State<Step_04> createState() => _Step_04State();
}

class _Step_04State extends State<Step_04> {
  List<bool> _selections = List.generate(3, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "마지막이에요!",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "사진을 올려주세요",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 8,
        ),
        Center(
          child: ToggleButtons(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text("전세"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text("월세"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text("매매"),
              ),
            ],
            isSelected: _selections,
            onPressed: (int index) {
              print(index);
              setState(() {
                for (int i = 0; i < 3; i++) {
                  if (index == i)
                    _selections[i] = true;
                  else
                    _selections[i] = false;
                }
              });
            },
          ),
        ),
      ],
    );
  }
}
