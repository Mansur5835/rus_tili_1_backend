import 'package:jaguar/http/response/response.dart';

class AppResponse<T> {
  T? data;
  bool status;
  int statusCode;
  String? message;
  AppResponse(
      {required this.status, this.data, this.statusCode = 200, this.message});

  toJson() {
    return Response.json({
      "status": status,
      "message": message,
      "data": data,
    })
      ..statusCode = statusCode;
  }
}
