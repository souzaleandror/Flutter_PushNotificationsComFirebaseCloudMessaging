import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:meetups/http/web.dart';
import 'package:meetups/models/device.dart';
import 'package:meetups/screens/events_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

final navigateKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print("Permissao conceida pelo usuario: ${settings.authorizationStatus}");
    _startPushNotificationsHandler(messaging);
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print(
        "Permissao conceida provisoriamente pelo usuario: ${settings.authorizationStatus}");
    _startPushNotificationsHandler(messaging);
  } else {
    print("Permissao negada pelo usuario");
  }

  runApp(App());
}

void _startPushNotificationsHandler(FirebaseMessaging messaging) async {
  String? token = await messaging.getToken(vapidKey: 'New Key');
  print('test123');
  print(token);
  _setPushToken(token);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Recebi uma mensagem enquanto estava com o App Aberto!');
    print('Dados da mensagem: ${message.data}');
    print(message.data);
    print(message.notification?.title ?? '');
    print(message.notification?.body ?? '');

    if (message.notification != null) {
      print(
          'A mensagem tambem continua uma notificacao: ${message.notification!.title}, ${message.notification!.body}');
    }
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  var data = await FirebaseMessaging.instance.getInitialMessage();
  if (data!.data['message'].length > 0) {
    showMyDialog(data!.data['message']);
  }
}

void showMyDialog(String message) {
  Widget okButton = OutlinedButton(
      onPressed: () => Navigator.pop(navigateKey.currentContext!),
      child: Text('Ok!'));
  AlertDialog alerta = AlertDialog(
    title: Text('Promoco Imperdivel'),
    content: Text(message),
    actions: [okButton],
  );

  showDialog(
      context: navigateKey.currentContext!,
      builder: (BuildContext context) {
        return alerta;
      });
}

Future<void> _setPushToken(String? token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? prefsToken = prefs.getString('pushToken');
  bool? prefSent = prefs.getBool('tokenSent');

  print('Prefs Token: $prefsToken - prefSent: $prefSent');

  if (prefsToken != token || (prefsToken == token && prefSent == false)) {
    print('Enviando o token para o servidor');

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? brand;
    String? model;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      print('Rodando no ${androidDeviceInfo.model}');
      model = androidDeviceInfo.model;
      brand = androidDeviceInfo.brand;
    } else {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      model = iosDeviceInfo.utsname.machine;
      brand = 'Apple';
    }

    Device device = Device(brand: brand, model: model, token: token);
    sendDevice(device);
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dev meetups',
      home: EventsScreen(),
      navigatorKey: navigateKey,
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Mensagem recebida em background: ${message.data}');
  print(
      'Mensagem recebida em background: ${message.notification!.title}, ${message.notification!.body}');
}
