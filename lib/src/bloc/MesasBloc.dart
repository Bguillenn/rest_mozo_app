import 'dart:async';

//My imports
import 'package:rest_mozo_app/src/models/Mesa.dart';

final MESAS_LIBRES =  [
    Mesa(mesCap: 4, mesCod: 1, mesDis: true),
    Mesa(mesCap: 4, mesCod: 2, mesDis: true),
    Mesa(mesCap: 4, mesCod: 3, mesDis: true),
    Mesa(mesCap: 4, mesCod: 4, mesDis: true),
    Mesa(mesCap: 4, mesCod: 5, mesDis: true),
    Mesa(mesCap: 4, mesCod: 6, mesDis: true),
    Mesa(mesCap: 4, mesCod: 7, mesDis: true),
    Mesa(mesCap: 4, mesCod: 8, mesDis: true),
    Mesa(mesCap: 4, mesCod: 9, mesDis: true),
    Mesa(mesCap: 4, mesCod: 10, mesDis: true),
  ];
final MESAS_OCUPADAS = [
    Mesa(mesCap: 4, mesCod: 11, mesDis: false),
    Mesa(mesCap: 4, mesCod: 12, mesDis: false),
    Mesa(mesCap: 4, mesCod: 13, mesDis: false),
    Mesa(mesCap: 4, mesCod: 14, mesDis: false),
    Mesa(mesCap: 4, mesCod: 15, mesDis: false),
    Mesa(mesCap: 4, mesCod: 16, mesDis: false),
    Mesa(mesCap: 4, mesCod: 17, mesDis: false),
    Mesa(mesCap: 4, mesCod: 18, mesDis: false),
    Mesa(mesCap: 4, mesCod: 19, mesDis: false),
    Mesa(mesCap: 4, mesCod: 20, mesDis: false),
    Mesa(mesCap: 4, mesCod: 21, mesDis: false),
    Mesa(mesCap: 4, mesCod: 22, mesDis: false),
    Mesa(mesCap: 4, mesCod: 23, mesDis: false),
    Mesa(mesCap: 4, mesCod: 24, mesDis: false),
    Mesa(mesCap: 4, mesCod: 25, mesDis: false),
    Mesa(mesCap: 4, mesCod: 26, mesDis: false),
    Mesa(mesCap: 4, mesCod: 28, mesDis: false),
    Mesa(mesCap: 4, mesCod: 29, mesDis: false),
    Mesa(mesCap: 4, mesCod: 30, mesDis: false),
    Mesa(mesCap: 4, mesCod: 31, mesDis: false),
    Mesa(mesCap: 4, mesCod: 32, mesDis: false),
  ];

class MesasBloc{

  Stream<List<Mesa>> get mesasLibresStream async*{
    final List<Mesa> mesasLibres = [];

    for (Mesa mesa in MESAS_LIBRES){
    //  await Future.delayed(Duration(milliseconds: 300));
      mesasLibres.add(mesa);
      yield mesasLibres;
    }
  }

  Stream<List<Mesa>> get mesasOcupadasStream async* {
    final List<Mesa> mesasOcupadas = [];

    for(Mesa mesa in MESAS_OCUPADAS){
      //await Future.delayed(Duration(milliseconds: 300));
      mesasOcupadas.add(mesa);
      yield mesasOcupadas;
    }
  }



}