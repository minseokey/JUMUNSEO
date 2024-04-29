import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:jumunseo/shared/strings.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("개인정보 처리방침", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
      ),

      body: Markdown(
        data: Strings.privacyPolicy,
        styleSheet: MarkdownStyleSheet(
          h2: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}