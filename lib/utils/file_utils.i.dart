import 'dart:convert';
import 'package:rus_tili_1_back/constants/paths.dart';
import 'package:rus_tili_1_back/utils/file_utils.dart';
import '../models/user.dart';

class FileUtilsImp extends FileUtils {
  final Paths paths;

  FileUtilsImp(this.paths);

  Future<User> saveUser(User user) async {
    List<User> users = getUsers();
    user.id = users.length;
    users.add(user);

    List data = users.map((e) => e.toJson()).toList();

    paths.getFileDBPath().writeAsStringSync(jsonEncode(data));

    return user;
  }

  List<User> getUsers() {
    String? dataAsString = paths.getFileDBPath().readAsStringSync();

    if (dataAsString.isEmpty) {
      return [];
    }

    List dataAsList = jsonDecode(dataAsString);

    List<User> users = dataAsList.map((e) => User.fromJson(e)).toList();

    return users;
  }
}
