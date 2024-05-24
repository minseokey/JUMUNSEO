import 'dart:async';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:jumunseo/core/logger.dart';
import 'package:jumunseo/features/dilemma/chat/model/dilemma_chat_model.dart';
import 'package:jumunseo/features/wizard/chat/view/room_list_select.dart';
import 'package:lottie/lottie.dart';
import 'package:yoda/yoda.dart';

enum RoomStatus { idle, selected, chatting }

class DilemmaChatScreen extends StatefulWidget {
  const DilemmaChatScreen({super.key, required this.roomId});

  final String roomId;

  @override
  State<DilemmaChatScreen> createState() => _DilemmaChatScreenState();
}

class DilemmaChatTest {
  DilemmaChatModel receiveChat;
  DateTime receiveTime;
  ChatType chatType;
  String imageUrl;

  DilemmaChatTest(
      {required this.receiveChat,
      required this.receiveTime,
      required this.chatType,
      required this.imageUrl});
}

class _DilemmaChatScreenState extends State<DilemmaChatScreen> {
  final PagingController<int, DilemmaChatTest> _pagingController =
      PagingController(firstPageKey: 0);
  static const _pageSize = 100;

  RoomStatus _roomStatus = RoomStatus.idle;
  bool _isRightPunch = true;
  DilemmaChatTest? _recentChat;

  String? _selectedValue;

  TextEditingController _textEditingController = TextEditingController();

