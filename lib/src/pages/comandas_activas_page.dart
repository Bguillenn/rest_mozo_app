import 'package:flutter/material.dart';

class ComandasActivasPage extends StatelessWidget {
  const ComandasActivasPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(238,238,238, 1.0)),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Comandas activas', style: TextStyle(fontSize: 14.0)),
          Text('Todas las comandas activas actualmente', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
          Divider(),
          
        ]
      ),
    );
  }
}