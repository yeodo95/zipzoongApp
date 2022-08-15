import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final Completer<WebViewController> webController =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl:
              '//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js',
          onWebViewCreated: (WebViewController _controller) async {
            webController.isCompleted
                ? ''
                : webController.complete(_controller);
          },
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
