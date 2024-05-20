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
    List<CommunityDetailModel> writeStatus = [
      CommunityDetailModel(
          title: "디지털 유산을 상속 받을 권리를 법적으로 보장해야 하는가?",
          id: '1',
          author: "관리자",
          content: "2024년 5월 19일 딜레마 디지털 유산을 상속 받을 권리를 법적으로 보장해야 하는가?",
          image: "assets/icons/logo.png",
          description: "asset",
          type: '딜레마',
          created_at: "4시간 전"),
      CommunityDetailModel(
        title: "차 문열다가 옆차 긁었는데 어떻게 해야할까요?",
        id: '1',
        content: '주차장에서 차 문을 열다가 실수로 옆차를 긁었는데 심하진 않은데',
        author: '홍길동',
        description: 'network',
        created_at: '2024년 4월 25일',
        image:
            'https://mblogthumb-phinf.pstatic.net/MjAyMjExMjlfMTU0/MDAxNjY5Njg0NjkwOTUy.72LsU39rH8OF2RcIfZW6zjuYmSp31jPuqRxBaOoeWo4g.bP_Ndrl5r5Oep3MBh-zQu3ft9505x56vwuBNZTOeHwgg.JPEG.jackq741004/20221109_155437.jpg?type=w800',
        type: '',
      )
    ];

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
