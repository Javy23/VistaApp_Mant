import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mvp_all/peticiones/auth.dart';
import 'package:mvp_all/style/colors/colors_views.dart';

import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  bool _secureText = true;
  bool isChecked = false;
  String inkwell = '';
  final formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APP BAR
      appBar: AppBar(
        title: const Text(
          "Iniciar Sesión",
        ),
        backgroundColor: ColorsSelect.txtBoHe,
        toolbarHeight: 60,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: ColorsSelect.paginatorNext),
          onPressed: () {
            Navigator.pop(context);
            //Navigator.of(context).pushReplacementNamed('/login');
          },
        ),
        actions: [
          Image.asset(
            "assets/images/splash.png",
            color: ColorsSelect.btnBackgroundBo1,
            width: 90,
            height: 70,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //LABEL APP
              Container(
                margin: const EdgeInsets.all(30),
                width: MediaQuery.of(context).size.width,
                child: FittedBox(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 23),
                        child: const Text(
                          "Inicia sesión con tu cuenta para continuar",
                          style: TextStyle(
                            color: ColorsSelect.txtBoSubHe,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //FORM NOMBRE
              Container(
                margin: const EdgeInsets.only(
                  right: 30,
                  left: 30,
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      //FORM CORREO
                      Row(
                        children: const <Widget>[
                          Text(
                            "Correo Electronico",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              height: 0,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      correo(),
                      //FORM CONTRASEÑA
                      Row(
                        children: const <Widget>[
                          Text(
                            "Contraseña",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              height: 0,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      contra(),
                      //TEXTO CONTRASEÑA
                      Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/recuperar');
                          },
                          child: const Text(
                            "¿Has olvidado tu contraseña?",
                            style: TextStyle(
                              color: ColorsSelect.paginatorNext,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //BOTON INGRESAR
              btnIngresar(),
              //TEXTO REDIRRECCIONAMIENTO A REGISTRO
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "¿Todavía no tienes una cuenta?",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/registro');
                    },
                    child: const Text(
                      "Regístrate",
                      style: TextStyle(
                          color: ColorsSelect.paginatorNext,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget correo() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 40),
        child: TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Dirección de correo",
            hintStyle: const TextStyle(color: ColorsSelect.btnBackgroundBo3),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorsSelect.btnBackgroundBo3),
              borderRadius: BorderRadius.circular(18),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorsSelect.btnBackgroundBo3),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          onChanged: (value) {},
          validator: (value) {
            return validar(value);
          },
        ),
      );
    });
  }

  Widget contra() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 5),
        child: TextFormField(
          controller: passController,
          decoration: InputDecoration(
            hintText: "Contraseña",
            hintStyle: const TextStyle(color: ColorsSelect.btnBackgroundBo3),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorsSelect.btnBackgroundBo3),
              borderRadius: BorderRadius.circular(18),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorsSelect.btnBackgroundBo3),
              borderRadius: BorderRadius.circular(18),
            ),
            suffixIcon: IconButton(
              icon: Icon(_secureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _secureText = !_secureText;
                });
              },
            ),
          ),
          obscureText: _secureText,
          onChanged: (value) {},
          validator: (value) {
            return validar(value);
          },
        ),
      );
    });
  }

  Widget btnIngresar() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        margin: const EdgeInsets.only(top: 190, bottom: 10),
        child: ElevatedButton(
          onPressed: () {
            //login();

            Auth.login(emailController.text, passController.text, context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Text(
                "Ingresar",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(350, 50),
            primary: ColorsSelect.btnBackgroundBo2,
            //textStyle:const TextStyle(fontSize: 17, color: Colors.black),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
      );
    });
  }

  Future<void> login() async {
    final body = {
      "email": emailController.text,
      "password": passController.text,
    };
    var response = await http.post(
      Uri.parse('http://10.0.2.2:18081/user/login'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(response.body);
      Navigator.of(context).pushNamed('/recuperar');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Credenciales invalidas")));
    }
  }

  String validar(String value) {
    if (value == null || value.isEmpty) {
      return 'Campo requerido';
    }
    return null;
  }
}
