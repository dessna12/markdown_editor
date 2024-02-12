import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markdown_editor/models/file_model.dart';
import 'package:markdown_editor/services/file_service.dart';

final class FileCubit extends Cubit<FileState> {
  FileCubit() : super(FileStateInitial());

  FileModel? _currentFile;

  Future<void> loadFile() async {
    emit(FileStateLoading());
    try {
      final file = await FileService.loadFile();
      _currentFile = file;
      emit(FileStateLoaded(file: file));
    } catch (e) {
      emit(FileStateError(message: e.toString()));
    }
  }

  Future<void> saveFile() async {
    if (_currentFile != null) {
      FileService.saveFile(_currentFile!);
    }
  }

  Future<void> updateContent(String newContent) async {
    _currentFile = _currentFile?.copyWith(content: newContent);
    if (_currentFile != null) {
      emit(FileStateLoaded(file: _currentFile!));
    }
  }
}

abstract class FileState {}

class FileStateInitial extends FileState {}

class FileStateLoading extends FileState {}

class FileStateLoaded extends FileState {
  final FileModel file;
  FileStateLoaded({
    required this.file,
  });
}

class FileStateError extends FileState {
  final String message;

  FileStateError({required this.message});
}
