import 'package:flutter/material.dart';
import 'package:jumunseo/core/blank.dart';
import 'package:jumunseo/features/wizard/chat/parsing/room_parser.dart';

class Room extends StatelessWidget {
  final RoomParser info;

  const Room(
    this.info,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage('assets/images/categories/1.png'), radius: 25.0,),
                const Blank(10, 0),
                Text("카테고리", style: const TextStyle(fontSize: 12.0),)
              ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            child: Text(info.roomId, style: const TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            child: Text(info.addedPrompt, style: const TextStyle(color: Colors.black, fontSize: 15.0),),
          ),
      ],),
    );
  }
}