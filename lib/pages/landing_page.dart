import 'package:flutter/material.dart';
import 'package:mvp_all/models/mascota.dart';
import 'package:mvp_all/peticiones/auth.dart';
import 'package:mvp_all/peticiones/crud.dart';
import 'package:mvp_all/style/colors/colors_views.dart';

class Landing extends StatefulWidget {
  const Landing({Key key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  List<Mascota> mascota;
  static final crud = Crud();
  @override
  void initState() {
    crud.getMascotas(Auth.id);
    mascota = Crud.m;
    super.initState();
  }

  void _load() {
    crud.getMascotas(Auth.id);
    mascota = Crud.m;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bienvenido",
          //style: TextStyle(fontSize: 20),
        ),
        backgroundColor: ColorsSelect.txtBoHe,
        toolbarHeight: 60,
        leading: IconButton(
          icon: const Icon(Icons.logout, color: ColorsSelect.paginatorNext),
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
                              "Registro de tus mascotas",
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DataTable(
                        dividerThickness: 2,
                        dataRowHeight: 30,
                        headingRowHeight: 30,
                        sortColumnIndex: 0,
                        columns: const [
                          DataColumn(
                            label: Text('Nombre'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('Tipo'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('Fecha'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('Razon'),
                            numeric: false,
                          ),
                        ],
                        rows: mascota
                            .map(
                              (masc) => DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      masc.nombre,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      masc.tipo,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      masc.fecha,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      masc.razon,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 310,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('/add')
                            .then((value) => setState((() {
                                  _load();
                                })));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          Text(
                            "Nueva Mascota",
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
