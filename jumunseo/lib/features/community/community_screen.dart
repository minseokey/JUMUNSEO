import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jumunseo/core/logger.dart';
import 'package:jumunseo/features/community/cubit/community_cubit.dart';

import '../wizard/chat/view/gradient_button.dart';
import 'model/comment.dart';
import 'model/post.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();


}

class _CommunityScreenState extends State<CommunityScreen> {

  final ImagePicker _picker = ImagePicker();
  List<XFile> _selectedImages = []; // 선택된 이미지 파일들을 저장하는 리스트
  final _titleController = TextEditingController();
  final _contentsController = TextEditingController();
  final _searchController = TextEditingController();

  // Post 데이터 리스트
  List<Post> posts = [];
  List<Post> filteredPosts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPosts();

    // 검색창의 텍스트가 변경될 때마다 필터링을 수행
    _searchController.addListener(_filterPosts);
  }

  
  // Post 목록 가져오기
  void _getPosts() {
    setState(() {
      posts = context.read<CommunityCubit>().getPosts();

      filteredPosts.clear();
      filteredPosts.addAll(posts);
    });
  }

  // 키워드 검색
  void _filterPosts() {
    if (_searchController.text.isEmpty) {
      _getPosts();
      return;
    }

    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredPosts = posts.where((post) {
        final titleLower = post.title!.toLowerCase();
        final contentsLower = post.contents!.toLowerCase();
        final userLower = post.userId!.toLowerCase();
        return titleLower.contains(query) || contentsLower.contains(query) || userLower.contains(query);
      }).toList();
    });
  }

  // '작성' 버튼 눌렀을때 Post 생성후 리스트 추가
  void _addPost() {
    // title이나 contents가 비어 있는지 확인
    if (_titleController.text.isEmpty || _contentsController.text.isEmpty) {
      Navigator.pop(context);

      const snackBar = SnackBar(
        content: Text('제목과 내용을 모두 입력해주세요.'),
        duration: Duration(seconds: 2), // 메시지 표시 시간
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    final newPost = Post(
      id: posts.length.toString(),
      title: _titleController.text,
      contents: _contentsController.text,
      datetime: DateTime.now(),
      boardId: "커뮤니티",
      userId: "김미선",
      images: _selectedImages,
      comments: []
    );

    setState(() {
      posts.add(newPost);
      posts.sort((a, b) => b.datetime!.compareTo(a.datetime!)); // 날짜 내림차순 정렬

      filteredPosts.clear();
      filteredPosts.addAll(posts);

      // 선택된 이미지 리스트 초기화
      _selectedImages = [];
      // 입력 필드 초기화
      _titleController.clear();
      _contentsController.clear();
    });

    Navigator.pop(context); // 모달 또는 페이지 닫기
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

  void _showPostCreationSheet() {
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
                            onPressed: _addPost,
                            child: const Text('작성'),
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('커뮤니티'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(12),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: '검색',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 12.0, right: 12.0, top: 20.0, bottom: 20.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPosts.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.read<CommunityCubit>().setPost(filteredPosts[index]);
                    context.push("/community/post").then((value) => _getPosts()); // 게시글 삭제시 갱신을 위한 호출
                  },
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4.0,
                    margin: const EdgeInsets.only(left: 25.0, right: 25.0, top: 8.0, bottom: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          filteredPosts[index].images != null && filteredPosts[index].images!.isNotEmpty
                              ? ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.file(
                              File(filteredPosts[index].images![0].path),
                              width: 56,
                              height: 56,
                              fit: BoxFit.cover,
                            ),
                          )
                              : const Icon(Icons.account_box_rounded, size: 56),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  filteredPosts[index].title ?? '',
                                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  filteredPosts[index].userId ?? '',
                                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                                ),
                                Text(
                                  DateFormat('yyyy년 M월 d일').format(filteredPosts[index].datetime!),
                                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showPostCreationSheet,
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: GradientButton(
          onButtonPress: _showPostCreationSheet,
          message: '+',
        ),
      ),
    );
  }
}
