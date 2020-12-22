import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:rest_mozo_app/src/bloc/MesasBloc.dart';
import 'package:rest_mozo_app/src/models/Mesa.dart';

class MesasLibresPage extends StatelessWidget {
  final mesasBloc = new MesasBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(238,238,238, 1.0)),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mesas libres actualmente en el sistema', style: TextStyle(fontSize: 14.0)),
          Text('30/50', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
          SizedBox(height: 10.0),
          Expanded(
            child: StreamBuilder(
                stream: mesasBloc.mesasLibresStream ,
                builder: (BuildContext context, AsyncSnapshot<List<Mesa>> snapshot){
                  final mesasLibres = snapshot.data ?? [];

                  return createGridView(context, mesasLibres);

                },
              ),
            ),
        ]
      ),
    );
  }

  
Widget createGridView(BuildContext context, List<Mesa> mesas){
    
    return GridView.builder(
      itemCount: mesas.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
        ),
      itemBuilder: (BuildContext context, int index) {
        return BounceInDown(
         // delay: Duration(milliseconds: 100),
          child: createGridCard(context, mesas[index])
        );
      },
    );
}

  Widget createGridCard(index, Mesa mesa) {
    return RaisedButton(
      onPressed: (){ print('Create comanda' );},
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.tab, color: Color.fromRGBO(255,255,255,0.2), size: 80.0),
          Text('MESA ${mesa.mesCod}', style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        ],
      ),
      color: Color.fromRGBO(28,255,120,1.0),
    );
  }
}