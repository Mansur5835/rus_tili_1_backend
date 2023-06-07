import 'package:jaguar/jaguar.dart';
import 'package:rus_tili_1_back/constants/apis.dart';
import 'package:rus_tili_1_back/constants/enums.dart';
import 'package:rus_tili_1_back/domen/api_req.dart';
import 'package:rus_tili_1_back/utils/file_utils.dart';

import '../models/app_response.dart';
import '../models/user.dart';

class CoreRouter {
  final AppServer server;

  final FileUtils fileUtils;

  CoreRouter(this.server, this.fileUtils) {
    _init();
  }

  _init() async {
    getUsers();
    getUser();
    saveUser();
    deleteUser();
  }

  getUsers() async {
    server(
      Apis.getUsers,
      Method.get,
      req: (ctx) {
        return AppResponse(
          status: true,
          data: fileUtils.getUsers(),
        ).toJson();
      },
      onError: (e) {
        return AppResponse(
          status: false,
          data: null,
        ).toJson();
      },
    );
  }

  getUser() async {
    server(
      Apis.getUser,
      Method.get,
      req: (ctx) {
        int? id = ctx.pathParams.getInt("id");

        if (id == null) {
          return AppResponse(status: false, data: null, message: "id not found")
              .toJson();
        }

        User? user = fileUtils.getUserById(id);

        if (user == null) {
          return AppResponse(
                  status: false, data: null, message: "user not found")
              .toJson();
        }

        return AppResponse(status: true, data: user.toJson()).toJson();
      },
      onError: (e) {
        return AppResponse(
          status: false,
          data: null,
        ).toJson();
      },
    );
  }

  saveUser() async {
    server(
      Apis.saveUser,
      Method.post,
      req: (ctx) async {
        Map<String, dynamic>? data = await ctx.bodyAsJson();

        if (data == null) {
          return AppResponse(
            status: false,
            message: "user not found",
            data: null,
          ).toJson();
        }

        User user = User.fromJson(data);

        final savedUser = await fileUtils.saveUser(user);

        return AppResponse(status: true, data: savedUser.toJson()).toJson();
      },
      onError: (e) {
        return AppResponse(
          status: false,
          data: null,
        ).toJson();
      },
    );
  }

  deleteUser() async {
    server(
      Apis.deleteUser,
      Method.delete,
      req: (ctx) async {
        int? id = ctx.pathParams.getInt("id");
        if (id == null) {
          return AppResponse(
            status: false,
            message: "id",
          ).toJson();
        }

        final isSucces = fileUtils.deleteUser(id);

        if (isSucces) {
          return AppResponse(status: true, data: true).toJson();
        }

        return AppResponse(status: false, data: false).toJson();
      },
      onError: (e) {
        return AppResponse(
          status: false,
          data: null,
        ).toJson();
      },
    );
  }
}
