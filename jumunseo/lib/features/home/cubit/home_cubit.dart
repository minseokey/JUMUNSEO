import '../home.dart';
import 'package:go_router/go_router.dart';
import 'package:bloc/bloc.dart';

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
}
