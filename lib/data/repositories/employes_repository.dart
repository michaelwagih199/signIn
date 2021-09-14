
import 'package:hr/data/models/empolyees/employee_model.dart';

abstract class EmployesRepository {

  bool isUser(String username, String password);
  Stream<List<EmployeModel>> employees();

}
