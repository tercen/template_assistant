import 'package:flutter/material.dart';
import 'package:template_assistant/template_list_screen.dart';


void main() => runApp(const PromptApp());

class PromptApp extends StatelessWidget {
  const PromptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TemplateListWidget(),
    );
  }
}
