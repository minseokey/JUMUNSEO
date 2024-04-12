import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

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

  final ImagePicker _picker = ImagePicker();
  final List<XFile> _selectedImages = [];
  final _titleController = TextEditingController();
  final _contentsController = TextEditingController();
  final _commentController = TextEditingController();

  Post post = Post();

  void _editPost() {
    setState(() {
      post.contents = _contentsController.text;
      post.title = _titleController.text;
      post.images = _selectedImages;
    });
  }

  void _deletePost() {
    setState(() {
      List<Post> posts = context.read<CommunityCubit>().getPosts();
      posts.removeWhere((c) => c.id == post.id);
      Navigator.pop(context);
    });
  }

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

  void _editComment(Comment comment) {
    setState(() {
      comment.contents = _commentController.text;
      _commentController.clear();
    });
  }

  void _deleteComment(Comment comment) {
    setState(() {
      post.comments!.removeWhere((c) => c.id == comment.id);
    });
  }

  // 선택된 이미지를 보여주는 수평 리스트 위젯
  Widget _buildImageList() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        key: ValueKey(_selectedImages.length), // 리스트가 변경될 때마다 새로운 Key 할당
        scrollDirection: Axis.horizontal,
        itemCount: _selectedImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.file(File(_selectedImages[index].path)), // 이미지 파일을 위젯으로 변환
          );
        },
      ),
    );
  }

  // 게시글 수정 팝업
  void _showPostEditSheet() {

    _titleController.text = post.title!;
    _contentsController.text = post.contents!;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) { // StateSetter를 사용하여 상태 변경
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
                          controller: _titleController,
                          decoration: const InputDecoration(
                            hintText: '제목',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _contentsController,
                          decoration: const InputDecoration(
                            hintText: '내용',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.multiline,
                          minLines: 8,
                          maxLines: 8,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () async {
                            // '이미지 첨부' 클릭시 갤러리 에서 선택한 이미지를 리스트에 추가후 갱신
                            final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                            if (image != null) {
                              setState(() {
                                _selectedImages.add(image);
                              });
                            }
                          },
                          icon: const Icon(Icons.photo_library),
                          label: const Text('이미지 첨부'),
                        ),
                        if (_selectedImages.isNotEmpty) _buildImageList(), // 이미지가 있을 경우만 리스트 보여줌
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              _editPost();
                              Navigator.pop(context);
                            },
                            child: const Text('수정'),
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
      },
    );
  }

  // 댓글 생성 팝업
  void _showCommentCreationSheet([Comment? comment]) {

    if (comment != null) {
      _commentController.text = comment.contents!;
    }

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

                          if (comment == null) {
                            _addComment();
                          } else {
                            _editComment(comment);
                          }
                          Navigator.pop(context);
                        },
                        child: Text(comment == null ? '댓글 달기' : '댓글 수정'),
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

  // 게시글 우측상단 메뉴 선택시 생성
  void _showPostMenuSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('수정'),
              onTap: () {
                Navigator.pop(context);
                _showPostEditSheet();
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('삭제'),
              onTap: () {
                Navigator.pop(context);
                _deletePost();
              },
            ),
          ],
        );
      },
    );
  }


  // 댓글의 우측상단 메뉴 선택시 생성
  void _showCommentMenuSheet(BuildContext context, Comment comment) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('편집'),
              onTap: () {
                Navigator.pop(context);
                _showCommentCreationSheet(comment);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('삭제'),
              onTap: () {
                Navigator.pop(context);
                _deleteComment(comment);
              },
            ),
            ListTile(
              leading: const Icon(Icons.thumb_up),
              title: const Text('좋아요'),
              onTap: () {
                // 좋아요 관련 로직 처리
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.thumb_down),
              title: const Text('싫어요'),
              onTap: () {
                // 싫어요 관련 로직 처리
                Navigator.pop(context);
              },
            ),
          ],
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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              _showPostMenuSheet(context);
            },
          ),
        ],
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
                children: post.comments != null
                    ? post.comments!.map((comment) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(comment.userId!, style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text(comment.contents!),
                          ],
                        ),
                        Positioned(
                          top: -15,
                          right: -10,
                          child: IconButton(
                            icon: const Icon(Icons.more_horiz),
                            onPressed: () => _showCommentMenuSheet(context, comment),
                          ),
                        ),
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
