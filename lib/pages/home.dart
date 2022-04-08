import 'package:flutter/material.dart';
import 'package:mvp_all/style/colors/colors_views.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //padding: const EdgeInsets.only(left: 24, right: 24),
        child: Container(
          color: Colors.white,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: <Widget>[
                //Expanded(child: child)
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  height: 150,
                  child: Image.asset(
                    "assets/images/splash.png",
                    alignment: Alignment.center,
                    height: 120,
                  ),
                ),
                const SizedBox(height: 60),
                btnGoogle(),
                const SizedBox(height: 28),
                btnFacebook(),
                const SizedBox(height: 28),
                btnEmail(),
                const SizedBox(height: 50),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Entrar como invitado",
                    style: TextStyle(
                      color: ColorsSelect.paginatorNext,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  //child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //children: const <Widget>[
                  child: const Text(
                    "Entrar como vendedor",
                    style: TextStyle(
                      color: Color(0xff76aa75),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //],
                  // ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Row(
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
                          child: const Text("Iniciar Sesión",
                              style: TextStyle(
                                  color: ColorsSelect.paginatorNext,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget btnGoogle() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Icon(
              Icons.g_mobiledata,
              size: 40,
            ),
            Text("Continuar con Google"),
          ],
        ),
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(300, 48),
            primary: const Color(0xff3169f5),
            textStyle: const TextStyle(fontSize: 17),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
      );
    });
  }

  Widget btnFacebook() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Icon(
              Icons.facebook,
              size: 30,
            ),
            Text("Continuar con Facebook"),
          ],
        ),
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(300, 48),
            primary: const Color(0xff324fa5),
            textStyle: const TextStyle(fontSize: 17),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
      );
    });
  }

  Widget btnEmail() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/registro');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Icon(
              Icons.mail,
              size: 30,
            ),
            Text("Registrarse con E-Mail"),
          ],
        ),
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(300, 48),
            onPrimary: const Color(0xff64686f),
            primary: const Color(0xf1ffffff),
            //primary: const Color.fromRGBO(200, 200, 200, 0),
            textStyle: const TextStyle(fontSize: 17),
            side: const BorderSide(
              color: Color(0xff64686f),
            ),
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
      );
    });
  }
}
