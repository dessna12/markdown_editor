import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markdown_editor/blocs/file_cubit.dart';

class Editor extends StatefulWidget {
  const Editor({
    required this.initialContent,
    super.key,
  });

  final String initialContent;

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.text = widget.initialContent;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      decoration: const InputDecoration(border: InputBorder.none),
      maxLines: null,
      expands: true,
      onChanged: (newValue) {
        context.read<FileCubit>().updateContent(newValue);
      },
    );
  }
}