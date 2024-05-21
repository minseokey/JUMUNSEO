import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/config/theme/app_color.dart';
import 'package:jumunseo/features/auth/auth.dart';
import '../chat.dart';

class RoomListView extends StatefulWidget{
  const RoomListView({super.key});

  @override
  State<RoomListView> createState() => _RoomListViewState();
}

class _RoomListViewState extends State<RoomListView> {
  late WizardRepository repo;
  Dio dio = Dio();
  bool internet = false;

  @override
  void initState() {
    super.initState();
    repo = WizardRepository(dio);
  }

  @override
  Widget build(BuildContext context) {
    context.read<WizardCubit>().internetAccessOk(context).then((value) {
      if(value) {
        internet = true;
      }
    },);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            "마 법 사",
            style: TextStyle(
              color: ColorStyles.mainColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: !internet?Container():Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 19.0, horizontal: 30.0),
            child: Text("진행중인 대화", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: FutureBuilder(
                future: repo.getRooms(context.read<AuthCubit>().getAcessToken()),
                initialData: [],
                builder: (_, AsyncSnapshot snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  ChatModel chats = snapshot.data;

                  return ListView(
                    padding: const EdgeInsets.symmetric(vertical: 19.0),
                    clipBehavior: Clip.none,
                    shrinkWrap: true,
                    children: List.generate(chats.chats.length, (index) {
                      return GestureDetector(
                        onTapUp: (details) {
                          context.read<WizardCubit>().setRoom(chats.chats[index].room_id);
                          context.read<WizardCubit>().toChat(context, null); 
                        },
                        child: Room(chats.chats[index])
                      );
                    })
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 35.0),
            child: Row(
              children: [
                Expanded(
                  child: GradientButton(
                    child: TextButton(
                    onPressed: () {
                      context.read<WizardCubit>().setRoom("-1");
                      context.read<WizardCubit>().toCategory(context); 
                    },
                    child: const Text('Continue', style: TextStyle(color: Colors.white),),
                  ),),
                ),
              ]
            ),
          ),
        ]
      ),
    );
  }
}