import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommunityDetailReply extends StatelessWidget {
  const CommunityDetailReply({super.key, required this.isMine});

  final bool isMine;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.arrow_right_alt,
          color: Colors.grey,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, top: 8, bottom: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 38,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CircleAvatar(
                                backgroundImage: ExtendedNetworkImageProvider(
                                    "https://picsum.photos/seed/1/800/600",
                                    cache: true),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("item.authorNickname",
                                        overflow: TextOverflow.ellipsis,
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
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
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
                                            bottom: MediaQuery.of(contextb)
                                                .viewPadding
                                                .bottom),
                                        width:
                                            MediaQuery.of(contextb).size.width,
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
                                            if (isMine)
                                              GestureDetector(
                                                onTap: () async {
                                                  contextb.pop();
                                                },
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    width: MediaQuery.sizeOf(
                                                            contextb)
                                                        .width,
                                                    height: 60,
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .delete_outline_rounded,
                                                          color:
                                                              Colors.redAccent,
                                                          size: 30,
                                                        ),
                                                        Text(
                                                          "reply_delete",
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .redAccent,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        )
                                                      ],
                                                    )),
                                              ),
                                            if (!isMine)
                                              GestureDetector(
                                                onTap: () async {
                                                  contextb.pop();
                                                },
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    width: MediaQuery.sizeOf(
                                                            contextb)
                                                        .width,
                                                    height: 60,
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.report_outlined,
                                                          color: Color.fromARGB(
                                                              138,
                                                              158,
                                                              158,
                                                              158),
                                                          size: 30,
                                                        ),
                                                        Text(
                                                          "report", //개시물 신고하기
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .redAccent,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        )
                                                      ],
                                                    )),
                                              ),
                                            const Divider(
                                              height: 1,
                                              thickness: 1,
                                              color: Colors.grey,
                                            ),
                                            // if (item.userUniqId !=
                                            //     Token()
                                            //         .userUniqId)
                                            //   GestureDetector(
                                            //     onTap:
                                            //         () async {
                                            //       showDialog(
                                            //           context:
                                            //               contextb,
                                            //           builder:
                                            //               (contextc) {
                                            //             return AlertDialog(
                                            //               title:
                                            //                   Text("block".tr()),
                                            //               content:
                                            //                   Text("block_meeting".tr()),
                                            //               actions: [
                                            //                 TextButton(
                                            //                     onPressed: () async {
                                            //                       bool onlyDetail = true;
                                            //                       await showDialog(
                                            //                           context: contextc,
                                            //                           builder: (contextd) {
                                            //                             return AlertDialog(
                                            //                               content: Text("block_additional".tr()),
                                            //                               actions: [
                                            //                                 TextButton(
                                            //                                     onPressed: () {
                                            //                                       onlyDetail = false;
                                            //                                       contextd.pop();
                                            //                                     },
                                            //                                     child: Text("block".tr())),
                                            //                                 TextButton(
                                            //                                     onPressed: () {
                                            //                                       onlyDetail = true;
                                            //                                       contextd.pop();
                                            //                                     },
                                            //                                     child: Text("no".tr()))
                                            //                               ],
                                            //                             );
                                            //                           });

                                            //                       contextc.pop();
                                            //                       contextb.pop();
                                            //                       contexta.pop();
                                            //                       if (onlyDetail) {
                                            //                         // CommunityBlockSet().addBlockMeeting(
                                            //                         //   postId: communityData!.postId,
                                            //                         //   title: communityData!.title,
                                            //                         //   authorNickname: communityData!.authorNickname,
                                            //                         // );
                                            //                       } else {
                                            //                         // CommunityBlockSet().addBlockUser(uniqId: communityData!.userUniqId, nickname: communityData!.authorNickname);
                                            //                       }

                                            //                       communityPageController.refresh();
                                            //                       ScaffoldMessenger.of(contexta).showSnackBar(SnackBar(content: Text("unblock_message".tr())));
                                            //                     },
                                            //                     child: Text("confirm".tr())),
                                            //                 TextButton(
                                            //                     onPressed: () {
                                            //                       contextc.pop();
                                            //                     },
                                            //                     child: Text("cancel".tr()))
                                            //               ],
                                            //             );
                                            //           });
                                            //     },
                                            //     child:
                                            //         Container(
                                            //             padding: const EdgeInsets
                                            //                 .all(
                                            //                 15),
                                            //             width: MediaQuery.sizeOf(contextb)
                                            //                 .width,
                                            //             height:
                                            //                 60,
                                            //             child:
                                            //                 Row(
                                            //               children: [
                                            //                 const Icon(
                                            //                   Icons.block_outlined,
                                            //                   color: Color.fromARGB(138, 158, 158, 158),
                                            //                   size: 30,
                                            //                 ),
                                            //                 Text(
                                            //                   "block".tr(), //개시물 신고하기
                                            //                   style: const TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.w700),
                                            //                 )
                                            //               ],
                                            //             )),
                                            //   ),
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
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.grey)),
                                width: 32,
                                height: 32,
                                child: const Icon(
                                  CupertinoIcons.ellipsis,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Text(
                        //item.content,
                        "item.content",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
