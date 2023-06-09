import 'dart:io';

import 'package:jaguar/jaguar.dart';
import 'package:rus_tili_1_back/constants/paths.dart';
import 'package:rus_tili_1_back/di/get_it.dart';
import 'package:rus_tili_1_back/domen/api_req.dart';
import 'package:rus_tili_1_back/routes/core_router.dart.dart';
import 'package:rus_tili_1_back/utils/file_utils.i.dart';

final getIt = GetIt.instance;

abstract class DI {
  static init() async {
    final server = Jaguar(
        address: "0.0.0.0",
        port: int.parse(Platform.environment["PORT"] ?? "8080"));
    getIt.singelton(server);
    getIt.singelton(Directory.current);

    getIt.singelton(Paths(getIt.get()));

    getIt.singelton(FileUtilsImp(getIt.get()));

    getIt.singelton(AppServer(getIt.get()));

    getIt.singelton(CoreRouter(getIt.get(), getIt.get()));

    server.serve().then((value) {});
  }
}
