import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jumunseo/features/home/state/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  void homeToDilema(BuildContext context) {
    context.push("/dilemma/1/1");
  }

  void homeToWizard(BuildContext context) {
    context.push("/wizard");
  }

  void homeToCommunity(BuildContext context) {
    context.push("/community");
  }
}