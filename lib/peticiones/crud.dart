import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:mvp_all/models/mascota.dart';
import 'package:mvp_all/peticiones/auth.dart';

class Crud {
  static List<Mascota> m = [];

  Future<void> getMascotas(int id) async {
    String idd = id.toString();
    m.clear();
    var response = await http
        .get(Uri.parse('http://10.0.2.2:18082/listByIdDuenio/' + idd));

    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(response.body);

      var datos = jsonDecode(response.body);
      for (var item in datos) {
        m.add(Mascota(
            idMascota: item['idMascota'],
            nombre: item['nombre'],
            tipo: item['tipo'],
            idDuenio: item['idDuenio'],
            idCita: item['idCita'],
            fecha: item['fechaIngreso'],
            razon: item['razon']));
      }
    }
  }

  static Future<bool> deleteMascotas(int id) async {
    String idd = id.toString();

    var response = await http
        .post(Uri.parse('http://10.0.2.2:18082/mascota/delete/' + idd));

    if (response.statusCode == 200) {
      // ignore: avoid_print
      return true;
    }

    return false;
  }

  static Future<bool> registro(nombre, tipo, fecha, razon, context) async {
    final body = {
      "nombre": nombre,
      "tipo": tipo,
      "idDuenio": Auth.id,
      "fechaIngreso": fecha,
      "razon": razon,
    };
    var response = await http.post(
      Uri.parse('http://10.0.2.2:18082/mascota/add'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // ignore: avoid_print
      return true;
    }
  }
}
