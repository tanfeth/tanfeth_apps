import 'dart:developer';

import 'package:api_controller/shared/globals.dart';
import 'package:api_controller/shared/theme/theme_services.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oktoast/oktoast.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:api_controller/shared/custom_time_ago.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:api_controller/mode/app_mode.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/auth_routing/login_routing.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/auth_routing/register_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/auth_routing/verify_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/home_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/init_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/language_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/layout_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/more_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/notification_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/onboard_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/profile_routing.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/report_problem_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/send_message_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/splash_routing.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/web_view_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/welcome_route.dart';
import 'package:api_controller/shared/shareprefrances.dart';
import 'package:api_controller/shared/sizes.dart';
import 'package:tanfeth_apps/firebase_options.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:showcaseview/showcaseview.dart';

var currentRoute = "".obs;

void mainCommon(FlavorConfig flavorConfig, List<GetPage> screenPages) {
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await Firebase.initializeApp(
      options: !kIsWeb ? null : DefaultFirebaseOptions.currentPlatform,
    );

    timeago.setLocaleMessages('ar', CustomArTimeAgo());
    await GetStorage.init();
     await Images.initImages();
    await Globals.init();
   //  await FacebookAppEvents().setAdvertiserTracking(enabled: true);
     await SharedPreferencesService.init();
    Get.put(flavorConfig, permanent: true);
    return runApp(
        ShowCaseWidget(
          onStart: (index, key) {
            log('onStart: $index, $key');
          },
          onComplete: (index, key) {
            log('onComplete: $index, $key');
          },
          blurValue: 1,
          enableAutoScroll: true,
          autoPlayDelay: const Duration(seconds: 3),
          builder: (context) =>
              ProviderScope(child: CommonMain(flavorConfig, screenPages)),
        ),

    );
  });
}



class CommonMain extends ConsumerWidget {
  final FlavorConfig flavorConfig;
  final List<GetPage> screenPages;
  CommonMain(
    this.flavorConfig,
    this.screenPages, {super.key}
  ) {
    screenPages.addAll([
      InitRouting.config().page,
      SplashRouting.config().page,
      LanguageRouting.config().page,
      OnBoardingRouting.config().page,
      WelcomeRouting.config().page,
      LoginRouting.config().page,
      VerifyRouting.config().page,
      LayoutRouting.config().page,
      HomeRouting.config().page,
      ProfileRouting.config().page,
      WebViewRouting.config().page,
      SendMessageRouting.config().page,
      ReportProblemRouting.config().page,
      NotificationsRouting.config().page,
      RegisterRouting.config().page,
      MoreRouting.config().page,
    ]);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    timeago.setDefaultLocale(AppMode.getLanguageMode());

    return OKToast(
      position: ToastPosition.top,
      duration: const Duration(milliseconds: 2500),
      textPadding: const EdgeInsets.symmetric(
        horizontal: MySizes.defaultPadding * 1.3,
        vertical: MySizes.defaultPadding * .9,
      ),
      backgroundColor: Colors.black.withOpacity(.8),
      textStyle: context.text.bodyMedium?.copyWith(
        color: context.color.onPrimary,
        fontFamily:"DinNext",
        fontWeight: FontWeight.w500,
        height: 1.5,
      ),
      child:GetMaterialApp(
        getPages: screenPages,
        navigatorKey: Get.key,
        initialRoute: InitRouting.config().path,
        theme: flavorConfig.myTheme.getTheme(Brightness.light),
        darkTheme: flavorConfig.myTheme.getTheme(Brightness.dark),
        themeMode: ThemeService().theme,
        locale: Locale(AppMode.getLanguageMode(initLang: "en")),
        fallbackLocale: flavorConfig.fallbackLocale,
        translations: flavorConfig.languages,
        localizationsDelegates: const [
          CountryLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routingCallback: (routing) {
          currentRoute.value = routing?.current ?? "%%";
        },
        initialBinding: InitBinding(),
        builder: (context, child) {
          return Row(
            children: [
              Expanded(child: child ?? const SizedBox.shrink()),
            ],
          );
        },
        supportedLocales: flavorConfig.supportedLocales,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
