import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Step_02 extends StatefulWidget {
  const Step_02({Key? key}) : super(key: key);

  @override
  State<Step_02> createState() => _Step_02State();
}

class _Step_02State extends State<Step_02> {
  List<bool> _selections = List.generate(3, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "어떻게 계약하길 원하시나요?",
          style: Theme.of(context).textTheme.bodyLarge,
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
