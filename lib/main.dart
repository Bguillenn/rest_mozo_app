import 'package:flutter/material.dart';
import 'package:rest_mozo_app/src/pages/comanda_page.dart';

//Routes import
import 'package:rest_mozo_app/src/pages/login_page.dart';
import 'package:rest_mozo_app/src/pages/menu_page.dart';
import 'package:rest_mozo_app/src/pages/mesas_page.dart';
import 'package:rest_mozo_app/src/pages/nueva_comanda_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'mesas': (BuildContext context) => MesasPage(),
        'nueva_comanda': (BuildContext context) => NuevaComandaPage(),
        'comanda': (BuildContext context) => ComandaPage(),
        'menu' : (BuildContext context) => MenuPage(),
      },
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0,93,255,1.0)
      ),
    );
  }
}
