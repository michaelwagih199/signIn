import 'package:cloud_firestore/cloud_firestore.dart';

class DepartmentEntity {

  String id;
  String departmentName;

  DepartmentEntity( this.id,  this.departmentName);

  static DepartmentEntity fromJson(Map<String, Object> json) {
    return DepartmentEntity(
      json['id'] as String,
      json['departmentName'] as String,
    );

  }

  Map<String, Object> toJson() {
    return {
      'departmentName': departmentName,
      'id': id,
    };
  }

  @override
  String toString() {
    return 'DepartmentEntity{id: $id, departmentName: $departmentName}';
  }

  static DepartmentEntity fromSnapshot(DocumentSnapshot snap) {
    return DepartmentEntity(
      snap['departmentName'],
      snap.id,
    );
  }


  Map<String, Object> toDocument() {
    return {
      'departmentName': departmentName,
      'id': id,
    };
  }


}