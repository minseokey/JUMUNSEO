import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/config/theme/app_color.dart';
import 'package:jumunseo/features/wizard/chat/view/gradient_button.dart';
import 'package:jumunseo/features/wizard/chat/view/room_list_select.dart';
import 'package:jumunseo/shared/room_information.dart';

import '../cubit/wizard_cubit.dart';

class RoomListView extends StatefulWidget{
  const RoomListView({super.key});

  @override
  State<RoomListView> createState() => _RoomListViewState();
}

class _RoomListViewState extends State<RoomListView> {
  List<RoomInfo> infos = [const RoomInfo("카테고리", "assets/images/categories/1.png", "제목", "내용"),
                          const RoomInfo("카테고리", "assets/images/categories/1.png", "제목", "내용"),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
            "마 법 사",
            style: TextStyle(
              color: ColorStyles.mainColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 19.0, horizontal: 30.0),
            child: Text("진행중인 대화", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 19.0),
                clipBehavior: Clip.none,
                shrinkWrap: true,
                children: List.generate(infos.length, (index) {
                  return Room(infos[index]);
                })
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 35.0),
            child: Row(
              children: [
                Expanded(
                  child: GradientButton(
                    onButtonPress: () {context.read<WizardCubit>().toCategory(context); },
                    message: '새로 시작하기',
                  ),
                ),
              ]
            ),
          ),
        ]
      ),
    );
  }
}