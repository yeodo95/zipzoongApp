import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Step_03 extends StatefulWidget {
  const Step_03({Key? key}) : super(key: key);

  @override
  State<Step_03> createState() => _Step_03State();
}

class _Step_03State extends State<Step_03> {
  List<bool> _selections = List.generate(3, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "당신의 집을 조금 더 알려주세요",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          "정확히 선택하시면 보다 빠르게 집을 내놓을 수 있어요.",
          style: Theme.of(context).textTheme.caption,
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
