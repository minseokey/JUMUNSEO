import 'dart:async';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:jumunseo/core/logger.dart';
import 'package:jumunseo/features/dilemma/chat/model/dilemma_chat_model.dart';
import 'package:jumunseo/features/wizard/chat/view/room_list_select.dart';
import 'package:lottie/lottie.dart';
import 'package:yoda/yoda.dart';

enum RoomStatus { idle, selected, chatting }

class DilemmaChatScreen extends StatefulWidget {
  const DilemmaChatScreen({super.key});

  @override
  State<DilemmaChatScreen> createState() => _DilemmaChatScreenState();
}

class _DilemmaChatScreenState extends State<DilemmaChatScreen> {
  final PagingController<int, DilemmaChatModel> _pagingController =
      PagingController(firstPageKey: 0);
  static const _pageSize = 10;

  RoomStatus _roomStatus = RoomStatus.idle;
  bool _isRightPunch = true;
  DilemmaChatModel? _recentChat;

  String? _selectedValue;

  late final YodaController _yodaController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    _pagingController.addListener(() {
      logger.d('listener');
    });
    _yodaController = YodaController()
      ..addStatusListener((status, context) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _roomStatus = RoomStatus.chatting;
          });
        }
      });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await Future.delayed(Duration(seconds: 2), () {
        return List.generate(
          10,
          (index) => DilemmaChatModel(
            userName: 'User ${index + pageKey * 10}',
            message: 'Message ${index + pageKey * 10}',
            sendTime:
                DateTime.now().add(Duration(hours: 5 * (index + pageKey * 10))),
            userId: 'userId',
            isleft: index % 2 == 0,
            chatType: ChatType.text,
          ),
        );
      });

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    logger.d('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('토론방'),
        elevation: 20,
      ),
      body: Column(
        children: [
          Expanded(
            child: PagedListView<int, DilemmaChatModel>(
              reverse: true,
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<DilemmaChatModel>(
                itemBuilder: (context, item, index) {
                  final _list = _pagingController.itemList!;

                  switch (item.chatType) {
                    case ChatType.text:
                      final _upperChat = _list[index == _list.length - 1
                          ? _list.length - 1
                          : index + 1];
                      final _lowerChat = _list[index == 0 ? 0 : index - 1];
                      return DilemmaChatTextListItem(
                        currentChat: item,
                        upperChat: _upperChat,
                        lowerChat: _lowerChat,
                      );
                    case ChatType.image:
                      // TODO: Handle this case.
                      return Row(
                        children: [],
                      );
                    case ChatType.warning:
                    // TODO: Handle this case.
                    case ChatType.notice:
                    // TODO: Handle this case.
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  );

                  // if ((_recentChat ??= item).sendTime.day !=
                  //     item.sendTime.day) {
                  //   logger.i('new day : $_recentChat $item');
                  //   _recentChat = item;
                  //   return Column(
                  //     children: [
                  //       DilemmaChatUserImageItem(imageUrl: item),
                  //       Text(_recentChat!.sendTime.toString()),
                  //     ],
                  //   );
                  // }
                  // _recentChat = item;
                  // return DilemmaChatUserImageItem(imageUrl: item);
                },
              ),
            ),
          ),
          Container(
              height: 100,
              child: Row(
                children: [
                  switch (_roomStatus) {
                    RoomStatus.idle => Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isRightPunch = true;
                                    _roomStatus = RoomStatus.selected;
                                    Timer(Duration(milliseconds: 3500), () {
                                      _yodaController.start();
                                    });
                                  });
                                },
                                child: Text('1번 선택')),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isRightPunch = false;
                                    _roomStatus = RoomStatus.chatting;
                                  });
                                },
                                child: Text('2번 선택')),
                          ],
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
                                      onPressed: () {}, child: Text('2번 선택')),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    RoomStatus.chatting => Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: '메시지를 입력하세요',
                                ),
                              ),
                            ),
                            DropdownButton<String>(
                              value: 'left',
                              items: [
                                DropdownMenuItem(
                                  child: Text('left'),
                                  value: 'left',
                                ),
                                DropdownMenuItem(
                                  child: Text('right'),
                                  value: 'right',
                                ),
                                DropdownMenuItem(
                                  child: Text('leftMe'),
                                  value: 'leftMe',
                                ),
                                DropdownMenuItem(
                                  child: Text('rightMe'),
                                  value: 'rightMe',
                                ),
                                DropdownMenuItem(
                                  child: Text('warn'),
                                  value: 'warn',
                                ),
                              ],
                              onChanged: (value) {
                                _selectedValue = value;
                                logger.i(value);
                              },
                              onTap: () {
                                logger.i('tap');
                                switch (_selectedValue) {
                                  case 'left':
                                    _pagingController.itemList!.insert(
                                      0,
                                      DilemmaChatModel(
                                          userName: 'real User',
                                          message: 'real Message',
                                          sendTime: DateTime.now()
                                              .add(Duration(days: 2)),
                                          userId: 'userId',
                                          chatType: ChatType.text,
                                          isleft: true),
                                    );
                                    _pagingController.notifyListeners();
                                    break;
                                  case 'right':
                                    _pagingController.itemList!.insert(
                                      0,
                                      DilemmaChatModel(
                                          userName: 'real User',
                                          message: 'real Message',
                                          sendTime: DateTime.now()
                                              .add(Duration(days: 2)),
                                          userId: 'userId',
                                          chatType: ChatType.text,
                                          isleft: false),
                                    );
                                    _pagingController.notifyListeners();
                                    break;
                                  case 'leftMe':
                                    _pagingController.itemList!.insert(
                                      0,
                                      DilemmaChatModel(
                                          userName: 'me',
                                          message: 'real Message',
                                          sendTime: DateTime.now()
                                              .add(Duration(days: 2)),
                                          userId: 'userId',
                                          chatType: ChatType.text,
                                          isleft: true),
                                    );
                                    _pagingController.notifyListeners();
                                    break;
                                  case 'rightMe':
                                    _pagingController.itemList!.insert(
                                      0,
                                      DilemmaChatModel(
                                          userName: 'me',
                                          message: 'real Message',
                                          sendTime: DateTime.now()
                                              .add(Duration(days: 2)),
                                          userId: 'userId',
                                          chatType: ChatType.text,
                                          isleft: false),
                                    );
                                    _pagingController.notifyListeners();
                                    break;
                                  case 'warn':
                                    _pagingController.itemList!.insert(
                                      0,
                                      DilemmaChatModel(
                                          userName: 'me',
                                          message: 'real Message',
                                          sendTime: DateTime.now()
                                              .add(Duration(days: 2)),
                                          userId: 'userId',
                                          chatType: ChatType.warning,
                                          isleft: false),
                                    );
                                    _pagingController.notifyListeners();
                                    break;
                                }
                              },
                            )
                          ],
                        ),
                      )
                  }
                ],
              ))
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

  final DilemmaChatModel currentChat;
  final DilemmaChatModel upperChat;
  final DilemmaChatModel lowerChat;
  final bool isMe = false;

  @override
  Widget build(BuildContext context) {
    switch (currentChat.isleft) {
      case true:
        //사진 - 이름/메시지 - 시간
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (currentChat.userId != upperChat.userId ||
                    currentChat.isleft != upperChat.isleft)
                ? DilemmaChatUserImageItem(
                    imageUrl:
                        "https://entertainimg.kbsmedia.co.kr/cms/uploads/PERSON_20220706140928_42ea191d42e4cccd6e4b650dd42166a1.jpg",
                  )
                : SizedBox(
                    width: 56,
                  ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (currentChat.userId != upperChat.userId ||
                      currentChat.isleft != upperChat.isleft)
                    Container(
                        constraints: BoxConstraints(maxWidth: 250),
                        child: Text(
                          currentChat.userName,
                          maxLines: 1,
                        )),
                  Row(
                    children: [
                      DilemmaChatMessageItem(
                        messageText: currentChat.message!,
                        backgroundColor: Color.fromARGB(255, 255, 158, 158),
                      ),
                      if (!(currentChat.userId == lowerChat.userId &&
                              currentChat.sendTime
                                      .difference(lowerChat.sendTime)
                                      .inMinutes <
                                  1) &&
                          currentChat.isleft != lowerChat.isleft)
                        DilemmaChatTimeItem(
                          sendTime: currentChat.sendTime,
                        )
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      case false:
        // 시간 - 메시지/이름 - 사진
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (currentChat.userId != upperChat.userId ||
                      currentChat.isleft != upperChat.isleft)
                    Container(
                        constraints: BoxConstraints(maxWidth: 250),
                        child: Text(
                          currentChat.userName,
                          maxLines: 1,
                        )),
                  Row(
                    children: [
                      if (!(currentChat.userId == lowerChat.userId &&
                              currentChat.sendTime
                                      .difference(lowerChat.sendTime)
                                      .inMinutes <
                                  1) &&
                          currentChat.isleft != lowerChat.isleft)
                        DilemmaChatTimeItem(
                          sendTime: currentChat.sendTime,
                        ),
                      DilemmaChatMessageItem(
                        messageText: currentChat.message!,
                        backgroundColor: Color.fromARGB(255, 173, 229, 255),
                      ),
                    ],
                  )
                ],
              ),
            ),
            (currentChat.userId != upperChat.userId ||
                    currentChat.isleft != upperChat.isleft)
                ? DilemmaChatUserImageItem(
                    imageUrl:
                        "https://entertainimg.kbsmedia.co.kr/cms/uploads/PERSON_20220706140928_42ea191d42e4cccd6e4b650dd42166a1.jpg",
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
      {super.key, required this.messageText, required this.backgroundColor});

  final String messageText;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxWidth: 250.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.0),
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
