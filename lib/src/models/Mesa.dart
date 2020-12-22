// To parse this JSON data, do
//
//     final mesa = mesaFromJson(jsonString);

import 'dart:convert';

Mesa mesaFromJson(String str) => Mesa.fromJson(json.decode(str));

String mesaToJson(Mesa data) => json.encode(data.toJson());

class Mesa {
    Mesa({
        this.mesCod,
        this.mesCap,
        this.mesDis,
    });

    int mesCod;
    int mesCap;
    bool mesDis;

    factory Mesa.fromJson(Map<String, dynamic> json) => Mesa(
        mesCod: json["MesCod"],
        mesCap: json["MesCap"],
        mesDis: json["MesDis"],
    );

    Map<String, dynamic> toJson() => {
        "MesCod": mesCod,
        "MesCap": mesCap,
        "MesDis": mesDis,
    };
}
