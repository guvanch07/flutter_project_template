import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final projectName = context.vars['project_name'];
  final orgName = context.vars['org_name'];
  
  final progress = context.logger.progress('Running flutter create $projectName...');
  
  try {
    final result = await Process.run(
      'flutter',
      [
        'create',
        projectName,
        '--org',
        orgName,
        '--no-pub', // We'll run pub get later or let the user do it
        '--overwrite', // Overwrite if exists (Mason will overwrite anyway)
      ],
      runInShell: true,
    );

    if (result.exitCode == 0) {
      progress.complete('Flutter project created successfully.');
    } else {
      progress.fail('Flutter create failed: ${result.stderr}');
      exit(result.exitCode);
    }
  } catch (e) {
    progress.fail('Failed to run flutter create: $e');
    exit(1);
  }
}
