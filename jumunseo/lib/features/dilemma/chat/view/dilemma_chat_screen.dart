import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
      PagingController(firstPageKey: 1);
  static const _pageSize = 20;

  RoomStatus _roomStatus = RoomStatus.idle;
  bool _isRightPunch = true;

  late final YodaController _yodaController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
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
            userName: 'User $index',
            message: 'Message $index',
            sendTime: DateTime.now(),
            userId: 'userId',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('토론방'),
        elevation: 20,
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                PagedSliverList<int, DilemmaChatModel>(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<DilemmaChatModel>(
                    itemBuilder: (context, item, index) {
                      return DilemmaChatListItem(dilemmaChat: item);
                    },
                  ),
                ),
              ],
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
                                    _roomStatus = RoomStatus.selected;
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
                                  isRightPunch: true,
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
                            ElevatedButton(onPressed: () {}, child: Text('전송')),
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

class DilemmaChatListItem extends StatelessWidget {
  const DilemmaChatListItem({super.key, required this.dilemmaChat});

  final DilemmaChatModel dilemmaChat;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(dilemmaChat.userName),
      subtitle: Text(dilemmaChat.message ?? ''),
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
