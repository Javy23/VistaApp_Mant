import 'package:flutter/material.dart';
import 'package:mvp_all/style/colors/colors_views.dart';

class Recuperar extends StatefulWidget {
  const Recuperar({Key key}) : super(key: key);

  @override
  State<Recuperar> createState() => _RecuperarState();
}

class _RecuperarState extends State<Recuperar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recuperar Contraseña",
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
      body: SafeArea(
        child: Container(
          color: ColorsSelect.fondo,
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.all(30),
                    width: MediaQuery.of(context).size.width,
                    child: FittedBox(
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 23),
                            child: const Text(
                              "Ingresa tu email para restablecer tu contraseña",
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
                  Container(
                    margin: const EdgeInsets.only(
                      right: 30,
                      left: 30,
                    ),
                    child: Form(
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
                          Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Dirección de correo",
                                hintStyle: const TextStyle(
                                    color: ColorsSelect.btnBackgroundBo3),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorsSelect.btnBackgroundBo3),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorsSelect.btnBackgroundBo3),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                            ),
                          ),
                          //FORM CONTRASEÑA
                          //TEXTO CONTRASEÑA
                          Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                              right: 10,
                              left: 10,
                            ),
                            //padding: const EdgeInsets.only(right: 7, left: 10),
                            //color: ColorsSelect.txtBoHe,
                            child: const Text.rich(
                              TextSpan(
                                text:
                                    "Ingrese su correo electronico registrado y le enviaremos un correo electronico que contiene un enlace para restablecer su contraseña",
                                style: TextStyle(
                                  color: ColorsSelect.btnBackgroundBo3,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          //BOTON CREAR CUENTA
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 370,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        //Navigator.of(context).pushNamed('/login');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          Text(
                            "Enviar Solicitud",
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
