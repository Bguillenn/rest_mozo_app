import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menú del dia')),
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(238,238,238, 1.0)),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Menu del dia', style: TextStyle(fontSize: 14.0)),
            Text('Entradas', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
            Divider(),
            
          ]
        ),
      ),
    );
  }
}