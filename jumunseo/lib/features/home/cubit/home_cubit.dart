import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/core/login_status.dart';
import 'package:jumunseo/features/login/login.dart';

import '../home.dart';
import 'package:go_router/go_router.dart';
//import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  List<String> getHomeList() {
    return state.box.get("homeList", defaultValue: ['마법사', '딜레마', '커뮤니티']);
  }

  void putHomeList(List<String> homelist) {
    state.box.put("homeList", homelist);
  }

  void homeToDilema(BuildContext context) {
    context.push("/dilemma");
  }

  void homeToWizard(BuildContext context) {
    context.push("/wizard");
  }

  void homeToCommunity(BuildContext context) {
    context.push("/community");
  }

  void hometoProfile(BuildContext context) {
    context.push("/profile");
  }

  void testIncrement(BuildContext context) {
    if (LoginStatus.isLogin) {
      emit(state.copyWith(testNum: state.testNum + 1));
    } else {
      context.read<LoginCubit>().askToLogin(context);
    }
  }
}
