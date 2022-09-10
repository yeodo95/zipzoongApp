import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:zipzoongapp/screens/create/component/custom_bottom_button.dart';
import 'package:zipzoongapp/screens/create/create.dart';
import 'package:zipzoongapp/size_config.dart';

class Step_04 extends StatefulWidget {
  const Step_04({Key? key}) : super(key: key);

  @override
  State<Step_04> createState() => _Step_04State();
}

class _Step_04State extends State<Step_04> {
  String text = "마지막이에요!";
  String text2 = "사진을 올려주세요";

  List<XFile> _selectedFiles = [];

  File? _image;
  @override
  Widget build(BuildContext context) {
    CreateInfoState? parent =
        context.findAncestorStateOfType<CreateInfoState>();
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
                style: Theme.of(context).primaryTextTheme.bodyLarge,
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
    CreateInfoState? parent =
        context.findAncestorStateOfType<CreateInfoState>();
    return SlidingUpPanel(
      minHeight: 0,
      maxHeight: getProportionateScreenHeight(433),
      defaultPanelState: PanelState.OPEN,
      isDraggable: false,
      panel: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 130, vertical: 15),
              primary: Color.fromARGB(42, 0, 123, 255),
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14), //모서리
                side: BorderSide(color: Color(0xffF2F2F7)), //테두리
              ),
            ),
            onPressed: getImageFromGallery,
            child: Text(
              "사진 선택하기",
              style: Theme.of(context).textTheme.button,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 130, vertical: 15),
              primary: Color.fromARGB(42, 0, 123, 255),
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14), //모서리
                side: BorderSide(color: Color(0xffF2F2F7)), //테두리
              ),
            ),
            onPressed: () {
              parent?.NextStep();
            },
            child: Text(
              "건너뛰기",
              style: Theme.of(context).textTheme.button,
            ),
          ),
          Container(
            child: _selectedFiles.isEmpty
                ? Text(
                    "이미지 선택 필요",
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                : SizedBox(
                    height: 200,
                    child: GridView.count(
                      crossAxisCount: _selectedFiles.length,
                      children: List.generate(
                        _selectedFiles.length,
                        (index) => DottedBorder(
                          child: Image.file(
                            File(_selectedFiles[index].path),
                            width: 150,
                          ),
                          color: Colors.grey,
                          dashPattern: [5, 3],
                          borderType: BorderType.RRect,
                        ),
                      ),
                    ),
                  ),
          ),
          Spacer(),
          CustomBottomButton(),
        ]),
      ),
      borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
    );
  }

  Future getImage(ImageSource imageSource) async {
    final image = await ImagePicker().pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }

  Future getImageFromCam() async {
    getImage(ImageSource.camera);
  }

  Future getImageFromGallery() async {
    if (_selectedFiles != null) {
      _selectedFiles.clear();
    }
    try {
      final List<XFile>? selectedImages = await ImagePicker()
          .pickMultiImage(maxWidth: 640, maxHeight: 280, imageQuality: 100);

      setState(() {
        if (selectedImages!.isNotEmpty) {
          _selectedFiles.addAll(selectedImages);
        } else {
          print('no image select');
        }
      });
    } catch (e) {
      print(e);
    }

    print("Image List length: ${_selectedFiles.length.toString()}");
  }
}
