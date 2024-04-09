import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String title = "타이틀 영역입니다.";
  String content = "본문 영역입니다. 본문 영역입니다. 본문 영역입니다. 본문 영역입니다. 본문 영역입니다. 본문 영역입니다.\n\n 본문 영역입니다. 본문 영역입니다. 본문 영역입니다. \n본문 영역입니다. 본문 영역입니다. 본문 영역입니다. ";
  // 가상의 이미지 아이콘 데이터
  List<IconData> images = [Icons.image, Icons.image, Icons.image];
  // 댓글 더미 데이터
  List<Map<String, String>> comments = [
    {"id": "user1", "comment": "맞아맞아"},
    {"id": "user2", "comment": "추천합니다."},
    {"id": "user3", "comment": "좋아요~~"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: Theme.of(context).textTheme.headline5),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(content),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              // 첨부 이미지 리스트
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 40,
                        child: Icon(images[index], size: 30),
                      ),
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
                children: comments.map((comment) {
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
                        Text(comment["id"]!, style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text(comment["comment"]!),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
