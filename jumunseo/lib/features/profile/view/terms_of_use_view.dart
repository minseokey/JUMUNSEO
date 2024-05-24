import 'package:flutter/material.dart';
import 'package:jumunseo/shared/strings.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TermsOfUseView extends StatelessWidget {
  const TermsOfUseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("사용자 이용약관", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
      ),

      body: Markdown(
        data: Strings.termsOfUse,
        styleSheet: MarkdownStyleSheet(
          h2: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}