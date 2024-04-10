import 'package:extended_image/extended_image.dart';
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

    homeWidgets = context.read<HomeCubit>().getHomeList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(
              toolbarHeight: 50,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children:[
                    ExtendedImage.asset('assets/icons/logo.png', width: 50, height: 50,),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ExtendedImage.asset('assets/icons/profile.png', width: 50, height: 50,),
                    ),
                    GestureDetector(
                      onTapUp: (details) {
                        context.read<HomeCubit>().hometoProfile(context);
                      },
                      child: const Icon(Icons.settings),
                    ),
                  ]
                ),
              ),
            ),
          ]
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          
        },
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
            children: homeWidgets.map((e) => 
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                key: Key(e),
                child:(e == '마법사')? 
                  GestureDetector(
                    onTapUp: (details) => context.read<HomeCubit>().homeToWizard(context),
                    child: const WizardMenu()
                  ): (e == '딜레마')? 
                  GestureDetector(
                    onTapUp: (details) => context.read<HomeCubit>().homeToDilema(context),
                    child: const DilemaMenu()
                  ): 
                  const CommunityMenu(),
                )).toList(),
            ),
        ),
      ),
    );
  }
}