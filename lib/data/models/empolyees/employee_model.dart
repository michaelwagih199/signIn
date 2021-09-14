import 'package:flutter/material.dart';
import 'package:hr/data/entities/employe_entity.dart';

import 'department_model.dart';
import 'location_model.dart';

@immutable
class EmployeModel {
  final String id;
  final String password;
  final String userName;
  final LocationModel location;
  final String employeAge;
  final String employeeName;
  final DepartmentModel department;

  EmployeModel(
      {required this.id,
      required this.password,
      required this.userName,
      required this.location,
      required this.employeAge,
      required this.employeeName,
      required this.department});

  EmployeModel copyWithout({
    required String id,
    required String password,
    required String userName,
    required LocationModel location,
    required String employeAge,
    required String employeeName,
    required DepartmentModel department,
  }) {
    return EmployeModel(
      id: id,
      department: department,
      employeAge: employeAge,
      employeeName: employeeName,
      location: location,
      password: password,
      userName: userName,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          password == other.password &&
          userName == other.userName &&
          location == other.location &&
          employeAge == other.employeAge &&
          employeeName == other.employeeName &&
          department == other.department;

  @override
  int get hashCode =>
      id.hashCode ^
      password.hashCode ^
      userName.hashCode ^
      location.hashCode ^
      employeAge.hashCode ^
      employeeName.hashCode ^
      department.hashCode;

  @override
  String toString() {
    return 'EmployeModel{id: $id, password: $password, userName: $userName, location: $location, employeAge: $employeAge, employeeName: $employeeName, department: $department}';
  }

  static EmployeModel fromEntity(EmployeEntity entity) {
    return EmployeModel(
        id: entity.id,
        password: entity.password,
        userName: entity.userName,
        location: entity.location,
        employeAge: entity.employeAge,
        employeeName: entity.employeeName,
        department: entity.department);
  }
}