  late final YodaController _yodaController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    // _pagingController.addListener(() {
    //   logger.d('listener');
    // });
    _yodaController = YodaController()
      ..addStatusListener((status, context) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _roomStatus = RoomStatus.chatting;
          });
        }
      });

    Future.delayed(Duration(seconds: 14), () {
      _pagingController.itemList!.insert(
          0,
          DilemmaChatTest(
              receiveChat: DilemmaChatModel(
                  userEmail: '영희', content: 'ㅇㅈ', side: "RIGHT", type: ''),
              receiveTime: DateTime.now(),
              chatType: ChatType.text,
              imageUrl:
                  "https://cdn-icons-png.flaticon.com/512/3135/3135823.png"));
      _pagingController.notifyListeners();
    });

    Future.delayed(Duration(seconds: 16), () {
      _pagingController.itemList!.insert(
        0,
        DilemmaChatTest(
            receiveChat: DilemmaChatModel(
                userEmail: '영희',
                content: '그리고 정부를 어떻게 믿어?',
                side: "RIGHT",
                type: ''),
            receiveTime: DateTime.now(),
            chatType: ChatType.text,
            imageUrl:
                "https://cdn-icons-png.flaticon.com/512/3135/3135823.png"),
      );
      _pagingController.notifyListeners();
    });

    Future.delayed(Duration(seconds: 18), () {
      _pagingController.itemList!.insert(
        0,
        DilemmaChatTest(
            receiveChat: DilemmaChatModel(
                userEmail: '홍길동',
                content:
                    '자유가 중요하긴 해도 국가의 존립 이유가 국민을 지키기 위함이기 때문에 어느정도의 정보는 안보를 위해 필요하다고 생각해',
                side: "LEFT",
                type: ''),
            receiveTime: DateTime.now(),
            chatType: ChatType.text,
            imageUrl:
                "https://cdn-icons-png.flaticon.com/256/3135/3135768.png"),
      );
      _pagingController.notifyListeners();
    });
    Future.delayed(Duration(seconds: 20), () {
      _pagingController.itemList!.insert(
        0,
        DilemmaChatTest(
            receiveChat: DilemmaChatModel(
                userEmail: '홍길동',
                content:
                    '만약 테러리스트가 도시에 폭탄을 터트리는 등의 사건이 발생했을 때, 정부만은 그 정보를 갖고서 국민을 지키기 위해 필요한 조치를 취할 수 있도록 해야하지 않을까?',
                side: "LEFT",
                type: ''),
            receiveTime: DateTime.now(),
            chatType: ChatType.text,
            imageUrl:
                "https://cdn-icons-png.flaticon.com/256/3135/3135768.png"),
      );
      _pagingController.notifyListeners();
    });
    Future.delayed(Duration(seconds: 23), () {
      _pagingController.itemList!.insert(
        0,
        DilemmaChatTest(
            receiveChat: DilemmaChatModel(
                userEmail: '홍길동',
                content:
                    '정부가 취득한 정보가 다른 주체에게 넘어가거나 유출되는 것을 막기 위한 장치들이 확실히 마련 되어야 겠지',
                side: "LEFT",
                type: ''),
            receiveTime: DateTime.now(),
            chatType: ChatType.text,
            imageUrl:
                "https://cdn-icons-png.flaticon.com/256/3135/3135768.png"),
      );
      _pagingController.notifyListeners();
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    _pagingController.appendLastPage([]);
    // try {
    //   final newItems = await Future.delayed(Duration(seconds: 0), () {
    //     return [
    //       DilemmaChatTest(
    //           receiveChat: DilemmaChatModel(
    //               userEmail: '홍길동',
    //               content: 'real Message',
    //               side: "LEFT",
    //               type: ''),
    //           receiveTime: DateTime.now(),
    //           chatType: ChatType.text,
    //           imageUrl:
    //               "https://cdn-icons-png.flaticon.com/256/3135/3135768.png"),
    //       DilemmaChatTest(
    //           receiveChat: DilemmaChatModel(
    //               userEmail: '홍길동',
    //               content: 'real Message',
    //               side: "LEFT",
    //               type: ''),
    //           receiveTime: DateTime.now(),
    //           chatType: ChatType.text,
    //           imageUrl:
    //               "https://cdn-icons-png.flaticon.com/256/3135/3135768.png"),
    //       DilemmaChatTest(
    //           receiveChat: DilemmaChatModel(
    //               userEmail: '엄정화',
    //               content: 'real Message',
    //               side: "RIGHT",
    //               type: ''),
    //           receiveTime: DateTime.now(),
    //           chatType: ChatType.text,
    //           imageUrl:
    //               "https://cdn-icons-png.flaticon.com/512/3135/3135823.png"),
    //       DilemmaChatTest(
    //           receiveChat: DilemmaChatModel(
    //               userEmail: '영희',
    //               content: 'real Message',
    //               side: "RIGHT",
    //               type: ''),
    //           receiveTime: DateTime.now(),
    //           chatType: ChatType.text,
    //           imageUrl:
    //               "https://cdn-icons-png.flaticon.com/512/3135/3135823.png"),
    //       DilemmaChatTest(
    //           receiveChat: DilemmaChatModel(
    //               userEmail: 'me',
    //               content: 'real Message',
    //               side: "RIGHT",
    //               type: ''),
    //           receiveTime: DateTime.now(),
    //           chatType: ChatType.text,
    //           imageUrl:
    //               "https://cdn-icons-png.flaticon.com/512/3135/3135823.png"),
    //     ];
    //   });

    //   final isLastPage = newItems.length < _pageSize;
    //   if (isLastPage) {
    //     _pagingController.appendLastPage(newItems);
    //   } else {
    //     final nextPageKey = pageKey + 1;
    //     _pagingController.appendPage(newItems, nextPageKey);
    //   }
    // } catch (error) {
    //   _pagingController.error = error;
    // }
  }

  @override
  Widget build(BuildContext context) {
    logger.d('build');
    // _pagingController.itemList = [
    //   DilemmaChatTest(
    //       receiveChat: DilemmaChatModel(
    //           userEmail: 'me',
    //           content:
    //               '이미 거대 정보를 가진 주체가 그것을 악용하는 것을 막는 거는 고사하고 개인이 그걸 알 수 조차나 있을까?',
    //           side: "RIGHT",
    //           type: ''),
    //       receiveTime: DateTime.now(),
    //       chatType: ChatType.text,
    //       imageUrl: "https://cdn-icons-png.flaticon.com/512/3135/3135823.png"),
    //   DilemmaChatTest(
    //       receiveChat: DilemmaChatModel(
    //           userEmail: 'me',
    //           content: '내 개인정보를 다른 주체가 그것이 정부라 하더라도 공유되는 것을 반대해',
    //           side: "RIGHT",
    //           type: ''),
    //       receiveTime: DateTime.now(),
    //       chatType: ChatType.text,
    //       imageUrl: "https://cdn-icons-png.flaticon.com/512/3135/3135823.png"),
    //   DilemmaChatTest(
    //       receiveChat: DilemmaChatModel(
    //           userEmail: 'me',
    //           content: '나는 자유를 최우선 가치로 여기기 때문에',
    //           side: "RIGHT",
    //           type: ''),
    //       receiveTime: DateTime.now(),
    //       chatType: ChatType.text,
    //       imageUrl: "https://cdn-icons-png.flaticon.com/512/3135/3135823.png"),
    // ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
            // _pagingController.refresh();
          },
        ),
        title: Row(
          children: [
            Expanded(
                child: Text('개인이 소유한 데이터는 정부에 의해 자동으로 공유되어야 하는가?',
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold))),
            GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          // 오늘의 주제
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(16.0),
                                child: Text('오늘의 주제',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                    '개인이 소유한 데이터는 정부에 의해 자동으로 공유되어야 하는가?',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        );
                      });
                },
                child: Icon(Icons.keyboard_arrow_down)),
            Text('32',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey))
          ],
        ),
        elevation: 20,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.list),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PagedListView<int, DilemmaChatTest>(
              reverse: true,
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<DilemmaChatTest>(
                noItemsFoundIndicatorBuilder: (context) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('아직 채팅이 없습니다.')],
                    ),
                  );
                },
                itemBuilder: (context, item, index) {
                  final _list = _pagingController.itemList!;
                  final _upperChat = _list[
                      index == _list.length - 1 ? _list.length - 1 : index + 1];
                  final _lowerChat = _list[index == 0 ? 0 : index - 1];

                  List<Widget> _widgetList = [
                    if (_upperChat.receiveTime.day != item.receiveTime.day)
                      Text(_upperChat.receiveTime.toString()),
                  ];

                  switch (item.chatType) {
                    // case "TEXT":
                    //   _widgetList.add(DilemmaChatTextListItem(
                    //     currentChat: item,
                    //     upperChat: _upperChat,
                    //     lowerChat: _lowerChat,
                    //   ));
                    //   break;
                    // case "IMAGE":
                    //   // TODO: Handle this case.
                    //   break;
                    // case "WARNING":
                    //   // TODO: Handle this case.
                    //   _widgetList
                    //       .add(DilemmaChatWarningItem(currentChat: item));
                    //   break;
                    // case "NOTICE":
                    //   // TODO: Handle this case.
                    //   _widgetList.add(DilemmaChatNoticeItem(currentChat: item));
                    //   break;
                    case ChatType.text:
                      _widgetList.add(DilemmaChatTextListItem(
                        currentChat: item,
                        upperChat: _upperChat,
                        lowerChat: _lowerChat,
                      ));
                      break;
                    case ChatType.image:
                      // TODO: Handle this case.
                      break;
                    case ChatType.warning:
                      // TODO: Handle this case.
                      break;
                    case ChatType.notice:
                      // TODO: Handle this case.
                      break;
                  }

                  return Column(
                    children: _widgetList,
                  );
                },
              ),
            ),
          ),
          Row(
            children: [
              switch (_roomStatus) {
                RoomStatus.idle => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromARGB(255, 255, 158, 158))),
                              onPressed: () {
                                setState(() {
                                  _isRightPunch = true;
                                  _roomStatus = RoomStatus.selected;
                                  Timer(Duration(milliseconds: 3500), () {
                                    _yodaController.start();
                                  });
                                });
                              },
                              child: Text('찬성')),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromARGB(255, 173, 229, 255))),
                              onPressed: () {
                                setState(() {
                                  _isRightPunch = false;
                                  _roomStatus = RoomStatus.chatting;
                                });
                              },
                              child: Text('반대')),
                        ],
                      ),
                    ),
                  ),
                RoomStatus.selected => Expanded(
                    child: Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // ElevatedButton(
                            //     onPressed: () {}, child: Text('1번 선택')),
                            PunchAnimationWidget(
                              isRightPunch: _isRightPunch,
                            ),
                            Yoda(
                              yodaEffect: YodaEffect.Explosion,
                              controller: _yodaController,
                              animParameters: AnimParameters(
                                  yodaBarrier: const YodaBarrier(),
                                  fractionalCenter: const Offset(0.5, 1.0),
                                  hTiles: 20,
                                  vTiles: 20,
                                  effectPower: 0,
                                  gravity: 2,
                                  blurPower: 0,
                                  randomness: 80),
                              child: ElevatedButton(
                                  onPressed: () {}, child: Text('반대')),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                RoomStatus.chatting => Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(21.0, 0, 21.0, 36.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          //채팅을 치는 텍스트 필드, 전송 버튼 구분 로우
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                controller: _textEditingController,
                                decoration: const InputDecoration(
                                  hintText: "Write additional message",
                                  hintStyle: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(
                                          0xff, 0xa1, 0xa1, 0xa1)),
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                ),
                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                maxLines: 7,
                                onSubmitted: (String text) {},
                              )),
                              GestureDetector(
                                child: Image.asset(
                                  'assets/images/send.png',
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                onTap: () {
                                  _pagingController.itemList!.insert(
                                    0,
                                    DilemmaChatTest(
                                        receiveChat: DilemmaChatModel(
                                            userEmail: 'me',
                                            content:
                                                _textEditingController.text,
                                            side: "RIGHT",
                                            type: ''),
                                        receiveTime: DateTime.now(),
                                        chatType: ChatType.text,
                                        imageUrl:
                                            "https://cdn-icons-png.flaticon.com/512/3135/3135823.png"),
                                  );

                                  _textEditingController.clear();

                                  _pagingController.notifyListeners();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                // Expanded(
                //     child: Row(
                //       children: [
                //         Expanded(
                //           child: TextField(
                //             decoration: InputDecoration(
                //               hintText: '메시지를 입력하세요',
                //             ),
                //           ),
                //         ),
                //         DropdownButton<String>(
                //           value: _selectedValue,
                //           items: [
                //             DropdownMenuItem(
                //               child: Text('left'),
                //               value: 'left',
                //             ),
                //             DropdownMenuItem(
                //               child: Text('right'),
                //               value: 'right',
                //             ),
                //             DropdownMenuItem(
                //               child: Text('leftMe'),
                //               value: 'leftMe',
                //             ),
                //             DropdownMenuItem(
                //               child: Text('rightMe'),
                //               value: 'rightMe',
                //             ),
                //             DropdownMenuItem(
                //               child: Text('warn'),
                //               value: 'warn',
                //             ),
                //             DropdownMenuItem(
                //               child: Text('notice'),
                //               value: 'notice',
                //             ),
                //           ],
                //           onChanged: (value) {
                //             _selectedValue = value;
                //             logger.i(value);
                //           },
                //           onTap: () {
                //             logger.i('tap');
                //             switch (_selectedValue) {
                //               case 'left':
                //                 // _pagingController.itemList!.insert(
                //                 //   0,
                //                 //   DilemmaChatModel(
                //                 //       userEmail: 'real User',
                //                 //       content: 'real Message',
                //                 //       type: 'TEXT',
                //                 //       id: 1,
                //                 //       side: "LEFT"),
                //                 // );
                //                 _pagingController.notifyListeners();
                //                 break;
                //               case 'right':
                //                 // _pagingController.itemList!.insert(
                //                 //   0,
                //                 //   DilemmaChatModel(
                //                 //       userEmail: 'real User',
                //                 //       content: 'real Message',
                //                 //       type: 'TEXT',
                //                 //       id: 1,
                //                 //       side: "RIGHT"),
                //                 // );
                //                 _pagingController.notifyListeners();
                //                 break;
                //               case 'leftMe':
                //                 // _pagingController.itemList!.insert(
                //                 //   0,
                //                 //   DilemmaChatModel(
                //                 //       userEmail: 'me',
                //                 //       content: 'real Message',
                //                 //       type: 'TEXT',
                //                 //       id: 1,
                //                 //       side: "LEFT"),
                //                 // );
                //                 _pagingController.notifyListeners();
                //                 break;
                //               case 'rightMe':
                //                 // _pagingController.itemList!.insert(
                //                 //   0,
                //                 //   DilemmaChatModel(
                //                 //       userEmail: 'me',
                //                 //       content: 'real Message',
                //                 //       type: 'TEXT',
                //                 //       id: 1,
                //                 //       side: "RIGHT"),
                //                 // );
                //                 _pagingController.notifyListeners();
                //                 break;
                //               case 'warn':
                //                 // _pagingController.itemList!.insert(
                //                 //   0,
                //                 //   DilemmaChatModel(
                //                 //       userName: 'me',
                //                 //       message: 'real Message',
                //                 //       sendTime: DateTime.now()
                //                 //           .add(Duration(days: 2)),
                //                 //       userId: 'userId',
                //                 //       chatType: ChatType.warning,
                //                 //       isleft: false),
                //                 // );
                //                 _pagingController.notifyListeners();
                //                 break;
                //               case 'notice':
                //                 // _pagingController.itemList!.insert(
                //                 //   0,
                //                 //   DilemmaChatModel(
                //                 //       userName: 'me',
                //                 //       message: 'real Message',
                //                 //       sendTime: DateTime.now()
                //                 //           .add(Duration(days: 2)),
                //                 //       userId: 'userId',
                //                 //       chatType: ChatType.notice,
                //                 //       isleft: false),
                //                 // );
                //                 _pagingController.notifyListeners();
                //                 break;
                //             }
                //           },
                //         )
                //       ],
                //     ),
                //   )
              }
            ],
          )
        ],
      ),
    );
  }
}

