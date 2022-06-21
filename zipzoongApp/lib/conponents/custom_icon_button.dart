import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zipzoongapp/size_config.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    Key? key,
    required this.svgIcon,
    this.text = '',
    required this.press,
  }) : super(key: key);

  final String svgIcon;
  final String text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              svgIcon,
            ),
            onPressed: press as void Function()?,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
