import 'package:flutter/material.dart';
import 'package:rest_mozo_app/src/models/Comanda.dart';

class ComandaPage extends StatelessWidget {
  const ComandaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cmdId = ModalRoute.of(context).settings.arguments;
    
    return FutureBuilder(
      future: getComandaInfo(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());

        return _ComandaInfo(snapshot.data);
      },
    );
  }

  Future<Comanda> getComandaInfo() async{
    //TODO: Obtener la info de la comanda por medio de get
    return Comanda(
      cmdCod: 1,
      cmdHorEnt: '15:30 pm',
      cmdHorSal: '15:30 pm',
      cmdLle: false,
      cmdMesCod: 1,
      cmdUsuCod: 1,
    );
  }

}

class _ComandaInfo extends StatelessWidget {

  final Comanda comanda;

  _ComandaInfo(this.comanda);

  @override
  Widget build(BuildContext context) {

    const titleTextStyle = TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);
    const attrTextStyle = TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(title: Text('Comanda Nro. ${comanda.cmdCod}')),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.link),
                SizedBox(width: 5.0),
                (comanda.cmdLle) ? Text('Para llevar', style: titleTextStyle) : Text('Mesa ${comanda.cmdMesCod}', style: titleTextStyle)
              ]
            ),
            Row(children: [Text('Hora de ingreso: ', style: attrTextStyle), Text('${comanda.cmdHorEnt}')]),
            Row(children: [Text('Mozo: ', style: attrTextStyle), Text('${comanda.cmdUsuCod}')]),
            SizedBox(height: 20.0),
            Text('Detalles de la comanda', style: attrTextStyle),
            SizedBox(height: 5.0),
            Expanded(child: SingleChildScrollView(child: createTableDetails(context))),
          ]
        ),
      ),
    );
  }

  Widget createTableDetails(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: DataTable(
        columns: [
          DataColumn(
            label: Text('Producto')
          ),
          DataColumn(
            label: Text('Cnt')
          ),
          DataColumn(
            label: Text('Estado')
          ),
          DataColumn(
            label: Text('Opc')
          ),
        ],
        rows: createDataRows(30),
      ),
    );
  }

  List<DataRow> createDataRows(can){
    List<DataRow> items = new List();
    for(int i=0; i < can; i++){
      items.add(DataRow(
              cells: [
                DataCell(Text('Arroz con pollo')),
                DataCell(Text('2')),
                DataCell(Text('NO ENT')),
                DataCell(
                  IconButton(icon: Icon(Icons.more_vert), onPressed: (){})
                ),
              ]
            ));
    }

    return items;
  }
}