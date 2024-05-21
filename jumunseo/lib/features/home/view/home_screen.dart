import 'package:extended_image/extended_image.dart';
import 'package:jumunseo/core/login_status.dart';
import 'package:jumunseo/core/notification.dart';
import 'package:jumunseo/features/auth/auth.dart';
import '../home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/core/logger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<String> homeWidgets;

  ValueNotifier<bool> loading = ValueNotifier<bool>(false);

  Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Material(
          elevation: 0,
          color: Colors.transparent,
          child: child,
        );
      },
      child: child,
    );
  }

  @override
  void initState(){
    if(LoginStatus.isLogin) {
      FlutterLocalNotification.init();
      
      Future.delayed(
        const Duration(seconds: 3),
        FlutterLocalNotification.requestNotificationPermission()
      );

      // FlutterLocalNotification.showNotification();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logger.d('HomeScreen build');

    homeWidgets = context.read<HomeCubit>().getHomeList();

    loading.value = false;

    if(!LoginStatus.isGeust){
      context.read<AuthCubit>().getInfo(context)
      .then((value) {
        loading.value = true;
      });
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AppBar(
            shadowColor: Colors.white,
            toolbarHeight: 50,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                Column(
                  children: [
                    const Text(
                      "Welcome back,",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    LoginStatus.isGeust? const Text(
                      'Guest',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    ):ValueListenableBuilder<bool>(
                      valueListenable: loading,
                      builder: (context, value, child) {
                        if(value){
                          return ValueListenableBuilder<String>(
                            valueListenable: LoginStatus.name,
                            builder: (context, value, child) {
                              return Text(
                                value,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              );
                            },
                          );
                        }
                        else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: LoginStatus.isGeust? CircleAvatar(
                    radius: 25.0,
                    backgroundImage:
                        ExtendedImage.asset('assets/icons/profile.png').image,
                  ):ValueListenableBuilder<String>(
                    valueListenable: LoginStatus.imageUrl,
                    builder: (context, value, child) {
                      if(value == '' || value == '기본사진'){
                        return CircleAvatar(
                          radius: 25.0,
                          backgroundImage:
                              ExtendedImage.asset('assets/icons/profile.png').image,
                        );
                      }
                      else {
                        return CircleAvatar(
                          radius: 25.0,
                          backgroundImage: ExtendedImage.network(value).image,
                        );
                      }
                    },
                  )
                ),
                GestureDetector(
                  onTapUp: (details) {
                    context.read<HomeCubit>().hometoProfile(context);
                  },
                  child: const Icon(Icons.settings),
                ),
              ]),
            ),
          ),
        ]),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ReorderableListView(
            proxyDecorator: proxyDecorator,
            onReorder: ((oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final String item = homeWidgets.removeAt(oldIndex);
                homeWidgets.insert(newIndex, item);
                context.read<HomeCubit>().putHomeList(homeWidgets);
              });
            }),
            children: homeWidgets
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      key: Key(e),
                      child: (e == '마법사')
                          ? GestureDetector(
                              onTapUp: (details){
                                if(LoginStatus.isGeust) {
                                  context
                                    .read<HomeCubit>()
                                    .guestDialog(context);
                                }
                                else {
                                  context
                                    .read<HomeCubit>()
                                    .homeToWizard(context);
                                }
                              },
                              child: const WizardMenu())
                          : (e == '딜레마')
                              ? GestureDetector(
                                  onTapUp: (details) => context
                                      .read<HomeCubit>()
                                      .homeToDilema(context),
                                  child: const DilemaMenu())
                              : const CommunityMenu(),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
