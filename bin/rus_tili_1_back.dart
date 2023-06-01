import 'dart:io';

import 'package:jaguar/jaguar.dart';

void main(List<String> arguments) async {
  // final server = Jaguar(); // Serves the API at localhost:8080 by default

  // server.post('/sign-up', (Context ctx) async {
  //   print(await ctx.bodyAsJson());
  //   return await ctx.bodyAsJson();
  // });

  // server.serve().then((value) {
  //   print("server has connacted ==> localhost:8080");
  // });

  Directory directory = Directory.current;
  File file = File(directory.path + '/file_db/users');

  print(file.readAsStringSync());
}
