import 'package:flutter/material.dart';
import 'package:hr/data/entities/location_entity.dart';

@immutable
class LocationModel {
  final String id;
  final String LATITUDE;
  final String LONGITUDE;
  final String locationName;
  final String locationUrl;

  LocationModel(
      {required this.id,
      required this.LATITUDE,
      required this.LONGITUDE,
      required this.locationName,
      required this.locationUrl});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          LATITUDE == other.LATITUDE &&
          LONGITUDE == other.LONGITUDE &&
          locationName == other.locationName &&
          locationUrl == other.locationUrl;

  @override
  int get hashCode =>
      id.hashCode ^
      LATITUDE.hashCode ^
      LONGITUDE.hashCode ^
      locationName.hashCode ^
      locationUrl.hashCode;

  @override
  String toString() {
    return 'LocationModel{id: $id, LATITUDE: $LATITUDE, LONGITUDE: $LONGITUDE, locationName: $locationName, locationUrl: $locationUrl}';
  }

  LocationModel copyWith(
      {required String id,
      required String LATITUDE,
      required String LONGITUDE,
      required String locationName,
      required String locationUrl}) {
    return new LocationModel(
        id: id,
        LATITUDE: LATITUDE,
        LONGITUDE: LONGITUDE,
        locationName: locationName,
        locationUrl: locationUrl);
  }

  LocationEntity toEntity() {
    return new LocationEntity(
        id, LATITUDE, LONGITUDE, locationName, locationUrl);
  }

  static LocationModel fromEntity(LocationEntity entity) {
    return LocationModel(
        id: entity.id,
        LATITUDE: entity.LATITUDE,
        LONGITUDE: entity.LONGITUDE,
        locationName: entity.locationName,
        locationUrl: entity.locationUrl);
  }
}
