import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meetups/models/event.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/device.dart';

const String baseUrl = 'http://192.168.178.24:8080/api';

Future<List<Event>> getAllEvents() async {
  final response = await http.get(Uri.parse('$baseUrl/events'));

  if (response.statusCode == 200) {
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) => Event.fromJson(json)).toList();
  } else {
    throw Exception('Falha ao carregar os eventos');
  }
}

Future<http.Response> sendDevice(Device device) async {
  final response = await http.post(
    Uri.parse('$baseUrl/devices'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        'token': device.token ?? '',
        'modelo': device.model ?? '',
        'marca': device.brand ?? ''
      },
    ),
  );

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('pushToken', device.token!);
  prefs.setBool('tokenSent', false);

  if (response.statusCode != 200) {
    throw Exception('Falha ao criar o dispositivo');
  } else {
    prefs.setBool('tokenSent', true);
  }

  return response;
}
