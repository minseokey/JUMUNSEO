import 'package:card_swiper/card_swiper.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jumunseo/core/logger.dart';
import 'package:jumunseo/features/community/detail/model/community_detail_model.dart';
import 'package:jumunseo/shared/svg_strings.dart';
import 'package:jumunseo/shared/time_diff_string.dart';

PagingController<int, CommunityDetailModel> communityPageController =
    PagingController(firstPageKey: 1);

CommunityDetailModel testItem = CommunityDetailModel(
  id: '1',
  name: 'name',
  description: 'description',
  image: 'image',
);

Future<void> _fetchPage(int pageKey) async {
  try {
    final newItems = await Future.delayed(
        Duration(seconds: 1),
        () => List.generate(10, (index) {
              return CommunityDetailModel(
                id: '1',
                name: 'name',
                description: 'description',
                image: 'image',
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

class CommunityListItem extends StatelessWidget {
  const CommunityListItem({super.key, required this.item});

  final CommunityDetailModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          height: 124,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                //TODO: 글세부보기
                context.push('/community/1');
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, top: 20, bottom: 20, right: 16),
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
                            child: Text("제목",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
                              child: Text(
                                //item.content,
                                "item.content",
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
                                    " | ${timeDiffString(DateTime.now().subtract(Duration(hours: 12)))} | ${"item.authorNickname"}",
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
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ExtendedImage.network(
                          'https://picsum.photos/200/300',
                          height: 84,
                          width: 84,
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
        title: const Text('Community Home Screen'),
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
                height: 220,
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
                  itemCount: 3, // Assume banners is a list of your banner data.
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: ClipRRect(
                          child: SizedBox(
                            width: maxWidth,
                            height: 220,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.blueGrey,
                                    child: Text(
                                      '오늘의 상식 $index',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 24),
                                    ),
                                  ),
                                ),
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
                  Column(
                    children: [
                      Text('자유게시판'),
                      CommunityListItem(item: testItem),
                      CommunityListItem(item: testItem),
                      CommunityListItem(item: testItem),
                    ],
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      Text('토론글'),
                      Text('토론글들'),
                    ],
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      Text('상담글'),
                      Text('상담글들'),
                    ],
                  ),
                ],
              ),
            ),
            PagedSliverList(
                pagingController: communityPageController,
                builderDelegate:
                    PagedChildBuilderDelegate<CommunityDetailModel>(
                  itemBuilder: (context, item, index) {
                    return CommunityListItem(item: item);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
