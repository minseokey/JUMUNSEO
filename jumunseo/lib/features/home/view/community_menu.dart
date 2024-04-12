import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:jumunseo/core/blank.dart';
import 'package:jumunseo/features/community/writing_status.dart';
import '../../community/cubit/community_cubit.dart';
import '../../community/model/post.dart';
import '../home.dart';
import 'dart:math' as math;

class CommunityMenu extends StatefulWidget {
  const CommunityMenu({Key? key}) : super(key: key);

  @override
  State<CommunityMenu> createState() => _CommunityMenuState();
}

class _CommunityMenuState extends State<CommunityMenu> {

  List<Post> posts = List.empty();
  List<Post> topPosts = List.empty();

  void _getPosts() {
    setState(() {
      posts = context.read<CommunityCubit>().getPosts();

      // 상위 2개의 posts만 사용
      topPosts = posts.sublist(0, math.min(posts.length, 2));
    });
  }

  @override
  Widget build(BuildContext context) {
    List<WritingStatus> writeStatus = [WritingStatus(title: '제목', name: '유상록', writeDate: '2024년 4월 5일'),
                                      WritingStatus(title: '제목2', name: '유상록', writeDate: '2024년 4월 6일')];


    posts.sort((a, b) => b.datetime!.compareTo(a.datetime!)); // 날짜 내림차순 정렬

    _getPosts();

    return Column(
      children: [
        Row(
          children: [
            const Text("게시판", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.black),),
            const Spacer(),
            GestureDetector(
              onTapUp: (details) => context.push("/community").then((value) => _getPosts()),
              child: const Text("더보기", style: TextStyle(fontSize: 12.0, color: Colors.grey),)
            ),
          ],
        ),
        ListView(
          shrinkWrap: true,
          children: topPosts.map((post) =>
              GestureDetector(
                onTap: () => {
                  context.read<CommunityCubit>().setPost(post),
                  context.push("/community/post").then((value) => _getPosts())
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 19),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.05),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Row(
                        children: [
                          const CircleAvatar(backgroundImage: AssetImage('assets/images/community.png'), radius: 25.0,),
                          const Blank(10, 0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post.title!, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                              Text(post.userId!, style: const TextStyle(color: Colors.grey, fontSize: 10),),
                              Text(DateFormat('yyyy년 M월 d일').format(post.datetime!), style: const TextStyle(color: Colors.grey, fontSize: 10),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ).toList(),
        )
      ],
    );
  }
}

