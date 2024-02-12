import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:markdown_editor/blocs/file_cubit.dart';
import 'package:markdown_editor/presentation/components/markdown_editor_body.dart';
import 'package:markdown_editor/presentation/components/markdown_preview_body.dart';
import 'package:markdown_editor/presentation/pages/markdown_preview_page.dart';

class MarkdownEditorPage extends StatelessWidget {
  const MarkdownEditorPage({super.key});

  static const name = 'markown-editor';

  @override
  Widget build(BuildContext context) => Builder(builder: (context) {
        Size screenSize = MediaQuery.of(context).size;
        
        return Scaffold(
          appBar: AppBar(
            title: const Text('Markdown Editor',
            style: TextStyle(color: Colors.white)
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,

            actions: [
              IconButton(
                onPressed: () {
                  context.read<FileCubit>().saveFile();
                },
                icon: const Icon(
                  Icons.save,
                  color: Colors.white
                  ),
              ),
              LayoutBuilder(builder: (context, constraint) {
                print('Rebuild in App Bar => ${screenSize.width}');
                if (screenSize.width < 1000) {
                  return IconButton(
                    onPressed: () {
                      context.pushNamed(MarkdownPreviewPage.name);
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                      ),
                  );
                }
                return Icon(Icons.abc);
              }),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: LayoutBuilder(builder: (context, constraint) {
              print('Rebuild in Body => ${constraint.maxWidth}');
              if (constraint.maxWidth < 1000) {
                return const MarkdownEditorBody();
              }
              return const Row(
                children: [
                  Expanded(child: MarkdownEditorBody()),
                  Expanded(child: MarkdownPreviewBody()),
                ],
              );
            }),
          ),
        );
      });
}
