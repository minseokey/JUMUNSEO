import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  // 가상의 게시글 데이터 리스트
  final List<Map<String, dynamic>> posts = List.generate(
    10,
        (index) => {
      'title': '게시글 제목 $index',
      'image': Icons.account_circle,
    },
  );

  void _showPostCreationSheet() {
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
                    const TextField(
                      decoration: InputDecoration(
                        hintText: '제목',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: '내용',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.multiline,
                      minLines: 8,
                      maxLines: 8,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        // 갤러리에서 이미지 선택 로직 추가
                      },
                      icon: const Icon(Icons.photo_library),
                      label: const Text('이미지 첨부'),
                    ),

                    // 이미지 추가시 리스트 생성 추가 필요

                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // 게시글 작성 로직 추가
                        },
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
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: '검색',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(posts[index]['image']), // 대표 이미지 또는 아이콘
                  title: Text(posts[index]['title']), // 게시글 제목
                  trailing: const Icon(Icons.arrow_forward_ios), // 상세보기 아이콘
                  onTap: () {
                    // 게시글 선택시 게시글 상세 화면으로 이동
                    context.push("/community/post");
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showPostCreationSheet,
        child: const Icon(Icons.add),
      ),
    );
  }
}
