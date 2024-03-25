import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/config/theme/app_color.dart';
import 'package:jumunseo/features/wizard/chat/view/gradient_button.dart';

import '../../cubit/wizard_cubit.dart';

class PlusInfoView extends StatefulWidget{
  const PlusInfoView({super.key});

  @override
  State<PlusInfoView> createState() => _PlusInfoViewState();
}

class _PlusInfoViewState extends State<PlusInfoView> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
            "내용을 자세하게 적어주세요.",
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
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text("추가 상황 설명 해주세요!", style: TextStyle(color: Color.fromARGB(0xff, 0x59, 0x59, 0x59), fontSize: 14.0),)
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
            child: Container(
              height: 40.0,
              child: TextField(
                controller: textEditingController,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Text",
                  hintStyle: TextStyle(color: Color.fromARGB(0xff, 0xab, 0xab, 0xab), fontSize: 12.0),
                ),
                onSubmitted: (String text){},
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: GradientButton(
                    onButtonPress: () {context.read<WizardCubit>().toWizardSet(context); },
                    message: '주문서 봇 설정하기',
                  ),
                ),
              ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
            child: Row(
              children: [
                Expanded(
                  child: GradientButton(
                    onButtonPress: () {context.read<WizardCubit>().toChat(context); },
                    message: 'Continue',
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