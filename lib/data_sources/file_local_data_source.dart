import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:markdown_editor/models/file_model.dart';

abstract class FileLocalDataSource {
  static Future<FileModel> loadFile() async {
    final result = await FilePicker.platform.pickFiles(
      // allowedExtensions: ['md'],
      // allowMultiple: false,
    );

    if (result == null || result.files.isEmpty) {
      throw FlutterError('No file selected');
    }

    final firstFilePath = result.files.first.path;
    if (firstFilePath == null) {
      throw FlutterError('Cannot get file path');
    }

    if (!firstFilePath.endsWith('.md')) {
      throw FlutterError('Please select md file');
    }

    return FileModel(
      content: File(firstFilePath).readAsStringSync(),
      path: firstFilePath,
    );
  }

  static Future<void> saveFile(
    FileModel file,
  ) async {
    if (file.path != null) {
      final newFile = File(file.path!);
      await newFile.writeAsString(file.content ?? '');
    }
  }
}
