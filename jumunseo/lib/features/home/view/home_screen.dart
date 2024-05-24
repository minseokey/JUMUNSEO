import 'package:extended_image/extended_image.dart';
import 'package:jumunseo/core/login_status.dart';
import 'package:jumunseo/core/notification.dart';
import 'package:jumunseo/features/auth/auth.dart';
import '../home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/core/logger.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:restart_app/restart_app.dart';

// Create an instance of the ShorebirdCodePush class
final shorebirdCodePush = ShorebirdCodePush();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _isShorebirdAvailable = shorebirdCodePush.isShorebirdAvailable();
  int? _currentPatchVersion;
  bool isUpdateAvailable = true;
  bool isCheckingForUpdate = false;
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
  void initState() {
    if (LoginStatus.isLogin) {
      FlutterLocalNotification.init();

      Future.delayed(const Duration(seconds: 3),
          FlutterLocalNotification.requestNotificationPermission());

      // FlutterLocalNotification.showNotification();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logger.d('HomeScreen build');

    final Shader linearGradientShader =
        LinearGradient(colors: [Colors.red, Colors.yellow])
            .createShader(Rect.fromLTWH(0.0, 20.0, 150.0, 20.0));

    homeWidgets = context.read<HomeCubit>().getHomeList();

    loading.value = false;

    if (!LoginStatus.isGeust) {
      context.read<AuthCubit>().getInfo(context).then((value) {
        loading.value = true;
      });
    }

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
                    const Text(
                      "Welcome back,",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    LoginStatus.isGeust
                        ? const Text(
                            '홍길동',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        : ValueListenableBuilder<bool>(
                            valueListenable: loading,
                            builder: (context, value, child) {
                              if (value) {
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
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
                  ],
                ),
                const Spacer(),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        context.read<HomeCubit>().hometoProfile(context);
                      },
                      child: LoginStatus.isGeust
                          ? CircleAvatar(
                              radius: 25.0,
                              backgroundImage: ExtendedImage.asset(
                                      'assets/icons/profile.png')
                                  .image,
                            )
                          : ValueListenableBuilder<String>(
                              valueListenable: LoginStatus.imageUrl,
                              builder: (context, value, child) {
                                if (value == '' || value == '기본사진') {
                                  return CircleAvatar(
                                    radius: 25.0,
                                    backgroundImage: ExtendedImage.asset(
                                            'assets/icons/profile.png')
                                        .image,
                                  );
                                } else {
                                  return CircleAvatar(
                                    radius: 25.0,
                                    backgroundImage:
                                        ExtendedImage.network(value).image,
                                  );
                                }
                              },
                            ),
                    )),
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
                                context.read<HomeCubit>().homeToWizard(context);
                                // if (LoginStatus.isGeust) {
                                //   context
                                //       .read<HomeCubit>()
                                //       .guestDialog(context);
                                // } else {
                                //   context
                                //       .read<HomeCubit>()
                                //       .homeToWizard(context);
                                // }
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



// import 'package:extended_image/extended_image.dart';
// import 'package:go_router/go_router.dart';
// import 'package:jumunseo/shared/gradient_text.dart';
// import '../home.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jumunseo/core/logger.dart';
// import 'package:shorebird_code_push/shorebird_code_push.dart';
// import 'package:restart_app/restart_app.dart';

// // Create an instance of the ShorebirdCodePush class
// final shorebirdCodePush = ShorebirdCodePush();

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   static const String routeName = '/';

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final _isShorebirdAvailable = shorebirdCodePush.isShorebirdAvailable();
//   int? _currentPatchVersion;
//   bool isUpdateAvailable = true;
//   bool isCheckingForUpdate = false;
//   late List<String> homeWidgets;

//   ValueNotifier<bool> loading = ValueNotifier<bool>(false);

//   Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
//     return AnimatedBuilder(
//       animation: animation,
//       builder: (BuildContext context, Widget? child) {
//         return Material(
//           elevation: 0,
//           color: Colors.transparent,
//           child: child,
//         );
//       },
//       child: child,
//     );
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     shorebirdCodePush.currentPatchNumber().then((currentPatchVersion) {
//       if (!mounted) return;
//       setState(() {
//         _currentPatchVersion = currentPatchVersion;
//       });
//     });
//     // after a frame is drawn show a dialog
//     WidgetsBinding.instance!.addPostFrameCallback((_) {
//       if (_isShorebirdAvailable) {
//         _checkForUpdate();
//       }
//     });
//   }

//   Future<void> _checkForUpdate() async {
//     setState(() {
//       isCheckingForUpdate = true;
//     });

//     // Ask the Shorebird servers if there is a new patch available.
//     isUpdateAvailable =
//         await shorebirdCodePush.isNewPatchAvailableForDownload();

//     if (!mounted) return;

//     setState(() {
//       isCheckingForUpdate = false;
//     });

//     if (isUpdateAvailable) {
//       _showUpdateAvailableBanner();
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('No update available'),
//         ),
//       );
//     }
//     // while (isUpdateAvailable) {

//     // }
//   }

//   void _showDownloadingBanner() {
//     ScaffoldMessenger.of(context).showMaterialBanner(
//       const MaterialBanner(
//         content: Text('Downloading...'),
//         actions: [
//           SizedBox(
//             height: 14,
//             width: 14,
//             child: CircularProgressIndicator(
//               strokeWidth: 2,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showUpdateAvailableBanner() {
//     ScaffoldMessenger.of(context).showMaterialBanner(
//       MaterialBanner(
//         content: const Text('Update available'),
//         actions: [
//           TextButton(
//             onPressed: () async {
//               ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
//               await _downloadUpdate();

//               if (!mounted) return;
//               ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
//             },
//             child: const Text('Download'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showRestartBanner() {
//     ScaffoldMessenger.of(context).showMaterialBanner(
//       const MaterialBanner(
//         content: Text('A new patch is ready!'),
//         actions: [
//           TextButton(
//             // Restart the app for the new patch to take effect.
//             onPressed: Restart.restartApp,
//             child: Text('Restart app'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _downloadUpdate() async {
//     _showDownloadingBanner();

//     await Future.wait([
//       shorebirdCodePush.downloadUpdateIfAvailable(),
//       // Add an artificial delay so the banner has enough time to animate in.
//       Future<void>.delayed(const Duration(milliseconds: 250)),
//     ]);

//     if (!mounted) return;

//     ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
//     _showRestartBanner();
//   }

//   @override
//   Widget build(BuildContext context) {
//     logger.d('HomeScreen build');

//     final Shader linearGradientShader =
//         LinearGradient(colors: [Colors.red, Colors.yellow])
//             .createShader(Rect.fromLTWH(0.0, 20.0, 150.0, 20.0));

//     homeWidgets = context.read<HomeCubit>().getHomeList();

//     loading.value = false;

//     if(!LoginStatus.isGeust){
//       context.read<AuthCubit>().getInfo(context)
//       .then((value) {
//         loading.value = true;
//       });
//     }

//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(80),
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           AppBar(
//             // shadowColor: Colors.white,
//             // toolbarHeight: 50,
//             title: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(children: [
//                 Column(
//                   children: [
//                     Image.asset(
//                       'assets/icons/jumunseo_letter.png',
//                       width: 100,
//                     ),
//                     // Text(
//                     //   "Sangrok",
//                     //   style: TextStyle(
//                     //       fontSize: 20,
//                     //       fontWeight: FontWeight.bold,
//                     //       color: Colors.black),
//                     // ),
//                   ],
//                 ),
//                 const Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 0.0),
//                   child: CircleAvatar(
//                     radius: 25.0,
//                     backgroundImage:
//                         ExtendedImage.asset('assets/icons/profile.png').image,
//                   ):ValueListenableBuilder<String>(
//                     valueListenable: LoginStatus.imageUrl,
//                     builder: (context, value, child) {
//                       if(value == '' || value == '기본사진'){
//                         return CircleAvatar(
//                           radius: 25.0,
//                           backgroundImage:
//                               ExtendedImage.asset('assets/icons/profile.png').image,
//                         );
//                       }
//                       else {
//                         return CircleAvatar(
//                           radius: 25.0,
//                           backgroundImage: ExtendedImage.network(value).image,
//                         );
//                       }
//                     },
//                   )
//                 ),
//                 // GestureDetector(
//                 //   onTapUp: (details) {
//                 //     context.read<HomeCubit>().hometoProfile(context);
//                 //   },
//                 //   child: const Icon(Icons.settings),
//                 // ),
//               ]),
//             ),
//           ),
//         ]),
//       ),
//       body: RefreshIndicator(
//         onRefresh: () async {},
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: ReorderableListView(
//             proxyDecorator: proxyDecorator,
//             onReorder: ((oldIndex, newIndex) {
//               setState(() {
//                 if (oldIndex < newIndex) {
//                   newIndex -= 1;
//                 }
//                 final String item = homeWidgets.removeAt(oldIndex);
//                 homeWidgets.insert(newIndex, item);
//                 context.read<HomeCubit>().putHomeList(homeWidgets);
//               });
//             }),
//             children: homeWidgets
//                 .map((e) => Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       key: Key(e),
//                       child: (e == '마법사')
//                           ? GestureDetector(
//                               onTapUp: (details) {
//                                 context.push('/wizard/chat');
//                               },
//                               // (details) => context
//                               //     .read<HomeCubit>()
//                               //     .homeToWizard(context),
//                               child: const WizardMenu())
//                           : (e == '딜레마')
//                               ? GestureDetector(
//                                   onTapUp: (details) => context
//                                       .read<HomeCubit>()
//                                       .homeToDilema(context),
//                                   child: const DilemaMenu())
//                               : const CommunityMenu(),
//                     ))
//                 .toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }
