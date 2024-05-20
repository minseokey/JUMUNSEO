import 'package:extended_image/extended_image.dart';
import 'package:go_router/go_router.dart';
import 'package:jumunseo/shared/gradient_text.dart';
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
  Widget build(BuildContext context) {
    logger.d('HomeScreen build');

    final Shader linearGradientShader =
        LinearGradient(colors: [Colors.red, Colors.yellow])
            .createShader(Rect.fromLTWH(0.0, 20.0, 150.0, 20.0));

    homeWidgets = context.read<HomeCubit>().getHomeList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AppBar(
            // shadowColor: Colors.white,
            // toolbarHeight: 50,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/icons/jumunseo_letter.png',
                      width: 100,
                    ),
                    // Text(
                    //   "Sangrok",
                    //   style: TextStyle(
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.black),
                    // ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage:
                        ExtendedImage.asset('assets/icons/profile.png').image,
                  ),
                ),
                // GestureDetector(
                //   onTapUp: (details) {
                //     context.read<HomeCubit>().hometoProfile(context);
                //   },
                //   child: const Icon(Icons.settings),
                // ),
              ]),
            ),
          ),
        ]),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      key: Key(e),
                      child: (e == '마법사')
                          ? GestureDetector(
                              onTapUp: (details) {
                                context.push('/wizard/chat');
                              },
                              // (details) => context
                              //     .read<HomeCubit>()
                              //     .homeToWizard(context),
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
