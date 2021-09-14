import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr/data/models/empolyees/department_model.dart';
import 'package:hr/data/models/empolyees/location_model.dart';

class EmployeEntity {

  final String id;
  final String password;
  final String userName;
  final LocationModel location;
  final String employeAge;
  final String employeeName;
  final DepartmentModel department;

  EmployeEntity(this.id, this.password, this.userName, this.location,
      this.employeAge, this.employeeName, this.department);

  Map<String, Object> toJson() {
    return {
      "id": id,
      "password": password,
      "userName": userName,
      "location": location,
      "employeAge": employeAge,
      "employeeName": employeeName,
      "department": department
    };
  }

  @override
  String toString() {
    return 'EmployyeEntity{id: $id, password: $password, userName: $userName, location: $location, employeAge: $employeAge, employeeName: $employeeName, department: $department}';
  }

  static EmployeEntity fromJson(Map<String, Object> json) {
    return EmployeEntity(
      json['id'] as String,
      json['password'] as String,
      json['userName'] as String,
      json['location'] as LocationModel,
      json['employeAge'] as String,
      json['employeeName'] as String,
      json['department'] as DepartmentModel,
    );
  }

  static EmployeEntity fromSnapshot(DocumentSnapshot snap) {
    return EmployeEntity(
      snap.id ,
      snap['password'] ,
      snap['userName'] ,
      snap['location'] ,
      snap['employeAge'] ,
      snap['employeeName'] ,
      snap['department'] ,
    );
  }

  Map<String, Object> toDocument() {
    return {
      "id": id,
      "password": password,
      "userName": userName,
      "location": location,
      "employeAge": employeAge,
      "employeeName": employeeName,
      "department": department
    };
  }

}
