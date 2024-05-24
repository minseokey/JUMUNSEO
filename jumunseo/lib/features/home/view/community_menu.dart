import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/core/blank.dart';
import 'package:jumunseo/features/community/detail/model/community_detail_model.dart';
import 'package:jumunseo/features/community/home/view/community_home_screen.dart';
import '../home.dart';

class CommunityMenu extends StatefulWidget {
  const CommunityMenu({Key? key}) : super(key: key);

  @override
  State<CommunityMenu> createState() => _CommunityMenuState();
}

class WritingStatus {
  final String title;
  final String name;
  final String writeDate;
  final String content;
  final String image;

  WritingStatus(
      {required this.title,
      required this.name,
      required this.writeDate,
      required this.content,
      required this.image});
}

class _CommunityMenuState extends State<CommunityMenu> {
  @override
  Widget build(BuildContext context) {
    List<CommunityDetailModel> writeStatus = [];

    return Column(
      children: [
        Row(
          children: [
            const Text(
              "게시판",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.black),
            ),
            const Spacer(),
            GestureDetector(
                onTapUp: (details) =>
                    context.read<HomeCubit>().homeToCommunity(context),
                child: const Text(
                  "더보기",
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                )),
          ],
        ),
        ListView(
          shrinkWrap: true,
          children: writeStatus
              .map((status) => CommunityListItem(
                    item: status,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
