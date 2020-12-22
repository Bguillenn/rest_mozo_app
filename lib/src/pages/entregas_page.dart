import 'package:flutter/material.dart';

class EntregasPage extends StatelessWidget {
  const EntregasPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(238,238,238, 1.0)),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Entrega de pedidos', style: TextStyle(fontSize: 14.0)),
          Text('Pedidos listos para recoger de cocina', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
          Divider(),
          
        ]
      ),
    );
  }
}