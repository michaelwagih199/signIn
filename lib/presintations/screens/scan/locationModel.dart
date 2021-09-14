// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

BarcodModel barcodeModelFromJson(String str) => BarcodModel.fromJson(json.decode(str));

String welcomeToJson(BarcodModel data) => json.encode(data.toJson());

class BarcodModel {
    BarcodModel({
        required this.latitude,
        required this.longitude,
    });

    String latitude;
    String longitude;

    factory BarcodModel.fromJson(Map<String, dynamic> json) => BarcodModel(
        latitude: json["LATITUDE"],
        longitude: json["LONGITUDE"],
    );

    Map<String, dynamic> toJson() => {
        "LATITUDE": latitude,
        "LONGITUDE": longitude,
    };
}
