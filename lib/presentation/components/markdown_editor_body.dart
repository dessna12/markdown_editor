import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markdown_editor/blocs/file_cubit.dart';
import 'package:markdown_editor/presentation/components/editor.dart';
import 'package:markdown_editor/presentation/components/file_error_widget.dart';

class MarkdownEditorBody extends StatelessWidget {
  const MarkdownEditorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FileCubit, FileState>(
      builder: (context, state) {
        if (state is FileStateInitial) {
          return Center(
            child: ElevatedButton(
              onPressed: () async {
                context.read<FileCubit>().loadFile();
              },
              child: const Text('Get file'),
            ),
          );
        }

        if (state is FileStateError) {
          return FileErrorWidget(
            message: state.message,
          );
        }

        if (state is FileStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is FileStateLoaded) {
          return Editor(
            initialContent: state.file.content ?? '',
          );
        }

        return const SizedBox();
      },
    );
  }
}
