class FileModel {
  final String? content;
  final String? path;

  FileModel({
    required this.content,
    required this.path,
  });

  FileModel copyWith({String? content, String? path}) {
    return FileModel(
      content: content ?? this.content,
      path: path ?? this.path,
    );
  }
}
