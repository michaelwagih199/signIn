import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr/data/entities/employe_entity.dart';
import 'package:hr/data/models/empolyees/employee_model.dart';
import 'package:hr/data/repositories/employes_repository.dart';

class EmployeesService extends EmployesRepository {

  CollectionReference collection =
      FirebaseFirestore.instance.collection('employees');

  @override
  bool isUser(String username, String password) {
    collection
        .where("userName", isEqualTo: username)
        .where("password", isEqualTo: password)
        .get()
        .then((value) {
          if (value.docs.isEmpty) print("valueFalse");
          else print("valueTrue");
      // value.docs.forEach((result) {
      //   print('result:---$result');
      // });
    });
    return false;
  }

  @override
  Stream<List<EmployeModel>> employees() {
    return collection.snapshots().map((snapshot) {
      return snapshot.docs
          .map(
              (doc) => EmployeModel.fromEntity(EmployeEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  void onPressed() {}
}
