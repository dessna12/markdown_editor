import 'package:markdown_editor/data_sources/file_local_data_source.dart';
import 'package:markdown_editor/models/file_model.dart';

abstract class FileService {
  static Future<FileModel> loadFile() => FileLocalDataSource.loadFile();

  static Future<void> saveFile(FileModel file) =>
      FileLocalDataSource.saveFile(file);
}
