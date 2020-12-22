import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:rest_mozo_app/src/bloc/MesasBloc.dart';
import 'package:rest_mozo_app/src/models/Mesa.dart';

class MesasOcupadasPage extends StatelessWidget {

  final mesasBloc = new MesasBloc();


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(238,238,238, 1.0)),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mesas ocupadas actualmente en el sistema', style: TextStyle(fontSize: 14.0)),
          Text('20/50', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
          SizedBox(height: 10.0),
          Expanded(
            child: StreamBuilder(
              stream: mesasBloc.mesasOcupadasStream ,
              builder: (BuildContext context, AsyncSnapshot<List<Mesa>> snapshot){
                final mesasOcupadas = snapshot.data ?? [];

                return createGridView(context, mesasOcupadas);

              },
            ),
          ),         
        ]
      ),
    );
  }

  //TODO: Make reactive
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

  Widget createGridCard(context, Mesa mesa) {
    return RaisedButton(
      onPressed: (){
        Navigator.pushNamed(context, 'comanda', arguments: 1);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.tab, color: Color.fromRGBO(255,255,255,0.2), size: 80.0),
          Text('MESA ${mesa.mesCod}', style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        ],
      ),
      color: Color.fromRGBO(225,179,28,1.0),
    );
  }
}