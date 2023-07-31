import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class FileData {
  final String localPath;

  final Uint8List bytes;

  FileData(this.bytes, this.localPath);
}

abstract class ElevenLabsFileIsolate {
  static Future<String> localPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<String?> saveFile(FileData data) async {
    int numberTry = 0;

    try {
      final name = const Uuid().v4();
      final path = '${data.localPath}/$name.mp3';

      do {
        final result = await _writeBytes(data.bytes, path);
        if (result != null) {
          return result;
        }

        numberTry++;
      } while (numberTry < 3);

      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<String?> _writeBytes(Uint8List bytes, String path) async {
    try {
      final newFile = File(path);
      await newFile.parent.create(recursive: true);
      await newFile.writeAsBytes(bytes);

      return newFile.path;
    } catch (e) {
      return null;
    }
  }
}