class DilemmaChatTextListItem extends StatelessWidget {
  const DilemmaChatTextListItem(
      {super.key,
      required this.currentChat,
      required this.upperChat,
      required this.lowerChat});

  final DilemmaChatTest currentChat;
  final DilemmaChatTest upperChat;
  final DilemmaChatTest lowerChat;
  final bool isMe = false;

  @override
  Widget build(BuildContext context) {
    if (currentChat.receiveChat.side == "LEFT") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ((currentChat.receiveChat.userEmail !=
                          upperChat.receiveChat.userEmail ||
                      currentChat.receiveChat.side !=
                          upperChat.receiveChat.side) &&
                  currentChat.receiveChat.userEmail != "me")
              ? DilemmaChatUserImageItem(
                  imageUrl: currentChat.imageUrl,
                )
              : SizedBox(
                  width: 56,
                ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if ((currentChat.receiveChat.userEmail !=
                            upperChat.receiveChat.userEmail ||
                        currentChat.receiveChat.side !=
                            upperChat.receiveChat.side) &&
                    currentChat.receiveChat.userEmail != "me")
                  Container(
                      constraints: BoxConstraints(maxWidth: 250),
                      child: Text(
                        currentChat.receiveChat.userEmail,
                        maxLines: 1,
                      )),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DilemmaChatMessageItem(
                      messageText: currentChat.receiveChat.content!,
                      backgroundColor: currentChat.receiveChat.userEmail == "me"
                          ? Color.fromARGB(255, 247, 227, 53)
                          : Color.fromARGB(255, 255, 158, 158),
                      side: currentChat.receiveChat.side,
                    ),
                    if (!(currentChat.receiveChat.userEmail ==
                                lowerChat.receiveChat.userEmail &&
                            currentChat.receiveTime
                                    .difference(lowerChat.receiveTime)
                                    .inMinutes <
                                1) &&
                        currentChat.receiveChat.side !=
                            lowerChat.receiveChat.side)
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: DilemmaChatTimeItem(
                          sendTime: currentChat.receiveTime,
                        ),
                      )
                  ],
                )
              ],
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if ((currentChat.receiveChat.userEmail !=
                            upperChat.receiveChat.userEmail ||
                        currentChat.receiveChat.side !=
                            upperChat.receiveChat.side) &&
                    currentChat.receiveChat.userEmail != "me")
                  Container(
                      constraints: BoxConstraints(maxWidth: 250),
                      child: Text(
                        currentChat.receiveChat.userEmail,
                        maxLines: 1,
                      )),
                Row(
                  children: [
                    if ((!(currentChat.receiveChat.userEmail ==
                                lowerChat.receiveChat.userEmail &&
                            currentChat.receiveTime
                                    .difference(lowerChat.receiveTime)
                                    .inMinutes <
                                1) &&
                        currentChat.receiveChat.side !=
                            lowerChat.receiveChat.side))
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: DilemmaChatTimeItem(
                          sendTime: currentChat.receiveTime,
                        ),
                      ),
                    DilemmaChatMessageItem(
                      messageText: currentChat.receiveChat.content!,
                      backgroundColor: currentChat.receiveChat.userEmail == "me"
                          ? Color.fromARGB(255, 247, 227, 53)
                          : Color.fromARGB(255, 173, 229, 255),
                      side: currentChat.receiveChat.side,
                    ),
                  ],
                )
              ],
            ),
          ),
          ((currentChat.receiveChat.userEmail !=
                          upperChat.receiveChat.userEmail ||
                      currentChat.receiveChat.side !=
                          upperChat.receiveChat.side) &&
                  currentChat.receiveChat.userEmail != "me")
              ? DilemmaChatUserImageItem(
                  imageUrl: currentChat.imageUrl,
                )
              : SizedBox(
                  width: 56,
                ),
        ],
      );
    }
  }
}

