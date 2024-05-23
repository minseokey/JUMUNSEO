import 'package:card_swiper/card_swiper.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jumunseo/config/theme/app_color.dart';
import 'package:jumunseo/core/blank.dart';
import 'package:jumunseo/core/logger.dart';

import 'package:jumunseo/shared/svg_strings.dart';
import 'package:jumunseo/shared/time_diff_string.dart';

import './community_detail_reply_widget.dart';

PagingController<int, int> _replyPageController =
    PagingController(firstPageKey: 1);

TextEditingController _replyInputController = TextEditingController();

Future<void> _fetchReply(int pageKey) async {
  try {
    final newItems = await Future.delayed(
        Duration(seconds: 1),
        () => List.generate(10, (index) {
              return index;
            }));
    final nextPageKey = pageKey + 1;
    _replyPageController.appendPage(
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

class CommunityDetailScreen extends StatelessWidget {
  const CommunityDetailScreen({super.key, required this.postId});

  final String postId;

  final bool hasPicture = false;
  final bool isMine = false;
  final int pictureCount = 3;
  final int replyCount = 3;

  @override
  Widget build(BuildContext context) {
    _replyPageController.addPageRequestListener((pageKey) {
      _fetchReply(pageKey);
    });
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // 키보드 감추기
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: hasPicture,

        // (communityData != null && communityData!.picture.isNotEmpty)
        //     ? true
        //     : false,
        appBar: AppBar(
          // shadowColor: Colors.grey,
          // elevation: 1,
          backgroundColor:
              // (communityData != null && communityData!.picture.isNotEmpty)
              hasPicture ? Colors.white10 : Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text("게시판",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 8, 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorStyles.secondMainColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                    child: Text("딜레마",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[100],
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ],
          ),

          actions: [
            IconButton(
                icon: const Icon(
                  Icons.more_horiz_outlined,
                  color: Colors.black,
                ),
                onPressed: () async {
                  var contexta = context;
                  showModalBottomSheet(
                      context: contexta,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      builder: (contextb) {
                        return Container(
                          padding: EdgeInsets.only(
                              top: 8,
                              bottom:
                                  MediaQuery.of(contextb).viewPadding.bottom),
                          width: MediaQuery.of(contextb).size.width,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 100,
                                height: 3,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              // if (communityData!.userUniqId ==
                              //     Token().userUniqId)
                              if (isMine)
                                GestureDetector(
                                  onTap: () async {
                                    await showDialog(
                                        context: contextb,
                                        builder: (contextc) {
                                          return AlertDialog(
                                            title: Text("글 삭제"),
                                            content: Text("글 삭제하시겟습니까"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () async {
                                                    // try {
                                                    //   final dio = Dio(
                                                    //       BaseOptions(
                                                    //           baseUrl: baseUrl,
                                                    //           headers: {
                                                    //             'Authorization':
                                                    //                 Token()
                                                    //                     .refreshToken
                                                    //           },
                                                    //           responseType:
                                                    //               ResponseType
                                                    //                   .json));
                                                    //   final response =
                                                    //       await dio.delete(
                                                    //     "/community/posts/${communityData!.postId}",
                                                    //   );
                                                    //   if (response.statusCode ==
                                                    //       201) {
                                                    //     communityPageController
                                                    //         .refresh();
                                                    //     contextc.pop();
                                                    //     contextb.pop();
                                                    //     contexta.pop();
                                                    //   } else {
                                                    //     contextc.pop();
                                                    //     contextb.pop();
                                                    //     ScaffoldMessenger.of(
                                                    //             contexta)
                                                    //         .showSnackBar(
                                                    //             SnackBar(
                                                    //       content:
                                                    //           Text("fail".tr()),
                                                    //     ));
                                                    //   }

                                                    //   logger.d(response.data);
                                                    //   //return response.statusCode;
                                                    // } catch (error) {
                                                    //   logger.d('오류: $error');
                                                    // }
                                                  },
                                                  child: Text("확인")),
                                              TextButton(
                                                  onPressed: () {},
                                                  child: Text("취소"))
                                            ],
                                          );
                                        });
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(15),
                                      width: MediaQuery.sizeOf(contextb).width,
                                      height: 60,
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.delete_outline_rounded,
                                            color: Colors.redAccent,
                                            size: 30,
                                          ),
                                          Text(
                                            "글 삭제",
                                            style: const TextStyle(
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      )),
                                ),
                              if (!isMine)
                                GestureDetector(
                                  onTap: () async {
                                    // contextb.pop();
                                    // await contexta.push("/report", extra: {
                                    //   "reportType": "community",
                                    //   "id": communityData!.postId.toString(),
                                    //   "title": communityData!.title
                                    // });
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(15),
                                      width: MediaQuery.sizeOf(contextb).width,
                                      height: 60,
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.report_outlined,
                                            color: Color.fromARGB(
                                                138, 158, 158, 158),
                                            size: 30,
                                          ),
                                          Text(
                                            "신고하기", //개시물 신고하기
                                            style: const TextStyle(
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      )),
                                ),
                              const Divider(
                                height: 1,
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              if (isMine)
                                GestureDetector(
                                  onTap: () async {
                                    // contextb.pop();
                                    // await contexta.push('/CommunityWrite/edit',
                                    //     extra: communityData!);
                                    // communityPageController.refresh();
                                    // contexta
                                    //   ..go('/home')
                                    //   ..push(
                                    //       '/communityDetail/${communityData!.postId}');
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(15),
                                      width: MediaQuery.sizeOf(contextb).width,
                                      height: 60,
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.mode_edit_outlined,
                                            color: Color.fromARGB(
                                                138, 158, 158, 158),
                                            size: 30,
                                          ),
                                          Text(
                                            "수정하기", //게시물 수정하기
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    138, 158, 158, 158),
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      )),
                                ),
                              if (!isMine)
                                GestureDetector(
                                  onTap: () async {
                                    showDialog(
                                        context: contextb,
                                        builder: (contextc) {
                                          return AlertDialog(
                                            title: Text("차단하기"),
                                            content: Text("차단하시겠습니까?"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () async {
                                                    bool onlyDetail = true;
                                                    await showDialog(
                                                        context: contextc,
                                                        builder: (contextd) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                "사용자의 모든 글을 차단하시겠습니까?"),
                                                            actions: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    onlyDetail =
                                                                        false;
                                                                    contextd
                                                                        .pop();
                                                                  },
                                                                  child: Text(
                                                                      "차단하기")),
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    onlyDetail =
                                                                        true;
                                                                    contextd
                                                                        .pop();
                                                                  },
                                                                  child: Text(
                                                                      "아니오"))
                                                            ],
                                                          );
                                                        });

                                                    contextc.pop();
                                                    contextb.pop();
                                                    contexta.pop();
                                                    // if (onlyDetail) {
                                                    //   BlockSet()
                                                    //       .addBlockPosting(
                                                    //     postId: communityData!
                                                    //         .postId,
                                                    //     title: communityData!
                                                    //         .title,
                                                    //     authorNickname:
                                                    //         communityData!
                                                    //             .authorNickname,
                                                    //   );
                                                    // } else {
                                                    //   BlockSet().addBlockUser(
                                                    //       uniqId: communityData!
                                                    //           .userUniqId,
                                                    //       nickname: communityData!
                                                    //           .authorNickname);
                                                    // }

                                                    // communityPageController
                                                    //     .refresh();
                                                    ScaffoldMessenger.of(
                                                            contexta)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                "차단을 해제하려면 설정에서 차단을 해제해주세요")));
                                                  },
                                                  child: Text("confirm")),
                                              TextButton(
                                                  onPressed: () {
                                                    contextc.pop();
                                                  },
                                                  child: Text("cancel"))
                                            ],
                                          );
                                        });
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(15),
                                      width: MediaQuery.sizeOf(contextb).width,
                                      height: 60,
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.block_outlined,
                                            color: Color.fromARGB(
                                                138, 158, 158, 158),
                                            size: 30,
                                          ),
                                          Text(
                                            "block", //개시물 신고하기
                                            style: const TextStyle(
                                                color: Colors.pinkAccent,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      )),
                                ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                // SizedBox 대신 Container를 사용 가능
                                width: 300,
                                height: 50,
                                child: FilledButton(
                                  onPressed: () {
                                    contextb.pop();
                                  },
                                  child: Text('cancel'),
                                ),
                              )
                            ],
                          ),
                        );
                      });
                }),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(0,
              (hasPicture) ? MediaQuery.of(context).viewPadding.top : 0, 0, 65),
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                if (hasPicture)
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: 210,
                    child: Swiper(
                      pagination: SwiperCustomPagination(builder:
                          (BuildContext context, SwiperPluginConfig config) {
                        return Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                              margin:
                                  const EdgeInsets.only(bottom: 16, right: 16),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  color: Colors.black.withOpacity(0.5),
                                  height: 22,
                                  width: 41,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${config.activeIndex + 1}/${pictureCount}",
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
                      // control: const SwiperControl(),
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          pictureCount, // Assume banners is a list of your banner data.
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Stack(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 210,
                                child: ExtendedImage.network(
                                  "https://picsum.photos/seed/${index + 1}/800/600",
                                  fit: BoxFit.cover,
                                  cache: true,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            // context.push('/profileOther/${communityData!.userUniqId}');
                          },
                          child: SizedBox(
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                  child: SizedBox(
                                    // height: 56,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: CircleAvatar(
                                        radius: 24,
                                        backgroundImage:
                                            AssetImage('assets/icons/logo.png'),
                                        // ExtendedNetworkImageProvider(
                                        //     "https://picsum.photos/seed/1/800/600",
                                        //     cache: true),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // if ((communityData?.authorStatus ?? 0) == 1)
                                      // Padding(
                                      //   padding:
                                      //       const EdgeInsets.fromLTRB(4, 0, 0, 6),
                                      //   child: RoundedBackgroundText(
                                      //     (communityData!.userType == 0
                                      //             ? "foreigner"
                                      //             : "local")
                                      //         .tr(),
                                      //     style: TextStyle(
                                      //         fontSize: 12,
                                      //         color: communityData!.userType == 0
                                      //             ? AppColors.primary
                                      //             : AppColors.white),
                                      //     backgroundColor:
                                      //         communityData!.userType == 0
                                      //             ? AppColors.extraLightGrey
                                      //             : AppColors.primary,
                                      //     innerRadius: 20.0,
                                      //     outerRadius: 20.0,
                                      //   ),
                                      // ),
                                      Text("${"관리자"}",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 8),
                                        child: Text(
                                            "8시간 전", //timeDiffString(communityData!.createAt
                                            // (communityData == null)
                                            //     ? ""
                                            //     : "${communityData!.createAt.year}.${(communityData!.createAt.month < 10) ? "0${communityData!.createAt.month}" : communityData!.createAt.month}.${(communityData!.createAt.day < 10) ? "0${communityData!.createAt.day}" : communityData!.createAt.day} | ${communityData!.createAt.hour < 10 ? "0${communityData!.createAt.hour}" : communityData!.createAt.hour.toString()}:${communityData!.createAt.minute < 10 ? "0${communityData!.createAt.minute}" : communityData!.createAt.minute}",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    255, 128, 128, 128))),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                          child: Text(
                              "디지털 유산을 상속 받을 권리를 법적으로 보장해야 하는가? - (토론완료)",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SelectableText(
                                  "2024년 5월 19일 딜레마 디지털 유산을 상속 받을 권리를 법적으로 보장해야 하는가?",
                                  style: const TextStyle(
                                    fontSize: 16,
                                  )),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                      child: Container(
                                        //half of the screen
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color.fromARGB(
                                                255, 255, 158, 158)),

                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('찬성측 : 128명',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  )),
                                              Column(
                                                children: [
                                                  Text(
                                                      '디지털 유품이 반드시 일신전속권에 해당하지 않으며, 만약 해당한다고 하더라도 향수상의 일신전속권과는 달리 행사상의 일신전속권 중에는 상속이 허용되는 경우가 있기 때문에 디지털 유품 역시 상속의 대상이 될 수도 있다')
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // height: 100,
                                      //half of the screen
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          20,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color.fromARGB(
                                              255, 173, 229, 255)),

                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('반대측 : 97',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                )),
                                            Column(
                                              children: [
                                                Text(
                                                    '디지털 유품은 민법에서 규정하는 일신전속적 권리로써, 일신전속권은 일반적으로 상속이 제한되기 때문에 디지털 유품 역시 상속이 제한되어야 한다.')
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Text(
                              //     '요약 : 대다수의asdas;kdjklsdfjaklsdjfhkljszdjfkljasdklfjaskldjflkasjdfkljasldkfjlk ',
                              //     style: const TextStyle(
                              //       fontSize: 16,
                              //     )),
                            ],
                          ),
                        ),
                      ]),
                ),
                Container(
                  height: 10,
                  color: Colors.grey[300],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: SvgPicture.string(
                          reReplyButtonSvgString,
                        ),
                      ),
                      Text("$replyCount",
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 128, 128, 128))),
                    ],
                  ),
                ),
              ])),
              PagedSliverList(
                  pagingController: _replyPageController,
                  builderDelegate: PagedChildBuilderDelegate<int>(
                      noItemsFoundIndicatorBuilder: (context) => Container(),
                      itemBuilder: (context, item, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, top: 16, bottom: 16, right: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 38,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: CircleAvatar(
                                              backgroundImage:
                                                  ExtendedNetworkImageProvider(
                                                      "https://picsum.photos/seed/2/800/600",
                                                      cache: true),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text("율곡이이",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Color.fromARGB(
                                                            255, 128, 128, 128),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(right: 4),
                                        //   child: Material(
                                        //     color: Colors.transparent,
                                        //     child: InkWell(
                                        //       onTap: () {

                                        //       },
                                        //       child: Container(
                                        //         alignment: Alignment.center,
                                        //         decoration: BoxDecoration(
                                        //             borderRadius:
                                        //                 BorderRadius.circular(
                                        //                     5),
                                        //             border: Border.all(
                                        //                 color: Colors.grey)),
                                        //         width: 32,
                                        //         height: 32,
                                        //         child: SvgPicture.string(
                                        //           reReplyButtonSvgString,
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        // Material(
                                        //   color: Colors.transparent,
                                        //   child: InkWell(
                                        //     onTap: () {
                                        //       var contexta = context;
                                        //       showModalBottomSheet(
                                        //           context: contexta,
                                        //           shape: const RoundedRectangleBorder(
                                        //               borderRadius:
                                        //                   BorderRadius.only(
                                        //                       topLeft: Radius
                                        //                           .circular(10),
                                        //                       topRight: Radius
                                        //                           .circular(
                                        //                               10))),
                                        //           builder: (contextb) {
                                        //             return Container(
                                        //               padding: EdgeInsets.only(
                                        //                   top: 8,
                                        //                   bottom: MediaQuery.of(
                                        //                           contextb)
                                        //                       .viewPadding
                                        //                       .bottom),
                                        //               width: MediaQuery.of(
                                        //                       contextb)
                                        //                   .size
                                        //                   .width,
                                        //               decoration: const BoxDecoration(
                                        //                   color: Colors.white,
                                        //                   borderRadius:
                                        //                       BorderRadius.only(
                                        //                           topLeft: Radius
                                        //                               .circular(
                                        //                                   20),
                                        //                           topRight: Radius
                                        //                               .circular(
                                        //                                   20))),
                                        //               child: Column(
                                        //                 mainAxisSize:
                                        //                     MainAxisSize.min,
                                        //                 children: [
                                        //                   Container(
                                        //                     width: 100,
                                        //                     height: 3,
                                        //                     decoration:
                                        //                         const BoxDecoration(
                                        //                       color:
                                        //                           Colors.grey,
                                        //                     ),
                                        //                   ),
                                        //                   const SizedBox(
                                        //                     height: 25,
                                        //                   ),
                                        //                   if (isMine)
                                        //                     GestureDetector(
                                        //                       onTap: () async {
                                        //                         contextb.pop();
                                        //                       },
                                        //                       child: Container(
                                        //                           padding:
                                        //                               const EdgeInsets
                                        //                                   .all(
                                        //                                   15),
                                        //                           width: MediaQuery
                                        //                                   .sizeOf(
                                        //                                       contextb)
                                        //                               .width,
                                        //                           height: 60,
                                        //                           child: Row(
                                        //                             children: [
                                        //                               const Icon(
                                        //                                 Icons
                                        //                                     .delete_outline_rounded,
                                        //                                 color: Colors
                                        //                                     .redAccent,
                                        //                                 size:
                                        //                                     30,
                                        //                               ),
                                        //                               Text(
                                        //                                 "reply_delete",
                                        //                                 style: const TextStyle(
                                        //                                     color:
                                        //                                         Colors.redAccent,
                                        //                                     fontWeight: FontWeight.w700),
                                        //                               )
                                        //                             ],
                                        //                           )),
                                        //                     ),
                                        //                   if (!isMine)
                                        //                     GestureDetector(
                                        //                       onTap: () async {
                                        //                         contextb.pop();
                                        //                       },
                                        //                       child: Container(
                                        //                           padding:
                                        //                               const EdgeInsets
                                        //                                   .all(
                                        //                                   15),
                                        //                           width: MediaQuery
                                        //                                   .sizeOf(
                                        //                                       contextb)
                                        //                               .width,
                                        //                           height: 60,
                                        //                           child: Row(
                                        //                             children: [
                                        //                               const Icon(
                                        //                                 Icons
                                        //                                     .report_outlined,
                                        //                                 color: Color.fromARGB(
                                        //                                     138,
                                        //                                     158,
                                        //                                     158,
                                        //                                     158),
                                        //                                 size:
                                        //                                     30,
                                        //                               ),
                                        //                               Text(
                                        //                                 "report", //개시물 신고하기
                                        //                                 style: const TextStyle(
                                        //                                     color:
                                        //                                         Colors.redAccent,
                                        //                                     fontWeight: FontWeight.w700),
                                        //                               )
                                        //                             ],
                                        //                           )),
                                        //                     ),
                                        //                   const Divider(
                                        //                     height: 1,
                                        //                     thickness: 1,
                                        //                     color: Colors.grey,
                                        //                   ),
                                        //                   // if (item.userUniqId !=
                                        //                   //     Token()
                                        //                   //         .userUniqId)
                                        //                   //   GestureDetector(
                                        //                   //     onTap:
                                        //                   //         () async {
                                        //                   //       showDialog(
                                        //                   //           context:
                                        //                   //               contextb,
                                        //                   //           builder:
                                        //                   //               (contextc) {
                                        //                   //             return AlertDialog(
                                        //                   //               title:
                                        //                   //                   Text("block".tr()),
                                        //                   //               content:
                                        //                   //                   Text("block_meeting".tr()),
                                        //                   //               actions: [
                                        //                   //                 TextButton(
                                        //                   //                     onPressed: () async {
                                        //                   //                       bool onlyDetail = true;
                                        //                   //                       await showDialog(
                                        //                   //                           context: contextc,
                                        //                   //                           builder: (contextd) {
                                        //                   //                             return AlertDialog(
                                        //                   //                               content: Text("block_additional".tr()),
                                        //                   //                               actions: [
                                        //                   //                                 TextButton(
                                        //                   //                                     onPressed: () {
                                        //                   //                                       onlyDetail = false;
                                        //                   //                                       contextd.pop();
                                        //                   //                                     },
                                        //                   //                                     child: Text("block".tr())),
                                        //                   //                                 TextButton(
                                        //                   //                                     onPressed: () {
                                        //                   //                                       onlyDetail = true;
                                        //                   //                                       contextd.pop();
                                        //                   //                                     },
                                        //                   //                                     child: Text("no".tr()))
                                        //                   //                               ],
                                        //                   //                             );
                                        //                   //                           });

                                        //                   //                       contextc.pop();
                                        //                   //                       contextb.pop();
                                        //                   //                       contexta.pop();
                                        //                   //                       if (onlyDetail) {
                                        //                   //                         // CommunityBlockSet().addBlockMeeting(
                                        //                   //                         //   postId: communityData!.postId,
                                        //                   //                         //   title: communityData!.title,
                                        //                   //                         //   authorNickname: communityData!.authorNickname,
                                        //                   //                         // );
                                        //                   //                       } else {
                                        //                   //                         // CommunityBlockSet().addBlockUser(uniqId: communityData!.userUniqId, nickname: communityData!.authorNickname);
                                        //                   //                       }

                                        //                   //                       communityPageController.refresh();
                                        //                   //                       ScaffoldMessenger.of(contexta).showSnackBar(SnackBar(content: Text("unblock_message".tr())));
                                        //                   //                     },
                                        //                   //                     child: Text("confirm".tr())),
                                        //                   //                 TextButton(
                                        //                   //                     onPressed: () {
                                        //                   //                       contextc.pop();
                                        //                   //                     },
                                        //                   //                     child: Text("cancel".tr()))
                                        //                   //               ],
                                        //                   //             );
                                        //                   //           });
                                        //                   //     },
                                        //                   //     child:
                                        //                   //         Container(
                                        //                   //             padding: const EdgeInsets
                                        //                   //                 .all(
                                        //                   //                 15),
                                        //                   //             width: MediaQuery.sizeOf(contextb)
                                        //                   //                 .width,
                                        //                   //             height:
                                        //                   //                 60,
                                        //                   //             child:
                                        //                   //                 Row(
                                        //                   //               children: [
                                        //                   //                 const Icon(
                                        //                   //                   Icons.block_outlined,
                                        //                   //                   color: Color.fromARGB(138, 158, 158, 158),
                                        //                   //                   size: 30,
                                        //                   //                 ),
                                        //                   //                 Text(
                                        //                   //                   "block".tr(), //개시물 신고하기
                                        //                   //                   style: const TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.w700),
                                        //                   //                 )
                                        //                   //               ],
                                        //                   //             )),
                                        //                   //   ),
                                        //                   const SizedBox(
                                        //                     height: 20,
                                        //                   ),
                                        //                   SizedBox(
                                        //                     // SizedBox 대신 Container를 사용 가능
                                        //                     width: 300,
                                        //                     height: 50,
                                        //                     child: FilledButton(
                                        //                       onPressed: () {
                                        //                         contextb.pop();
                                        //                       },
                                        //                       child: Text(
                                        //                           'cancel'),
                                        //                     ),
                                        //                   )
                                        //                 ],
                                        //               ),
                                        //             );
                                        //           });
                                        //     },
                                        //     child: Container(
                                        //       alignment: Alignment.center,
                                        //       decoration: BoxDecoration(
                                        //           borderRadius:
                                        //               BorderRadius.circular(5),
                                        //           border: Border.all(
                                        //               color: Colors.grey)),
                                        //       width: 32,
                                        //       height: 32,
                                        //       child: const Icon(
                                        //         CupertinoIcons.ellipsis,
                                        //         color: Colors.grey,
                                        //       ),
                                        //     ),
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                    child: Text(
                                      //item.content,
                                      "좋은 정보 감사합니다",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //대댓글
                            const CommunityDetailReply(
                              isMine: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const CommunityDetailReply(
                              isMine: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const CommunityDetailReply(
                              isMine: true,
                            ),
                          ],
                        );
                      }))
            ],
          ),
        ),
        // bottomSheet: Container(
        //   height: 60,
        //   decoration: const BoxDecoration(color: Colors.white),
        //   margin: const EdgeInsets.only(top: 8),
        //   padding: const EdgeInsets.all(8),
        //   child: Row(
        //     children: [
        //       Expanded(
        //           child: TextField(
        //         controller: _replyInputController,
        //         style: const TextStyle(fontSize: 15),
        //         decoration: InputDecoration(
        //             isDense: true,
        //             contentPadding: const EdgeInsets.all(8),
        //             filled: true,
        //             fillColor: const Color.fromARGB(97, 158, 158, 158),
        //             hintText: "reply_enter_hint",
        //             hintStyle:
        //                 const TextStyle(fontSize: 15, color: Colors.grey),
        //             border: const OutlineInputBorder(
        //                 borderSide: BorderSide.none,
        //                 borderRadius: BorderRadius.all(Radius.circular(20)))),
        //         maxLines: null,
        //       )),
        //       IconButton(
        //         onPressed: () async {
        //           if (_replyInputController.text.isNotEmpty) {
        //             // await _replySend(content: _replyInputController.text);
        //             _replyInputController.clear();
        //           }
        //         },
        //         icon: const Icon(CupertinoIcons.paperplane_fill),
        //         color: Colors.blue,
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
