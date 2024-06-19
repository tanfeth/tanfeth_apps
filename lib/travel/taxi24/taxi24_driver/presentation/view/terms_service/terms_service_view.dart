import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/web_view_route.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/common/vm/langauge/langauge_vm.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/driver_data_route.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/src/android_webview_controller.dart';
import 'package:webview_flutter_wkwebview/src/webkit_webview_platform.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';



class TermsServiceView extends ConsumerStatefulWidget{
  const TermsServiceView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TermsServiceView();


}

class _TermsServiceView extends ConsumerState<TermsServiceView>{

  late final WebViewController webViewController;
  late final PlatformWebViewControllerCreationParams params;
  late String appBarTitle;
  late String pageUrl;
  bool pageLoading = true;


  @override
  void initState() {
    pageUrl= '${customAppFlavor.commonEnum.appDataEnum.termsAndCondition+ref.read(languageProvider)}';
     initWebViewSettings();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.termsOfUse.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Stack(
            children: [
              pageLoading?
              Center(child: const CircularProgressIndicator(),):
              WebViewWidget(controller: webViewController),

              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child:   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed(DriverDataRouting.config().path);
                      },
                      child: Text(LangEnum.iAgree.tr()),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void initWebViewSettings() {
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
  }

}