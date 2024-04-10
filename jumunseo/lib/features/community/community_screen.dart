import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
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

  // Post 데이터 리스트
  List<Post> posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getPost();
  }

  // Post 목록 가져오기
  void _getPost() {
    // 백엔드 구성 전까지 임시로 생성
    posts.add(Post(
      id: "0",
      title: "이혼 소송 관련 고민",
      contents: "최근 이혼 과정에서 법적인 문제에 직면했습니다. 이혼 소송에서 어떻게 해야 할지 막막하네요. 변호사를 고용해야 할까요?",
      userId: "김이혼",
      comments: [
        Comment(
          contents: "변호사를 고용하는 것이 좋습니다. 전문가의 도움을 받으면 더 원활한 소송 진행이 가능합니다.",
          userId: "변호사1",
          datetime: DateTime.now()
        ),
        Comment(
            contents: "상황에 따라 변호사 없이도 진행할 수 있지만, 복잡한 문제가 있다면 전문가의 조언이 필요합니다.",
            userId: "변호사2",
            datetime: DateTime.now()
        ),
        Comment(
            contents: "변호사를 고용하면 자신의 권리를 보호할 수 있어요. 소송에서 중요한 부분이니 꼭 고려해보세요.",
            userId: "변호사1",
            datetime: DateTime.now()
        ),
      ],
      datetime: DateTime.now(),
      boardId: "커뮤니티",
      images: [],
    ));

    posts.add(Post(
      id: "1",
      title: "부동산 임대 문제로 인한 고민",
      contents: "부동산을 임대하고 있는데, 임차인과의 분쟁이 발생했습니다. 임대 계약서에 어긋나는 행동을 하는데, 어떻게 대응해야 할지 모르겠습니다.",
      userId: "임대인",
      comments: [
        Comment(
            contents: "먼저 임차인과의 대화를 통해 문제를 해결해보세요. 상호간의 합의가 최선의 해결책일 수 있습니다.",
            userId: "부동산1",
            datetime: DateTime.now()
        ),
        Comment(
            contents: "임차인이 계약을 어기고 있다면, 변호사와 상담하여 법적인 조치를 취할 수 있습니다. 권리를 지키기 위해 적절한 대응이 필요합니다.",
            userId: "해피부동산",
            datetime: DateTime.now()
        ),
        Comment(
            contents: "분쟁을 미리 예방하기 위해 명확한 임대 계약서를 작성하는 것이 중요합니다. 앞으로의 계약에는 더 신중하게 접근해보세요.",
            userId: "해결사",
            datetime: DateTime.now()
        ),
      ],
      datetime: DateTime.now(),
      boardId: "커뮤니티",
      images: [],
    ));

    posts.add(Post(
      id: "2",
      title: "소송 과정에서의 비용 부담",
      contents: "소송 과정에서 예상치 못한 비용이 발생하여 부담스럽습니다. 법적인 절차를 진행하면서 비용을 어떻게 관리해야 할지 고민입니다.",
      userId: "고민",
      comments: [
        Comment(
            contents: "소송 과정에서 발생하는 비용은 예측하기 어렵습니다. 따라서 미리 예산을 설정하고, 변호사와 상의하여 비용을 최대한 줄일 수 있는 방법을 찾아보세요.",
            userId: "변호사1",
            datetime: DateTime.now()
        ),
        Comment(
            contents: "법정에서 승리한다고 해도 소송 비용이 상당할 수 있습니다. 비용 부담을 최소화하기 위해 변호사와 함께 전략을 세워보세요.",
            userId: "변호사2",
            datetime: DateTime.now()
        ),
        Comment(
            contents: "소송 비용에 대한 걱정은 자연스러운 일입니다. 하지만 이를 극복하기 위해 변호사와 협력하여 적절한 대책을 세우는 것이 중요합니다.",
            userId: "변호사3",
            datetime: DateTime.now()
        ),
      ],
      datetime: DateTime.now(),
      boardId: "커뮤니티",
      images: [],
    ));

    posts.add(Post(
      id: "3",
      title: "계약 파기로 인한 분쟁",
      contents: "계약 파기로 인한 분쟁이 발생했습니다. 상대방이 계약 내용을 어긴 채로 파기를 요구하고 있습니다. 이에 대한 대응 방안이 필요합니다.",
      userId: "고민",
      comments: [
        Comment(
            contents: "소송 과정에서 발생하는 비용은 예측하기 어렵습니다. 따라서 미리 예산을 설정하고, 변호사와 상의하여 비용을 최대한 줄일 수 있는 방법을 찾아보세요.",
            userId: "변호사1",
            datetime: DateTime.now()
        ),
        Comment(
            contents: "상대방의 계약 파기 요구가 정당한지 확인해야 합니다. 계약 내용을 꼼꼼히 검토하고, 변호사와 상담하여 다음 단계를 결정하세요.",
            userId: "변호사2",
            datetime: DateTime.now()
        ),
      ],
      datetime: DateTime.now(),
      boardId: "커뮤니티",
      images: [],
    ));
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
              child: const TextField(
                decoration: InputDecoration(
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
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  elevation: 4.0,
                  margin: const EdgeInsets.only(left: 25.0, right: 25.0, top: 8.0, bottom: 8.0),
                  child: Padding( // Card 내부에 Padding 적용
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0), // 원하는 padding 값 설정
                    child: ListTile(
                      leading: posts[index].images != null && posts[index].images!.isNotEmpty
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          File(posts[index].images![0].path),
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                        ),
                      )
                          : const Icon(Icons.account_box_rounded, size: 56),
                      title: Text(posts[index].title ?? ''),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        context.read<CommunityCubit>().setPost(posts[index]);
                        context.push("/community/post");
                      },
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
