import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:zipzoongapp/conponents/sliding_panel/custom_tap_widget.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {Key? key, required this.panelHieght, required this.panelController})
      : super(key: key);

  final double panelHieght;
  final PanelController panelController;
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      // panelSnapping: false,
      minHeight: 50,
      maxHeight: panelHieght,
      backdropEnabled: true,
      color: Colors.black,
      controller: PanelController(),
      panelBuilder: (scrollController) => buildSlidingPanel(
        panelController: panelController,
        scrollController: scrollController,
      ),
      // isDraggable: false,

      borderRadius: BorderRadius.vertical(
        top: Radius.circular(35),
      ),
    );
  }

  Widget buildSlidingPanel(
      {required PanelController panelController,
      required ScrollController scrollController}) {
    return Container(
      child: CustomTapWidget(scrollController: scrollController),
    );
  }
}
