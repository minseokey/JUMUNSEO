import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jumunseo/core/logger.dart';
import 'package:jumunseo/features/auth/auth.dart';
import 'package:jumunseo/features/auth/view/not_network_dialog.dart';
import '../chat.dart';
import 'package:web_socket_channel/io.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class WizardCubit extends Cubit<WizardState> {
  WizardCubit() : super(WizardState());

  void onButtonPress(String txt) {
    if (txt != "") {
      state.chats.insert(0, txt);
      state.myChat.insert(0, true);
      state.statusKey.currentState?.insertItem(0);
      state.socket?.sink.add(txt);
    }
  }

  void pushPrompt(String txt) {
    state.socket?.sink.add(txt);
  }

  String getChatTextField() {
    return state.textEditingController.text;
  }

  void clearChatTextField() {
    state.textEditingController.clear();
  }

  String getUserId() {
    return state.userId;
  }

  void chatInsert(String data) {
    state.chats.insert(0, data);
    state.myChat.insert(0, false);
    state.statusKey.currentState?.insertItem(0);
  }

  void setPrompt(String prompt) {
    List<String> prompts = prompt.split(',');

    state.explain = prompts[0];
    state.edit = prompts[1];
    state.translate = prompts[2];
  }

  String parsingCategory(RoomModel room) {
    if (room.conversation.isNotEmpty) {
      if (room.conversation[0].user_message.contains('카테고리')) {
        String category = room.conversation[0].user_message
            .split("\n")[0]
            .split(":")[1]
            .replaceAll(",", "");
        return category;
      }
    }

    return "";
  }

  void toHome(BuildContext context) {
    context.pop();
    context.go('/');
  }

  Future<bool> internetAccessOk(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      showDialog(
          context: context, builder: (context) => notNetworkDialog(context));
      context.go('/');
      return false;
    }

    return true;
  }

  void sokectEventSetting(BuildContext context) {
    state.myChat.clear();
    state.chats.clear();

    Map<String, dynamic> header = {
      'Authorization': context.read<AuthCubit>().getAcessToken()
    };
    state.socket = IOWebSocketChannel.connect(Uri.parse('ws://jumunseo.com/ws'),
        headers: header);
// state.socket = IOWebSocketChannel.connect(
//         Uri.parse('ws://10.0.2.2:8000/ws/${state.userId}'));
    logger.d('서버 연결 시작');

    // 메세지 감지
    state.socket?.stream.listen((data) {
      logger.d('Received message: $data');
      chatInsert(data);
    });

    pushPrompt(
        "${state.explain},${state.edit},${state.translate}/${state.roomId}");
  }

  void pushFirstMessage() {
    state.chats.insert(0,
        "언제?: 오늘,\n왜?: 실수로,\n어디서?: 식당에서,\n무엇을?: 남의 화분을 깨트렸어,\n어떻게?: ,\n누가?: 내가\n,추가 정보: 적절한 배상금이 얼마인지 궁금해.");
    state.myChat.insert(0, true);
    state.statusKey.currentState?.insertItem(0);

    Future.delayed(const Duration(seconds: 5), () {
      state.chats.insert(0, """
이런 경우에는 민법 제758조에 따라 손해배상책임을 지게 됩니다. 해당 조항에 따르면, 타인의 물건을 과실로 인하여 훼손한 경우 그 손해를 배상할 책임이 있다고 규정되어 있습니다. 일반적으로는 피해를 입은 물건의 수리비 또는 교환가치(시가)가 배상액의 기준이 됩니다. 만약 화분이 고가품이거나 특수한 제작 방법으로 만들어진 것이라면, 해당 물건의 가치를 고려하여 배상액이 결정될 수 있습니다.
화분을 깨뜨린 행위가 식당 주인의 영업에 큰 지장을 준 경우라면, 추가적인 손해배상책임을 질 수도 있습니다. 예를 들어, 화분이 식당 내부 인테리어의 중요한 부분을 차지하거나, 화분이 깨지면서 식당 내부가 더러워진 경우 등이 이에 해당됩니다. 하지만 이러한 경우에도 배상액은 합리적인 수준이어야 합니다.

그러므로 실제 배상의 범위는 여러 가지 요인에 따라 달라질 수 있으므로 보다 정확한 판단을 위해서는 변호사나 법률 전문가와 상담하시기를 권장합니다.
    """);
      state.myChat.insert(0, false);
      state.statusKey.currentState?.insertItem(0);
    });

    // state.chats.insert(0, "현재 정가로 봤을때 5만원정도에 판매되는 화분인거 같은데 계속 10만원을 달라고 해");
    // state.myChat.insert(0, true);
    // state.statusKey.currentState?.insertItem(0);

    Future.delayed(const Duration(seconds: 30), () {
      state.chats.insert(0, """
판매정가가 5만원인 화분을 식당 주인이 10만원을 요구하는 것은 다소 과한 요구로 보입니다. 그러나 화분이 깨지면서 발생한 추가적인 손해나 청소비용 등을 고려하였을 때 적정한 금액인지 여부를 먼저 파악하시는 것이 좋습니다.

만약 식당 주인과의 협의가 어렵다면 소비자보호원에 피해구제 신청을 통해 도움을 받으실 수 있습니다. 이를 통해 전문가의 조언과 함께 적절한 배상금액을 산정하실 수 있으며 필요시 합의중재 및 분쟁조정 절차를 통해 문제를 해결 할 수 있습니다.
    """);
      state.myChat.insert(0, false);
      state.statusKey.currentState?.insertItem(0);
    });

    // if(state.roomId == "-1"){
    //   onButtonPress("카테고리:${state.cateogry},\n언제?: ${state.when},\n왜?: ${state.why},\n어디서?: ${state.where},\n무엇을?: ${state.what},\n어떻게?: ${state.how},\n누가?: ${state.who}\n,추가 정보: ${state.plusInfo}");
    // }
  }

  void setExplain(String newExplain) {
    state.explain = newExplain;
  }

  String getExplain() {
    return state.explain;
  }

  void setEdit(String newEdit) {
    state.edit = newEdit;
  }

  String getEdit() {
    return state.edit;
  }

  void setTranslate(String newTranslate) {
    state.translate = newTranslate;
  }

  String getTranslate() {
    return state.translate;
  }

  void setWhy(String newWhy) {
    state.why = newWhy;
  }

  void setWhat(String newWhat) {
    state.what = newWhat;
  }

  void setWho(String newWho) {
    state.who = newWho;
  }

  void setHow(String newHow) {
    state.how = newHow;
  }

  void setWhen(String newWhen) {
    state.when = newWhen;
  }

  void setWhere(String newWhere) {
    state.where = newWhere;
  }

  void setPlusInfo(String newPlusInfo) {
    state.plusInfo = newPlusInfo;
  }

  void socketDispose() {
    state.socket?.sink.close();
  }

  Widget onSubmitAnimation(
      BuildContext context, int index, Animation<double> animation) {
    if (state.myChat[index]) {
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

  void toChat(BuildContext context, TextEditingController? textEdit) {
    if (textEdit != null) {
      if (textEdit.text.trim() != "") {
        setPlusInfo(textEdit.text);
      }
    }

    context.push('/wizard/chat');
  }

  void toWizardSet(BuildContext context) {
    context.push("/wizard/chat_set");
  }

  void toCategory(BuildContext context) {
    context.push("/wizard/category");
  }

  void toWhen(BuildContext context) {
    context.push("/wizard/when");
  }

  void toWhere(BuildContext context, TextEditingController textEdit) {
    if (textEdit.text.trim() != "") {
      setWhy(textEdit.text);

      context.push("/wizard/where");
    }
  }

  void toWho(BuildContext context, TextEditingController textEdit) {
    if (textEdit.text.trim() != "") {
      setHow(textEdit.text);

      context.push("/wizard/who");
    }
  }

  void toWhat(BuildContext context, TextEditingController textEdit) {
    if (textEdit.text.trim() != "") {
      setWhere(textEdit.text);

      context.push("/wizard/what");
    }
  }

  void toHow(BuildContext context, TextEditingController textEdit) {
    if (textEdit.text.trim() != "") {
      setWhat(textEdit.text);

      context.push("/wizard/how");
    }
  }

  void toWhy(BuildContext context, TextEditingController textEdit) {
    if (textEdit.text.trim() != "") {
      setWhen(textEdit.text);

      context.push("/wizard/why");
    }
  }

  void toPlusInfo(BuildContext context, TextEditingController textEdit) {
    if (textEdit.text.trim() != "") {
      setWho(textEdit.text);

      context.push("/wizard/plus_info");
    }
  }
}
