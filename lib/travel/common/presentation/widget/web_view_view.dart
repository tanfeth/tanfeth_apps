import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/web_view_route.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';


class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController webViewController;
  late final PlatformWebViewControllerCreationParams params;
  late String appBarTitle;
  late String pageUrl;
  bool pageLoading = true;


  @override
  void initState() {
    appBarTitle = Get.parameters[WebViewRouting.appBarTitle] ?? '';
    pageUrl = Get.parameters[WebViewRouting.pageUrl] ?? '';


    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }
    final WebViewController controller = WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            log('WebView is loading (progress : $progress%)');

          },
          onPageStarted: (String url) {
            log('Page started loading: $url');
          },
          onPageFinished: (String url) {
            // WebViewRepository.getWebViewResponse(url: url, context: context);
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              setState(() {
                pageLoading = false;
              });
            });


          },
          onWebResourceError: (WebResourceError error) {
            log('Page resource error: code: ${error.errorCode}, description: ${error.description}, errorType: ${error.errorType}, isForMainFrame: ${error.isForMainFrame}');
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(pageUrl));
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController).setMediaPlaybackRequiresUserGesture(false);
    }
    webViewController = controller;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: appBarTitle,
        leadingWidget: const BackButtonWidget(),
      ),
      body: pageLoading?
          Center(child: const CircularProgressIndicator(),):
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: WebViewWidget(controller: webViewController),
      ),
    );
  }
}
