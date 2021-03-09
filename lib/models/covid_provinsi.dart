// To parse this JSON data, do
//
//     final covidProvinsi = covidProvinsiFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

RxList<CovidProvinsi> covidProvinsiFromJson(String str) =>
    RxList<CovidProvinsi>.from(
        json.decode(str).map((x) => CovidProvinsi.fromJson(x)));

String covidProvinsiToJson(RxList<CovidProvinsi> data) =>
    json.encode(RxList<dynamic>.from(data.map((x) => x.toJson())));

class CovidProvinsi {
  Attributes attributes;
  CovidProvinsi({
    required this.attributes,
  });

  factory CovidProvinsi.fromJson(Map<String, dynamic> json) => CovidProvinsi(
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  Attributes({
    this.fid = 0,
    this.kodeProvi = 0,
    this.provinsi = '',
    this.kasusPosi = 0,
    this.kasusSemb = 0,
    this.kasusMeni = 0,
  });

  int fid;
  int kodeProvi;
  String provinsi;
  int kasusPosi;
  int kasusSemb;
  int kasusMeni;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        fid: json["FID"],
        kodeProvi: json["Kode_Provi"],
        provinsi: json["Provinsi"],
        kasusPosi: json["Kasus_Posi"],
        kasusSemb: json["Kasus_Semb"],
        kasusMeni: json["Kasus_Meni"],
      );

  Map<String, dynamic> toJson() => {
        "FID": fid,
        "Kode_Provi": kodeProvi,
        "Provinsi": provinsi,
        "Kasus_Posi": kasusPosi,
        "Kasus_Semb": kasusSemb,
        "Kasus_Meni": kasusMeni,
      };
}
