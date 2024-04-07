import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/core/blank.dart';
import 'package:jumunseo/features/community/writing_status.dart';
import 'package:jumunseo/features/home/cubit/home_cubit.dart';

class CommunityMenu extends StatefulWidget {
  const CommunityMenu({Key? key}) : super(key: key);

  @override
  State<CommunityMenu> createState() => _CommunityMenuState();
}

class _CommunityMenuState extends State<CommunityMenu> {
  @override
  Widget build(BuildContext context) {
    List<WritingStatus> writeStatus = [WritingStatus(title: '제목', name: '유상록', writeDate: '2024년 4월 5일'),
                                      WritingStatus(title: '제목2', name: '유상록', writeDate: '2024년 4월 6일')];
    
    return Column(
      children: [
        Row(
          children: [
            const Text("게시판", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.black),),
            const Spacer(),
            GestureDetector(
              onTapUp: (details) => context.read<HomeCubit>().homeToCommunity(context),
              child: const Text("더보기", style: TextStyle(fontSize: 12.0, color: Colors.grey),)
            ),
          ],
        ),
        ListView(
          shrinkWrap: true,
          children: writeStatus.map((status) => 
            Padding(
              padding: const EdgeInsets.only(top: 19),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.05),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Row(
                    children: [
                      const CircleAvatar(backgroundImage: AssetImage('assets/images/community.png'), radius: 25.0,),
                      const Blank(10, 0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(status.title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                          Text(status.name, style: const TextStyle(color: Colors.grey, fontSize: 10),),
                          Text(status.writeDate, style: const TextStyle(color: Colors.grey, fontSize: 10),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ).toList(),
        )
      ],
    );
  }
}