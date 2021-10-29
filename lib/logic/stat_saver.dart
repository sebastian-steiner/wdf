import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:wdf/logic/statistics.dart';

class StatSaver {
  Future<String> get _localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> _localFile(String filename) async {
    final path = await _localPath;
    return File('$path/$filename');
  }

  Future<File> _writeString(String filename, String contents) async {
    final file = await _localFile(filename);
    print(await file.readAsString());
    return file.writeAsString(contents, mode: FileMode.append, flush: true);
  }

  Future<void> saveStats(String filename, Statistics stats) async {
    _writeString(filename, stats.toJson().toString());
  }
}