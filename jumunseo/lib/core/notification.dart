import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:jumunseo/core/logger.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class FlutterLocalNotification {
  FlutterLocalNotification._();

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static init() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('mipmap/launcher_icon');

    DarwinInitializationSettings iosInitializationSettings =
        const DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static requestNotificationPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  static Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future<void> showNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails('channel id', 'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
        priority: Priority.max,
        showWhen: false);

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: DarwinNotificationDetails(badgeNumber: 1)
    );

    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    logger.d(currentTimeZone);

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    DateTime dt = DateTime.now();
    logger.d(dt);

    // await flutterLocalNotificationsPlugin.show(0, '주문서', '새로운 딜레마가 갱신 되었습니다', notificationDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0, '주문서', '새로운 딜레마가 갱신 되었습니다.', 
      tz.TZDateTime.local(dt.year, dt.month, dt.day, dt.hour, dt.minute, dt.second).add(const Duration(seconds: 30)),
      notificationDetails,
      androidScheduleMode: 
        AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime
    );
  }
}