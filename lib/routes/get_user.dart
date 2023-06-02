import 'package:jaguar/jaguar.dart';
import 'package:rus_tili_1_back/constants/apis.dart';
import 'package:rus_tili_1_back/constants/enums.dart';
import 'package:rus_tili_1_back/domen/api_req.dart';
import 'package:rus_tili_1_back/utils/file_utils.dart';

class GetUserRoute {
  final AppServer server;

  final FileUtils fileUtils;

  GetUserRoute(this.server, this.fileUtils) {
    _init();
  }

  _init() async {
    server(
      Apis.getUser,
      Method.get,
      req: (ctx) {
        return Response.json({"data": fileUtils.getUsers()});
      },
      onError: (e) {},
    );
  }
}
