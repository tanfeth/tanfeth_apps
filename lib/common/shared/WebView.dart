
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  final String link;
  final String? title;
  final String? token;
  final Map<String, String>? headers;
  final void Function(String url)? onLoading;

  WebView(this.link,
      {this.title, this.onLoading, this.token, this.headers});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  bool isStorageDone = false;
  int position = 1;

  final key = UniqueKey();

  var webViewController = WebViewController();

  var isPDF = true;

  doneLoading(String url) async {
    print("startLoading: $url");
    setState(() {
      position = 0;
    });
  }

  startLoading(String url) async {
    print("startLoading: $url");
    /* if (widget.token != null && !isStorageDone) {
      var cookie = await webViewController.runJavaScriptReturningResult(
        'localStorage["token"] = "${widget.token}";',
      );
      print("cookie: $cookie");
      isStorageDone = true;
    }*/
    setState(() {
      position = 1;
      if (widget.onLoading != null) widget.onLoading!(url);
    });
  }

  @override
  void initState() {
    webViewController.enableZoom(true);
    webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: startLoading,
          onUrlChange: (url) {
            print("onUrlChange: $url");
          },
          onPageFinished: doneLoading,
        ),
      );

    webViewController.loadRequest(Uri.parse(widget.link),
        headers: widget.headers ?? {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Navigator.canPop(context) ? null : 0,
        title: Text(widget.title ?? ""),
      ),
      body: SafeArea(
        child:  IndexedStack(
                index: position,
                children: [
                  WebViewWidget(
                    controller: webViewController,
                  ),
                  const Center(child: CircularProgressIndicator()),
                ],
              ),
      ),
    );
  }
}
