import 'package:card_swiper/card_swiper.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jumunseo/config/theme/app_color.dart';
import 'package:jumunseo/core/logger.dart';
import 'package:jumunseo/features/community/detail/model/community_detail_model.dart';
import 'package:jumunseo/shared/svg_strings.dart';
import 'package:jumunseo/shared/time_diff_string.dart';
import 'package:url_launcher/url_launcher.dart';

PagingController<int, CommunityDetailModel> communityPageController =
    PagingController(firstPageKey: 1);

CommunityDetailModel testDItem1 = CommunityDetailModel(
    title: "디지털 유산을 상속 받을 권리를 법적으로 보장해야 하는가?",
    id: '1',
    author: "관리자",
    content: "2024년 5월 19일 딜레마 디지털 유산을 상속 받을 권리를 법적으로 보장해야 하는가?",
    image: "assets/icons/logo.png",
    description: "asset",
    type: '딜레마',
    created_at: "4시간 전");

CommunityDetailModel testDItem2 = CommunityDetailModel(
    title: "의료 연구를 위해 개인의 유전 정보를 정부가 수집해야 하는가?",
    id: '1',
    author: "관리자",
    content: "2024년 5월 19일 딜레마 디지털 유산을 상속 받을 권리를 법적으로 보장해야 하는가?",
    image: "assets/icons/logo.png",
    description: "asset",
    type: '딜레마',
    created_at: "4시간 전");

CommunityDetailModel testDItem3 = CommunityDetailModel(
    title: "종교적 신념에 반하는 의료 처치를 거부할 권리를 부모가 자녀에게 적용해야 하는가?",
    id: '1',
    author: "관리자",
    content: "2024년 5월 19일 딜레마 디지털 유산을 상속 받을 권리를 법적으로 보장해야 하는가?",
    image: "assets/icons/logo.png",
    description: "asset",
    type: '딜레마',
    created_at: "4시간 전");

CommunityDetailModel testMItem1 = CommunityDetailModel(
    title: "친구가 돈을 빌리고 안갚습니다",
    id: '1',
    author: "관리자",
    content: "2024년 5월 19일 딜레마 디지털 유산을 상속 받을 권리를 법적으로 보장해야 하는가?",
    image: "assets/icons/logo.png",
    description: "asset",
    type: '마법사',
    created_at: "4시간 전");
CommunityDetailModel testMItem2 = CommunityDetailModel(
    title: "집주인이 전세금을 안돌려줍니다",
    id: '1',
    author: "관리자",
    content: "2024년 5월 19일 딜레마 디지털 유산을 상속 받을 권리를 법적으로 보장해야 하는가?",
    image: "assets/icons/logo.png",
    description: "asset",
    type: '마법사',
    created_at: "4시간 전");
CommunityDetailModel testMItem3 = CommunityDetailModel(
    title: "지나가다가 행인에게 폭력을 당했습니다",
    id: '1',
    author: "관리자",
    content: "2024년 5월 19일 딜레마 디지털 유산을 상속 받을 권리를 법적으로 보장해야 하는가?",
    image: "assets/icons/logo.png",
    description: "asset",
    type: '마법사',
    created_at: "4시간 전");

Future<void> _fetchPage(int pageKey) async {
  try {
    final newItems = await Future.delayed(
        Duration(seconds: 3),
        () => List.generate(10, (index) {
              return CommunityDetailModel(
                title: "차 문열다가 옆차 긁었는데 어떻게 해야할까요?",
                id: '1',
                content: '주차장에서 차 문을 열다가 실수로 옆차를 긁었는데 심하진 않은데',
                author: '홍길동',
                description: 'network',
                created_at: '2024년 4월 25일',
                image:
                    'https://mblogthumb-phinf.pstatic.net/MjAyMjExMjlfMTU0/MDAxNjY5Njg0NjkwOTUy.72LsU39rH8OF2RcIfZW6zjuYmSp31jPuqRxBaOoeWo4g.bP_Ndrl5r5Oep3MBh-zQu3ft9505x56vwuBNZTOeHwgg.JPEG.jackq741004/20221109_155437.jpg?type=w800',
                type: '',
              );
            }));
    final nextPageKey = pageKey + 1;
    communityPageController.appendPage(
        newItems
            // .where((element) =>
            //     (element.postStatus == 1) &&
            //     (!BlockSet().blockUserUniqIdSet.contains(element.userUniqId)) &&
            //     (!BlockSet().blockPostingPostIdSet.contains(element.postId)))
            .toList(),
        nextPageKey);
    // communityPageController.appendLastPage(newItems
    //     .where((element) =>
    //         (element.postStatus == 1) &&
    //         (!BlockSet().blockUserUniqIdSet.contains(element.userUniqId)) &&
    //         (!BlockSet().blockMeetingPostIdSet.contains(element.postId)))
    //     .toList());
    // return;
    // logger.d("pageKey: $pageKey");
    // final isLastPage = newItems.length < _pageSize;
    // if (isLastPage) {
    //   communityPageController.appendLastPage(newItems
    //       .where((element) =>
    //           (element.postStatus == 1) &&
    //           (!BlockSet().blockUserUniqIdSet.contains(element.userUniqId)) &&
    //           (!BlockSet().blockPostingPostIdSet.contains(element.postId)))
    //       .toList());
    // } else {
    //   final nextPageKey = pageKey + 1;
    //   communityPageController.appendPage(
    //       newItems
    //           .where((element) =>
    //               (element.postStatus == 1) &&
    //               (!BlockSet()
    //                   .blockUserUniqIdSet
    //                   .contains(element.userUniqId)) &&
    //               (!BlockSet().blockPostingPostIdSet.contains(element.postId)))
    //           .toList(),
    //       nextPageKey);
    // }
  } catch (error) {
    // _pagingController.error = error;
    logger.e(error);
  }
}

