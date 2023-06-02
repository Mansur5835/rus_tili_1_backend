import 'dart:io';

class Paths {
  final Directory directory;

  Paths(this.directory);

  File getFileDBPath() {
    return File('${directory.path}/file_db/users');
  }
}
