import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jumunseo/features/wizard/chat/view/category_view.dart';
import 'package:jumunseo/features/wizard/chat/view/chat_view.dart';
import 'package:jumunseo/features/wizard/chat/view/fwohView/how_view.dart';
import 'package:jumunseo/features/wizard/chat/view/fwohView/plus_info_view.dart';
import 'package:jumunseo/features/wizard/chat/view/fwohView/what_view.dart';
import 'package:jumunseo/features/wizard/chat/view/fwohView/when_view.dart';
import 'package:jumunseo/features/wizard/chat/view/fwohView/where_view.dart';
import 'package:jumunseo/features/wizard/chat/view/fwohView/who_view.dart';
import 'package:jumunseo/features/wizard/chat/view/fwohView/why_view.dart';
import 'package:jumunseo/features/wizard/chat/view/fwoh_view.dart';
import 'package:jumunseo/features/wizard/chat/view/wizard_setting_view.dart';
import 'package:logger/logger.dart';
import '../state/wizard_state.dart';
import '../view/my_chat_message.dart';
import '../view/other_chat_message.dart';
import 'package:socket_io_client/socket_io_client.dart';

class WizardCubit extends Cubit<WizardState> {
  WizardCubit() : super(WizardState());

  void onButtonPress(){
    String txt = state.textEditingController.text;

    if(txt != ""){
      Logger().d(txt);

      state.textEditingController.clear();
      state.chats.insert(0, txt);
      state.myChat.insert(0, true);
      state.statusKey.currentState?.insertItem(0);
      // state.socket.emit('chatMessage', txt);
    }
  }

  void chatInsert(String data) {
    state.chats.insert(0, data);
    state.myChat.insert(0, false);
    state.statusKey.currentState?.insertItem(0);
  }

  void sokectEventSetting(BuildContext context){
    //소켓 연결시 함수
    state.socket.onConnect((_) {
      Logger().d('Connected to server');
    });

    //소켓 종료시 함수
    state.socket.onDisconnect((_) {
      Logger().d('Disconnected from server');
    });

    //소켓 에러시 함수
    state.socket.onError((error) {
      Logger().e('Error: $error');
    });

    state.socket.connect();
    state.socket.on('chatMessage', (data) {
      // 메세지 감지
      Logger().d('Received message: $data');
      chatInsert(data);
    });
  }

  Widget onSubmitAnimation(BuildContext context, int index, Animation<double> animation){
    // if(false){
    if(state.myChat[index]) {
      return MyChatMsg("나", state.chats[index], animation);
    } else {
      return OtherChatMsg("상담사", state.chats[index], animation);
    }
  }

  TextEditingController getChatMessage() {
    return state.textEditingController;
  }

  GlobalKey<AnimatedListState> getStatusKey() {
    return state.statusKey;
  }

  void setCateogry(String newCategory) {
    state.cateogry = newCategory;
  }

  String getCategory() {
    return state.cateogry;
  }

  void setRoom(String newId) {
    state.roomId = newId;
  }

  void toFwoh(BuildContext context) {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context)=> const FwohView())
    );
  }

  void toChat(BuildContext context) {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context)=> const ChatView())
    );
  }

  void toWizardSet(BuildContext context) {
    Navigator.push(
      context, 
       MaterialPageRoute(builder: (context)=> const SettingView())
    );
  }

  void toCategory(BuildContext context) {
    Navigator.push(
      context, 
       MaterialPageRoute(builder: (context)=> const CategoryView())
    );
  }

  void toWhen(BuildContext context) {
    Navigator.push(
      context, 
       MaterialPageRoute(builder: (context)=> const WhenView())
    );
  }

  void toWhere(BuildContext context) {
    Navigator.push(
      context, 
       MaterialPageRoute(builder: (context)=> const WhereView())
    );
  }

  void toWho(BuildContext context) {
    Navigator.push(
      context, 
       MaterialPageRoute(builder: (context)=> const WhoView())
    );
  }

  void toWhat(BuildContext context) {
    Navigator.push(
      context, 
       MaterialPageRoute(builder: (context)=> const WhatView())
    );
  }

  void toHow(BuildContext context) {
    Navigator.push(
      context, 
       MaterialPageRoute(builder: (context)=> const HowView())
    );
  }

  void toWhy(BuildContext context) {
    Navigator.push(
      context, 
       MaterialPageRoute(builder: (context)=> const WhyView())
    );
  }

  void toPlusInfo(BuildContext context) {
    Navigator.push(
      context, 
       MaterialPageRoute(builder: (context)=> const PlusInfoView())
    );
  }
}