import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WizardState{
  TextEditingController textEditingController = TextEditingController();

  final List<String> chats = [];
  final List<bool> myChat = [];
  
  final GlobalKey<AnimatedListState> statusKey = GlobalKey<AnimatedListState>();

  WebSocketChannel? socket;

  String userId = 'sangrok';
  String roomId = "-1";
  String cateogry = "";
}