import 'package:flutter/material.dart';
import 'package:rest_mozo_app/src/pages/entregas_page.dart';
import 'package:rest_mozo_app/src/pages/mesas_lib_page.dart';
import 'package:rest_mozo_app/src/pages/mesas_ocu_page.dart';

import 'comandas_activas_page.dart';

class MesasPage extends StatelessWidget {
  const MesasPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: createDrawer(context),
        appBar: createAppBar(),
        body: TabBarView(
          children: [
            //TODO: Crear archivos independientes para cada vista
            MesasOcupadasPage(),
            MesasLibresPage(),
            ComandasActivasPage(),
            EntregasPage(),
          ]
        ),
        floatingActionButton: createFloatingActionButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }


  Widget createFloatingActionButton(BuildContext context){
    var fb =  FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, 'nueva_comanda'),
      child: Icon(Icons.add),
      backgroundColor:Color.fromRGBO(0,93,255,1.0),
    );

    return Container(
      height: 70.0,
      width: 70.0,
      child: FittedBox(
        child: fb,
      )
    );
  }

  Widget createAppBar() {
    return AppBar(
          title: Text('Sistema de mozos'),
         // backgroundColor: Color.fromRGBO(0,93,255,1.0),
          bottom: TabBar(
            isScrollable: true,
            indicatorWeight: 5.0,
            tabs: [
              Tab(text: 'M. OCUPADAS'),
              Tab(text: 'M. LIBRES'),
              Tab(text: 'COMANDAS'),
              Tab(text: 'ENTREGAS'),
            ]
          )
        );
  }

  Widget createDrawer(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          createDrawerHeader(),
          ListTile(
            title: Text('Menú del dia'),
            leading: Icon(Icons.menu_book),
            onTap: () {
              //TODO: Redireccionar a configuracion del perfil
              Navigator.pushNamed(context, 'menu');
            },
          ),
          ListTile(
            title: Text('Configurar mi perfil'),
            leading: Icon(Icons.person),
            onTap: () {
              //TODO: Redireccionar a configuracion del perfil
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Cerrar Sesión', style: TextStyle(color: Colors.white)),
            leading: Icon(Icons.exit_to_app, color: Colors.white,),
            tileColor: Color.fromRGBO(255,81,81,1.0),
            onTap: () {
              //TODO: Redireccionar a configuracion del perfil
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ]
      ),
    );
  }

  Widget createDrawerHeader(){
    const txtNameStyle = TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white);

    return DrawerHeader(
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      width: 120.0,
                      height: 120.0,
                      placeholder: 'assets/load-image.gif',
                      image: 'https://s3.amazonaws.com/arc-authors/washpost/e8d90017-3451-40a4-a668-901221acbb76.png',
                    ),

                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Brayan Fernando', 
                      style: txtNameStyle, textAlign: TextAlign.left, overflow: TextOverflow.ellipsis),
                      Text('Guillen Nakagawa', 
                      style: txtNameStyle, textAlign: TextAlign.left, overflow: TextOverflow.ellipsis),
                      Text('Mozo', style: TextStyle(fontSize: 14.0, color: Colors.white), textAlign: TextAlign.left)
                    ]
                  ),
                ]
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(0,93,255,1.0)
            ),
          );
  }
}