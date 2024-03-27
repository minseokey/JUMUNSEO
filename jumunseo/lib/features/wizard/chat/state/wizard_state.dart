import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class WizardState{
  TextEditingController textEditingController = TextEditingController();

  final List<String> chats = [];
  final List<bool> myChat = [];
  
  final GlobalKey<AnimatedListState> statusKey = GlobalKey<AnimatedListState>();

  final io.Socket socket = io.io('http://10.0.2.2:3000',
      io.OptionBuilder()
          .setTransports(['websocket']) 
          .build());

  String userId = 'sangrok';
  String roomId = "-1";
  String cateogry = "";
}