import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mvp_all/peticiones/auth.dart';
import 'package:mvp_all/style/colors/colors_views.dart';

class Registro extends StatefulWidget {
  const Registro({Key key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  bool _secureText = true;
  bool isChecked = false;
  String inkwell = '';
  final formkey = GlobalKey<FormState>();

  var nombreController = TextEditingController();
  var telefonoController = TextEditingController();
  var direccionController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APP BAR
      appBar: AppBar(
        title: const Text(
          "Registro",
          //style: TextStyle(fontSize: 20),
        ),
        backgroundColor: ColorsSelect.txtBoHe,
        toolbarHeight: 60,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: ColorsSelect.paginatorNext),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Image.asset(
            "assets/images/splash.png",
            //alignment: Alignment.centerRight,
            color: ColorsSelect.btnBackgroundBo1,
            width: 90,
            height: 70,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //LABEL APP
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: FittedBox(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: const Text(
                        "Crea una cuenta para empezar a usar la app",
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
                    Row(
                      children: const <Widget>[
                        Text(
                          "Nombre",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 0,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    nombre(),
                    Row(
                      children: const <Widget>[
                        Text(
                          "Direccion",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 0,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    direccion(),
                    Row(
                      children: const <Widget>[
                        Text(
                          "Telefono",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 0,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    telefono(),
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

                    //CHECKBOX

                    //BOTON CREAR CUENTA
                    btnCrear(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "¿Ya tienes una cuenta?",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          child: const Text(
                            "Iniciar sesión",
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
          ],
        ),
      ),
    );
  }

  Widget nombre() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 25),
        child: TextFormField(
          controller: nombreController,
          decoration: InputDecoration(
            hintText: "Nombre Completo",
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

  Widget direccion() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 25),
        child: TextFormField(
          controller: direccionController,
          decoration: InputDecoration(
            hintText: "Direccion",
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

  Widget telefono() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 25),
        child: TextFormField(
          controller: telefonoController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Numero de telefono",
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

  Widget correo() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 25),
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
        margin: const EdgeInsets.only(top: 10, bottom: 50),
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

  Widget btnCrear() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          onPressed: () {
            if (formkey.currentState.validate()) {
              formkey.currentState.save();
              Auth.registro(
                  nombreController.text,
                  telefonoController.text,
                  direccionController.text,
                  emailController.text,
                  passController.text,
                  context);
            }
            isChecked ? validarCheck : null;
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Text(
                "Crear Cuenta",
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
            textStyle: const TextStyle(fontSize: 17, color: Colors.black),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
      );
    });
  }

  String validar(String value) {
    if (value == null || value.isEmpty) {
      return 'Campo requerido';
    }
    return null;
  }

  String validarCheck() {
    if (isChecked == null) {
      return "Campo requerido";
    }
    return null;
  }
}
