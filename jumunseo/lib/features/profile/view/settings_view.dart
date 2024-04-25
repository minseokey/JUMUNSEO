import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  static const String routeName = '/';

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  List<String> settingList = ["Version:1.0.2","이용 약관", "로그아웃", "탈퇴하기"];
  List<Color> colorList = [Colors.black, Colors.black, Colors.red, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Settings", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              
            },
            child: Text(settingList[index], style: TextStyle(color: colorList[index], fontSize: 16),),
          );
        }, itemCount: settingList.length, 
        separatorBuilder: (BuildContext context, int index) { 
          return const Divider(
            height: 10.0,
            color: Colors.grey,
          );
        },),
      )
    );
  }
}