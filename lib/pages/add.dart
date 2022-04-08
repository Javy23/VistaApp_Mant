import 'package:flutter/material.dart';
import 'package:mvp_all/peticiones/auth.dart';
import 'package:mvp_all/style/colors/colors_views.dart';

import '../peticiones/crud.dart';

class Add extends StatefulWidget {
  const Add({Key key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  bool _secureText = true;
  bool isChecked = false;
  String inkwell = '';
  final formkey = GlobalKey<FormState>();

  var nombreController = TextEditingController();
  var tipoController = TextEditingController();
  var fechaController = TextEditingController();
  var razonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APP BAR
      appBar: AppBar(
        title: const Text(
          "Nueva mascota",
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
                        "Agregue su nueva mascota",
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
                          "Tipo",
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
                          "Fecha",
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
                          "Razon",
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
                    btnCrear(),
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
            hintText: "Nombre",
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
          controller: tipoController,
          decoration: InputDecoration(
            hintText: "Tipo",
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
          controller: fechaController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Fecha ingreso",
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
          controller: razonController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Razon",
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

  Widget btnCrear() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          onPressed: () {
            if (formkey.currentState.validate()) {
              formkey.currentState.save();
              Future<bool> nuevo = Crud.registro(
                  nombreController.text,
                  tipoController.text,
                  fechaController.text,
                  razonController.text,
                  context);

              if (nuevo != null) {
                Navigator.pop(context, true);
              }
            }
            isChecked ? validarCheck : null;
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Text(
                "Agregar",
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
