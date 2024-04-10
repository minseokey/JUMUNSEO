import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../wizard/chat/view/gradient_button.dart';
import '../cubit/community_cubit.dart';
import '../model/comment.dart';
import '../model/post.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final TextEditingController _commentController = TextEditingController();

  Post post = Post();

  void _addComment() {
    // comment가 비어 있는지 확인
    if (_commentController.text.isEmpty) {
      Navigator.pop(context);

      const snackBar = SnackBar(
        content: Text('댓글을 입력해주세요.'),
        duration: Duration(seconds: 2), // 메시지 표시 시간
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    final newComment = Comment(
      id: post.comments == null ? "0" : post.comments!.length.toString(),
      contents: _commentController.text,
      datetime: DateTime.now(),
      userId: "김미선",
      postId: post.id,
    );

    setState(() {
      post.comments!.add(newComment);
      // 입력 필드 초기화
      _commentController.clear();
    });

  }

  void _showCommentCreationSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _commentController,
                      decoration: const InputDecoration(
                        hintText: '코멘트',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.multiline,
                      minLines: 3,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // 댓글 추가 함수 호출
                          _addComment();
                          
                          Navigator.pop(context); // BottomSheet 닫기
                        },
                        child: const Text('댓글 달기'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    post = context.read<CommunityCubit>().getPost();

    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(post.title!!, style: Theme.of(context).textTheme.headline5),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(post.contents!!),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              // 첨부 이미지 리스트
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  key: ValueKey(post.images!.length),
                  scrollDirection: Axis.horizontal,
                  itemCount: post.images!.length,
                  padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(File(post.images![index].path)),
                    );
                  },
                ),
              ),
            ),
            const Divider(),
            // 댓글을 수직 리스트로 표시
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: post.comments != null ? post.comments!.map((comment) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(comment.userId!, style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(comment.contents!),
                      ],
                    ),
                  );
                }).toList() : const [],  // post.comments가 null일 때는 빈 리스트 반환
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCommentCreationSheet,
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: GradientButton(
          onButtonPress: _showCommentCreationSheet,
          message: '+',
        ),
      ),
    );
  }
}
