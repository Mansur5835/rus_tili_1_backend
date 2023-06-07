import 'package:rus_tili_1_back/models/user.dart';

abstract class FileUtils {
  Future<User> saveUser(User user);

  List<User> getUsers();

  User? getUserById(int id);

  bool checkUser(User user);

  bool deleteUser(int id);
}
