import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class IntasendWebView extends StatelessWidget {
  final String url;
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  IntasendWebView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      mediaPlaybackRequiresUserGesture: false,
      withZoom: true,
      withLocalStorage: true,
      hidden: false,
      initialChild: Container(
        color: Colors.white,
        child: const Center(
          child: Text('Please wait..'),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                flutterWebViewPlugin.goBack();
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                flutterWebViewPlugin.goForward();
              },
            ),
            IconButton(
              icon: const Icon(Icons.autorenew),
              onPressed: () {
                flutterWebViewPlugin.reload();
              },
            ),
          ],
        ),
      ),
    );
  }
}
