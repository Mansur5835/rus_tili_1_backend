import 'dart:convert';
import 'package:rus_tili_1_back/constants/paths.dart';
import 'package:rus_tili_1_back/utils/file_utils.dart';
import '../models/user.dart';

class FileUtilsImp extends FileUtils {
  final Paths paths;

  FileUtilsImp(this.paths);

  @override
  Future<User> saveUser(User user) async {
    List<User> users = getUsers();
    user.id = users.length;
    users.add(user);

    List data = users.map((e) => e.toJson()).toList();

    paths.getFileDBPath().writeAsStringSync(jsonEncode(data));

    return user;
  }

  @override
  List<User> getUsers() {
    String? dataAsString = paths.getFileDBPath().readAsStringSync();

    if (dataAsString.isEmpty) {
      return [];
    }

    List dataAsList = jsonDecode(dataAsString);

    List<User> users = dataAsList.map((e) => User.fromJson(e)).toList();

    return users;
  }

  @override
  User? getUserById(int id) {
    List<User> users = getUsers();

    for (User user in users) {
      if (user.id == id) return user;
    }

    return null;
  }

  @override
  bool checkUser(User user) {
    List<User> users = getUsers();

    if (users.contains(user)) return true;

    return false;
  }

  @override
  bool deleteUser(int id) {
    List<User> users = getUsers();

    int oldLength = users.length;

    for (int i = 0; i < users.length; i++) {
      if (users[i].id == id) {
        users.removeAt(i);
        break;
      }
    }

    if (oldLength == users.length) return false;

    List data = users.map((e) => e.toJson()).toList();

    paths.getFileDBPath().writeAsStringSync(jsonEncode(data));

    return true;
  }
}
