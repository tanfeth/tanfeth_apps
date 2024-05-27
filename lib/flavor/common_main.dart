import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:tanfeth_apps/common/shared/globals.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/mode/app_mode.dart';
import 'package:tanfeth_apps/common/shared/routing/routing.dart';
import 'package:tanfeth_apps/common/shared/shareprefrances.dart';
import 'package:tanfeth_apps/firebase_options.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:facebook_app_events/facebook_app_events.dart';

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
    await FacebookAppEvents().setAdvertiserTracking(enabled: true);
    await Globals.init();
    await SharedPreferencesService.init();
    //  CustomSignalR.init();
    await Images.initImages();
    await GetStorage.init();

    return runApp(
      ProviderScope(child: CommonMain(flavorConfig, screenPages)),
    );
  });
}

class CommonMain extends ConsumerWidget {
  final FlavorConfig flavorConfig;
  final List<GetPage> screenPages;
  CommonMain(
    this.flavorConfig,
    this.screenPages,
  ) {
    screenPages.addAll([
      InitRouting.config().page,
    ]);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GetMaterialApp(
      getPages: screenPages,
      navigatorKey: Get.key,
      initialRoute: InitRouting.config().path,
      theme: flavorConfig.myTheme.getTheme(Brightness.light),
      darkTheme: flavorConfig.myTheme.getTheme(Brightness.dark),
      themeMode: AppMode.getThemeMode(),
      locale: Locale(AppMode.getLanguageMode(initLang: "en")),
      fallbackLocale: flavorConfig.fallbackLocale,
      translations: flavorConfig.myLanguages,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routingCallback: (routing) {
        currentRoute.value = routing?.current ?? "%%";
      },
      initialBinding: InitBinding(),
      builder: (context, child) {
        return child ?? const SizedBox.shrink();
      },
      supportedLocales: flavorConfig.supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}
