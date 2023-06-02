import 'package:jaguar/jaguar.dart';
import 'package:rus_tili_1_back/constants/enums.dart';

class AppServer<T> {
  Jaguar server;

  AppServer(this.server);

  Future<void> call(
    String path,
    Method method, {
    required Function(Context ctx) req,
    Function(dynamic e)? onError,
  }) async {
    print(path);
    try {
      switch (method) {
        case Method.post:
          server.post(path, req);
          break;

        case Method.get:
          server.get(path, req);
          break;

        case Method.delete:
          server.delete(path, req);
          break;

        case Method.put:
          server.put(path, req);
          break;
      }
    } catch (e) {
      onError?.call(e);
    }
  }
}
