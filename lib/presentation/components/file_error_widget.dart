import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markdown_editor/blocs/file_cubit.dart';

class FileErrorWidget extends StatelessWidget {
  const FileErrorWidget({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () async {
              context.read<FileCubit>().loadFile();
            },
            child: const Text('Get file'),
          ),
        ],
      ),
    );
  }
}
