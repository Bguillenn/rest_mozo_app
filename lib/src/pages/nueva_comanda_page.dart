import 'package:flutter/material.dart';

class NuevaComandaPage extends StatelessWidget {
  const NuevaComandaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Seleccione una mesa', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Text('Selecciona una mesa para asignarla a la comanda', style: TextStyle(fontSize: 14.0)),
              SizedBox(height: 10.0),
              Text('Si es para llevar selecciona esta opcion', style: TextStyle(fontSize: 14.0)),
              createButtonLlevar(context),
              SizedBox(height: 10.0),
              Expanded(
                child: FutureBuilder(
                  future: createGridView(context),
                  builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting)
                      return Center(child: CircularProgressIndicator());
                    else
                      return snapshot.data;
                  },
                ),
              ),
            ]
          ),
        )
      ),
    );
  }

  Widget createAppBar(){
    return AppBar(
      title: Text('Nueva Comanda'),
    );
  }

  Widget createButtonLlevar(BuildContext context){
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Color.fromRGBO(0,93,255,1.0),
        highlightColor: Color.fromRGBO(0,93,255,.5),
        textColor: Colors.white,
        onPressed: (){},
        child: Text('PARA LLEVAR'),
      ),
    );
  }

    //TODO: Make reactive
  Future<Widget> createGridView(BuildContext context) async{
    return GridView.count(
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      crossAxisCount: 3,
      //TODO: Obtener desde sockets las mesas libres y ocupadas
      children: List.generate(21, (index) { return createGridCard(index);})
    );
  }

   Widget createGridCard(index) {
    return RaisedButton(
      onPressed: (){ print('CLICK MESA $index'); },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.tab, color: Color.fromRGBO(255,255,255,0.2), size: 80.0),
          Text('MESA $index', style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        ],
      ),
      color: Color.fromRGBO(28,255,120,1.0),
    );
  }
}