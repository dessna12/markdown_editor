import 'package:go_router/go_router.dart';
import 'package:markdown_editor/presentation/pages/markdown_editor_page.dart';
import 'package:markdown_editor/presentation/pages/markdown_preview_page.dart';

const _markdownEditorPath = '/markdown-editor';
const _markdownPreviewPath = '/markdown-preview';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: _markdownEditorPath,
    routes: [
      GoRoute(
        name: MarkdownEditorPage.name,
        path: _markdownEditorPath,
        builder: (context, state) {
          return const MarkdownEditorPage();
        },
      ),
      GoRoute(
        name: MarkdownPreviewPage.name,
        path: _markdownPreviewPath,
        builder: (context, state) {
          return const MarkdownPreviewPage();
        },
      ),
    ],
  );
}
