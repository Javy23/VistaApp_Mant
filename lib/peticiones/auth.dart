import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mvp_all/peticiones/crud.dart';

class Auth {
  static int id;

  static Future<void> login(email, pass, context) async {
    final body = {
      "email": email,
      "password": pass,
    };
    var response = await http.post(
      Uri.parse('http://10.0.2.2:18081/user/login'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      var datos = jsonDecode(response.body);
      id = datos['id'];
      Navigator.of(context).pushNamed('/landing');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Credenciales invalidas")));
    }
  }

  static Future<void> registro(
      nombre, telefono, direccion, email, pass, context) async {
    final body = {
      "nombre": nombre,
      "telefono": telefono,
      "direccion": direccion,
      "email": email,
      "password": pass,
    };
    var response = await http.post(
      Uri.parse('http://10.0.2.2:18081/user/owner/signup'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(response.body);
      Navigator.of(context).pushNamed('/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Credenciales invalidas")));
    }
  }
}
