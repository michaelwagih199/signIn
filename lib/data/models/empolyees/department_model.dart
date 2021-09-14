import 'package:flutter/material.dart';
import 'package:hr/data/entities/department_entity.dart';

@immutable
class DepartmentModel {
  final String id;
  final String departmentName;

  DepartmentModel({required this.id, required this.departmentName});

  @override
  String toString() {
    return 'DepartmentModel{id: $id, departmentName: $departmentName}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DepartmentModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          departmentName == other.departmentName;

  @override
  int get hashCode => id.hashCode ^ departmentName.hashCode;

  DepartmentModel copyWith(
      {required String id, required String departmentName}) {
    return DepartmentModel(id: id, departmentName: departmentName);
  }

  DepartmentEntity toEntity() {
    return DepartmentEntity(id, departmentName);
  }

  static DepartmentModel fromEntity(DepartmentEntity entity) {
    return DepartmentModel(
        id: entity.id, departmentName: entity.departmentName);
  }
}