class DilemmaChatUserImageItem extends StatelessWidget {
  const DilemmaChatUserImageItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExtendedImage.network(
        imageUrl,
        fit: BoxFit.cover,
        height: 40,
        width: 40,
        borderRadius: BorderRadius.all(Radius.circular(7)),
        shape: BoxShape.rectangle,
      ),
      // CircleAvatar(
      //     radius: 17,
      //     backgroundImage: ExtendedNetworkImageProvider(
      //       imageUrl,
      //       cache: true,
      //     )),
    );
  }
}

class DilemmaChatMessageItem extends StatelessWidget {
  const DilemmaChatMessageItem(
      {super.key,
      required this.messageText,
      required this.backgroundColor,
      required this.side});

  final String messageText;
  final Color backgroundColor;
  final String side;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxWidth: 250.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: side == "LEFT"
              ? BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0))
              : BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0)),
        ),
        child: Padding(padding: EdgeInsets.all(8), child: Text(messageText)));
  }
}

class DilemmaChatTimeItem extends StatelessWidget {
  const DilemmaChatTimeItem({super.key, required this.sendTime});

  final DateTime sendTime;

  @override
  Widget build(BuildContext context) {
    logger.i("current locale : ${Localizations.localeOf(context)}");
    return Text(DateFormat.jm('ko').format(sendTime));
  }
}

class DilemmaChatWarningItem extends StatelessWidget {
  const DilemmaChatWarningItem({super.key, required this.currentChat});

  final DilemmaChatModel currentChat;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text('경고 : ${currentChat.content}'),
    );
  }
}

class DilemmaChatNoticeItem extends StatelessWidget {
  const DilemmaChatNoticeItem({super.key, required this.currentChat});

  final DilemmaChatModel currentChat;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Text('공지 ${currentChat.content}'),
    );
  }
}

class PunchAnimationWidget extends StatelessWidget {
  const PunchAnimationWidget({super.key, required this.isRightPunch});

  final bool isRightPunch;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
        quarterTurns: isRightPunch ? 1 : 3,
        child: Lottie.asset(
          'assets/animations/punch_lottie.json',
          repeat: false,
          onLoaded: (p0) {},
        ));
  }
}
