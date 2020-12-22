import 'dart:convert';

Comanda comandaFromJson(String str) => Comanda.fromJson(json.decode(str));

String comandaToJson(Comanda data) => json.encode(data.toJson());

class Comanda {
    Comanda({
        this.cmdCod,
        this.cmdHorEnt,
        this.cmdHorSal,
        this.cmdUsuCod,
        this.cmdMesCod,
        this.cmdLle,
    });

    int cmdCod;
    String cmdHorEnt;
    String cmdHorSal;
    int cmdUsuCod;
    int cmdMesCod;
    bool cmdLle;


    factory Comanda.fromJson(Map<String, dynamic> json) => Comanda(
        cmdCod: json["CmdCod"],
        cmdHorEnt: json["CmdHorEnt"],
        cmdHorSal: json["CmdHorSal"],
        cmdUsuCod: json["CmdUsuCod"],
        cmdMesCod: json["CmdMesCod"],
        cmdLle: json["CmdLle"],
    );

    Map<String, dynamic> toJson() => {
        "CmdCod": cmdCod,
        "CmdHorEnt": cmdHorEnt,
        "CmdHorSal": cmdHorSal,
        "CmdUsuCod": cmdUsuCod,
        "CmdMesCod": cmdMesCod,
        "CmdLle": cmdLle,
    };
}