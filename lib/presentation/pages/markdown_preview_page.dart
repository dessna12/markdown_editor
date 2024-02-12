import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_editor/blocs/file_cubit.dart';

class MarkdownPreviewPage extends StatelessWidget {
  const MarkdownPreviewPage({super.key});
  static const name = 'markdown-preview';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Preview',
            style: TextStyle(color: Colors.white)
            ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<FileCubit, FileState>(
            builder: (context, state) {
              if (state is FileStateLoaded) {
                return MarkdownBody(data: state.file.content ?? '');
              }

              return const Center(
                child: Text('Cannot Read File'),
              );
            },
          ),
        ),
      );
}
