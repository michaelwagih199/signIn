import 'package:cloud_firestore/cloud_firestore.dart';

class LocationEntity {
  final String id;
  final String LATITUDE;
  final String LONGITUDE;
  final String locationName;
  final String locationUrl;

  LocationEntity(
       this.id,
       this.LATITUDE,
       this.LONGITUDE,
       this.locationName,
       this.locationUrl);


  Map<String,Object> toJson() {
    return{
      'id' : this.id,
      'LATITUDE' : this.LATITUDE,
      'LONGITUDE' : this.LONGITUDE,
      'locationUrl': this.locationUrl,
      'locationName': this.locationName,
    };
  }

  @override
  String toString() {
    return 'LocationEntity{id: $id, LATITUDE: $LATITUDE, LONGITUDE: $LONGITUDE, locationName: $locationName, locationUrl: $locationUrl}';
  }

  static LocationEntity fromJson(Map<String, Object> json) {
    return LocationEntity(
      json['id'] as String,
      json['LATITUDE'] as String,
      json['LONGITUDE'] as String,
      json['locationName'] as String,
      json['locationUrl'] as String,
    );
  }

  static LocationEntity fromSnapshot(DocumentSnapshot snap) {
    return LocationEntity(
      snap.id,
      snap['LATITUDE'],
      snap['LONGITUDE'],
      snap['locationName'] ,
      snap['locationUrl']
    );
  }

  Map<String, Object> toDocument() {
    return{
      "locationUrl": this.locationUrl,
      "locationName": this.locationName,
      "id": this.id,
      "LATITUDE": this.LATITUDE,
      "LONGITUDE": this.LONGITUDE,
    };
  }


}
