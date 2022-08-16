import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Step_05 extends StatefulWidget {
  const Step_05({Key? key}) : super(key: key);

  @override
  State<Step_05> createState() => _Step_05State();
}

class _Step_05State extends State<Step_05> {
  List<bool> _selections = List.generate(3, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "등록완료",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "지금부터 중개사 입찰이 시작됩니다",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
