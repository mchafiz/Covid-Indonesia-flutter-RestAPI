// To parse this JSON data, do
//
//     final Covid = CovidFromJson(jsonString);

import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

RxList<Covid> covidFromJson(String str) =>
    RxList<Covid>.from(json.decode(str).map((x) => Covid.fromJson(x)));

String covidToJson(RxList<Covid> data) =>
    json.encode(RxList<dynamic>.from(data.map((x) => x.toJson())));

class Covid {
  String name;
  String positif;
  String sembuh;
  String meninggal;
  Covid({
    this.name = '',
    this.positif = '',
    this.sembuh = '',
    this.meninggal = '',
  });

  factory Covid.fromJson(Map<String, dynamic> json) => Covid(
        name: json["name"],
        positif: json["positif"],
        sembuh: json["sembuh"],
        meninggal: json["meninggal"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "positif": positif,
        "sembuh": sembuh,
        "meninggal": meninggal,
      };
}