class CommunityListSmallItem extends StatelessWidget {
  const CommunityListSmallItem({super.key, required this.item});

  final CommunityDetailModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          height: 38,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                //TODO: 글세부보기
                context.push('/community/1');
              },
              borderRadius: BorderRadius.circular(15),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, top: 4, bottom: 4, right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (item.type.isNotEmpty)
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                    child: item.type == "딜레마"
                                        ? Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    ColorStyles.secondMainColor,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      4, 2, 4, 2),
                                              child: Text(item.type,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey[100],
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                                color: ColorStyles.mainColor,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      4, 2, 4, 2),
                                              child: Text(item.type,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey[100],
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                          ),
                                  ),
                                Expanded(
                                  child: Text(item.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CommunityListItem extends StatelessWidget {
  const CommunityListItem({super.key, required this.item});

  final CommunityDetailModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          height: 116,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                context.push('/community/2');
              },
              borderRadius: BorderRadius.circular(15),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, top: 16, bottom: 12, right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (item.type.isNotEmpty)
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: ColorStyles.secondMainColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            4, 2, 4, 2),
                                        child: Text(item.type,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[100],
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                  ),
                                Expanded(
                                  child: Text(item.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
                              child: Text(
                                //item.content,
                                item.content,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Row(
                              children: [
                                SvgPicture.string(
                                  reReplyButtonSvgString,
                                  height: 14,
                                ),
                                Text(
                                  // " ${"item.replyCount"}",
                                  " 13",
                                  style: const TextStyle(fontSize: 12),
                                ),
                                Expanded(
                                  child: Text(
                                    " | ${item.created_at} | ${item.author}",
                                    // " | ${timeDiffString(DateTime.now().subtract(Duration(hours: 12)))} | ${item.author}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // if (item.picture.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: item.description == 'network'
                            ? ExtendedImage.network(
                                item.image,
                                height: 76,
                                width: 76,
                                fit: BoxFit.cover,
                              )
                            : ExtendedImage.asset(
                                item.image,
                                height: 76,
                                width: 76,
                                fit: BoxFit.cover,
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CommunityHomeScreen extends StatelessWidget {
  const CommunityHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    communityPageController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ExtendedImage.asset(
                  'assets/icons/jumunseo_letter.png',
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "게시판",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return Future.sync(() {
              communityPageController.refresh();
            });
          },
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                SizedBox(
                  width: maxWidth,
                  height: 250,
                  child: Swiper(
                    pagination: SwiperCustomPagination(builder:
                        (BuildContext context, SwiperPluginConfig config) {
                      return Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            margin: const EdgeInsets.only(top: 16, right: 16),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                color: Colors.black.withOpacity(0.5),
                                height: 22,
                                width: 41,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${config.activeIndex + 1}/3",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12)),
                                  ],
                                ),
                              ),
                            )),
                      );
                    }),
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        3, // Assume banners is a list of your banner data.
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: ClipRRect(
                            child: SizedBox(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      launchUrl(Uri.parse(
                                          'https://seoul.scourt.go.kr/dcboard/new/DcNewsViewAction.work?seqnum=229&gubun=215&cbub_code=000210&searchWord=&pageIndex=1'));
                                    },
                                    child: Container(
                                      height: 250,
                                      width: maxWidth,
                                      child: ExtendedImage.network(
                                        [
                                          'https://www.korea.kr/newsWeb/resources/attaches/2023.09/13/5c5469f53381edd51601bbd5a4aac7df.jpg',
                                          "http://file.scourt.go.kr/crosseditor/images/000001/20161215091146604_69P2HFMA.jpg",
                                          "http://file.scourt.go.kr/crosseditor/images/000001/20160913084705650_W0QTBHY3.jpg",
                                        ][index],
                                        alignment: Alignment.topCenter,
                                        fit: index == 0
                                            ? BoxFit.contain
                                            : BoxFit.cover,
                                      ),
                                    ),
                                  )
                                  // Expanded(
                                  //   child: Container(
                                  //     color: Colors.blueGrey,
                                  //     child: Text(
                                  //       '오늘의 상식 $index',
                                  //       style: const TextStyle(
                                  //           color: Colors.white, fontSize: 24),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ])),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('마법사',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0)),
                          ),
                          CommunityListSmallItem(item: testMItem1),
                          CommunityListSmallItem(item: testMItem2),
                          CommunityListSmallItem(item: testMItem3),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('딜레마',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0)),
                          ),
                          CommunityListSmallItem(item: testDItem1),
                          CommunityListSmallItem(item: testDItem2),
                          CommunityListSmallItem(item: testDItem3),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                            child: Text('전체글',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              PagedSliverList(
                  pagingController: communityPageController,
                  builderDelegate:
                      PagedChildBuilderDelegate<CommunityDetailModel>(
                    itemBuilder: (context, item, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: CommunityListItem(item: item),
                      );
                    },
                  )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push('/community/post/write');
          },
          backgroundColor: ColorStyles.mainColor,
          child: const Icon(Icons.add),
        ));
  }
}
