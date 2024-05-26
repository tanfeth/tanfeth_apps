import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tanfeth_apps/common/shared/notification/NotificationEnumGroup.dart';
import 'package:tanfeth_apps/common/shared/notification/target_page.dart';
import 'CustomNotificationExtraModel.dart';


class NotificationGroup {
  final String name;
  final String id;
  final String groupKey;

  NotificationGroup({
    required this.name,
    required this.id,
    required this.groupKey,
  });
}


class CustomNotification {
  static late String _defaultLogo;
  static late String _defaultSound;

  static late Function(
      {required int fkNotification,
      required String fkNotificationOpenType,
      required dynamic isFCM,
      required String target,
      }) _handleOpenNotification;
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();


  static Future<void>initNotification() async {
    await Firebase.initializeApp();
    CustomNotification.init(
        handleOpenNotification: handleOpenNotification,
        defaultLogo: "logo",
        defaultSound: "notification",
        notificationGroups: notificationGroups);
  }

  static late List<NotificationGroup> _notificationGroups;

  static _displayNotification(
      {String? title,
      String? body,
      String? payload,
      RemoteMessage? message,}) async {
    if (message != null) {
      title = message.data['Title'];
      body = message.data['Body'];
      payload = message.data['Extra'];
    }


    final extra = CustomNotificationExtraModel.fromJson(json.decode(payload!));

    NotificationGroup notificationGroup = _notificationGroups
        .firstWhere((element) => element.id == extra.OpenType.toString());

    var largeIcon = "", coverIcon = "";
    if ((extra.LogoUrl ?? "").isNotEmpty){
      largeIcon = await _downloadAndSaveFile(extra.LogoUrl!,
          extra.LogoUrl!.substring(extra.LogoUrl!.lastIndexOf("/")));
    }

    if ((extra.ImgUrl ?? "").isNotEmpty){
      coverIcon = await _downloadAndSaveFile(extra.ImgUrl!,
          extra.ImgUrl!.substring(extra.ImgUrl!.lastIndexOf("/")));
    }


    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(notificationGroup.id, notificationGroup.name,
            importance: Importance.max,
            priority: Priority.high,
            vibrationPattern: Int64List.fromList([1000, 1000, 500, 1000, 1000]),
            channelShowBadge: true,
            enableVibration: true,
            groupKey: notificationGroup.groupKey,
            largeIcon:
                largeIcon.isEmpty ? null : FilePathAndroidBitmap(largeIcon),
            styleInformation: coverIcon.isEmpty
                ? null
                : BigPictureStyleInformation(
                    FilePathAndroidBitmap(coverIcon),
                  ),
            playSound: true,
            sound: RawResourceAndroidNotificationSound(
                CustomNotification._defaultSound),
            showWhen: true);

    DarwinNotificationDetails iosNotificationDetails = DarwinNotificationDetails(
        threadIdentifier: notificationGroup.id,
        sound: _defaultSound + ".wav",
        attachments: coverIcon.isEmpty
            ? null
            : <DarwinNotificationAttachment>[
                //       IOSNotificationAttachment(largeIcon),
          DarwinNotificationAttachment(coverIcon),
              ]);

    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);


    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: true,
      criticalAlert: false,
      sound: true,
    );

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    await flutterLocalNotificationsPlugin.show(
        int.parse("${extra.OpenValue ?? 1}"),
        title,
        body,
        platformChannelSpecifics,
        payload: payload);
    _showNotificationGroup(flutterLocalNotificationsPlugin, notificationGroup);

  }


  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
        log('_firebaseMessagingBackgroundHandler');
        var userImage;
        if((message.data['ImgUrl']??'').toString().isNotEmpty){
          userImage = (message.data['ImgUrl']??'')
              .substring((message.data['ImgUrl']??'').lastIndexOf("https://"));
        }

  }

  static Future _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
       _displayNotification(title: title, body: body, payload: payload); //TODO
  }

  static init(
      {required String defaultLogo,
      required String defaultSound,
      required List<NotificationGroup> notificationGroups,
      required Function(
              {required int fkNotification,
              required String fkNotificationOpenType,
              required dynamic isFCM,
              required String target})
          handleOpenNotification}) async {
    CustomNotification._handleOpenNotification = handleOpenNotification;
    CustomNotification._notificationGroups = notificationGroups;
    CustomNotification._defaultLogo = defaultLogo;
    CustomNotification._defaultSound = defaultSound;
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head projectAndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(_defaultLogo);

    final DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
            onDidReceiveLocalNotification: _onDidReceiveLocalNotification,);
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: onNotificationClick,
    );


    FirebaseMessaging.onBackgroundMessage(
        CustomNotification._firebaseMessagingBackgroundHandler,);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //Foreground message in ios send auto ... android need to show manual
      _displayNotification(message: message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //background message
      onTapRemoteMessage(message);
    });

    //check if notification open from deeplinking
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await FlutterLocalNotificationsPlugin()
            .getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails != null &&
        notificationAppLaunchDetails.didNotificationLaunchApp) {
      onNotificationClick(
          notificationAppLaunchDetails.notificationResponse);
    }
  }

  static _showNotificationGroup(
      FlutterLocalNotificationsPlugin flutterLocalNotificationPlugin,
      NotificationGroup notificationGroup) async {

    List<ActiveNotification>? activeNotifications =
        await flutterLocalNotificationPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.getActiveNotifications();

    if (activeNotifications == null) return;

    if (activeNotifications.length > 0) {
      List<String> lines =
          activeNotifications.map((e) => e.title.toString()).toList();
      InboxStyleInformation inboxStyleInformation = InboxStyleInformation(
        lines,
      );
      AndroidNotificationDetails groupNotificationDetails =
          AndroidNotificationDetails(
              notificationGroup.id, notificationGroup.name,
              styleInformation: inboxStyleInformation,
              setAsGroupSummary: true,
              groupKey: notificationGroup.groupKey);
      NotificationDetails groupNotificationDetailsPlatformSpecifics =
          NotificationDetails(android: groupNotificationDetails);
      await flutterLocalNotificationPlugin.show(
          0, '', '', groupNotificationDetailsPlatformSpecifics);
    }
  }

  static void onTapRemoteMessage(RemoteMessage message) {
    final extra = CustomNotificationExtraModel.fromJson(
        json.decode(message.data['Extra']!));
    _handleOpenNotification(
      fkNotification: extra.NotificationId ?? 0,
      fkNotificationOpenType: extra.OpenType ?? "",
      target: extra.OpenValue ?? "",
      isFCM: true,
    );
  }
}

Future<String> _downloadAndSaveFile(String url, String fileName) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final String filePath = '${directory.path}/$fileName';
  final File file = File(filePath);
  var image = (await NetworkAssetBundle(
    Uri.parse(url),
  ).load(url));
  await file.writeAsBytes(image.buffer.asUint8List());
  return filePath;
}

handleOpenNotification({
  required int fkNotification,
  required String fkNotificationOpenType,
  required String target,
  required isFCM,
  String? userImage ,
  String? title
}) {
  toTarget(targetPage: fkNotificationOpenType, targetValue: target,
   userImage: userImage,
   title: title);
}


Future<dynamic> onNotificationClick (NotificationResponse? response)  async {
  if (response == null) return;
  var notificationPayLoadModel =
  CustomNotificationExtraModel.fromJson(jsonDecode(response.payload ?? ''));

  handleOpenNotification(
    fkNotification: notificationPayLoadModel.NotificationId ?? 0,
    fkNotificationOpenType: notificationPayLoadModel.OpenType ?? "",
    target: notificationPayLoadModel.OpenValue ?? "",
    isFCM: true,
    title: '',
    userImage:'' ,
  );
}


