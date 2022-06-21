import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomInputButton extends StatelessWidget {
  const CustomInputButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.press,
  }) : super(key: key);

  final double width;
  final double height;
  final String text;
  final Function? press;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: press as void Function()?,
        child: Text(text),
      ),
    );
  }
}
