import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/core/logger.dart';
import 'package:jumunseo/features/home/cubit/home_cubit.dart';
import 'package:jumunseo/features/home/view/dilema_menu.dart';
import 'package:jumunseo/features/home/view/wizard_menu.dart';
// import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> homeWidgets = ["마법사", "딜레마", "게시판"];

  @override
  Widget build(BuildContext context) {
    logger.d('HomeScreen build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('홈'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ReorderableListView(
          padding: const EdgeInsets.symmetric(vertical: 30),
          onReorder: ((oldIndex, newIndex) {
            String tmp = homeWidgets.removeAt(oldIndex);
            homeWidgets.insert(newIndex, tmp);
            setState(() {});
          }),
          children: homeWidgets.map((e) => 
            GestureDetector(
              key: Key(e),
              onTapUp: (details) {
                if(e == '마법사') {
                  context.read<HomeCubit>().homeToWizard(context);
                }
                else if(e == "게시판") {
                  context.read<HomeCubit>().homeToCommunity(context);
                }
                else if(e == "딜레마") {
                  context.read<HomeCubit>().homeToDilema(context);
                }
              },
              child: (e == '마법사')? const WizardMenu(): 
                (e == '딜레마')? const DilemaMenu(): 
                Container(
                  decoration: const BoxDecoration(color: Colors.purple),
                  child: Text(e),
                ),
            )).toList(),
          ),
      ),
      // Column(
        // children: [
        //   Expanded(
        //     child: SingleChildScrollView(
        //       physics: const AlwaysScrollableScrollPhysics(),
        //       child: ReorderableGridView.count(
        //         crossAxisCount: 2,
        //         childAspectRatio: 1.5,
        //         onReorder: ((oldIndex, newIndex) {
        //           String tmp = homeWidgets.removeAt(oldIndex);
        //           homeWidgets.insert(newIndex, tmp);
        //           setState(() {});
        //         }),
        //         children: homeWidgets.map((widget) => Card(
        //           key: ValueKey(widget),
        //           child: GestureDetector(
        //               onTapUp: (details) {
        //                 if(widget == '마법사') {
        //                   context.push("/wizard");
        //                 }
        //                 else if(widget == "게시판") {
        //                   context.push("/community");
        //                 }
        //                 else if(widget == "딜레마") {
        //                   context.push("/dilemma/1/1");
        //                 }
        //               },
        //               child: Expanded(
        //                 child: Container(
        //                   decoration: const BoxDecoration(color: Colors.purple),
        //                   child: Text(widget),
        //                 ),
        //               ),
        //             ),
        //         )).toList(),
        //         ),
              // child: Column(
              //   children: <Widget>[
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Row(
              //         children: <Widget>[
              //           Expanded(
              //             child: Card(
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(15.0),
              //                 ),
              //                 child: SizedBox(
              //                     height: 100,
              //                     child: Material(
              //                         //color: Colors.red.shade200,
              //                         color: Colors.transparent,
              //                         child: InkWell(
              //                           onTap: () {
              //                             context.push('/wizard');
              //                           },
              //                           child: const Column(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.center,
              //                             children: <Widget>[
              //                               Icon(Icons.add, size: 50),
              //                               Text("마법사"),
              //                             ],
              //                           ),
              //                         )))),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Row(
              //         children: <Widget>[
              //           Expanded(
              //             child: Card(
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(15.0),
              //                 ),
              //                 child: SizedBox(
              //                     height: 100,
              //                     child: Material(
              //                         //color: Colors.orange.shade200,
              //                         color: Colors.transparent,
              //                         child: InkWell(
              //                           onTap: () {
              //                             context.push('/dilemma/1/1');
              //                           },
              //                           child: const Column(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.center,
              //                             children: <Widget>[
              //                               Icon(Icons.add, size: 50),
              //                               Text("딜레마 해결 서비스"),
              //                             ],
              //                           ),
              //                         )))),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Row(
              //         children: <Widget>[
              //           const Text("게시판"),
              //           const Spacer(),
              //           Material(
              //               child: InkWell(
              //                   onTap: () {
              //                     context.push('/community');
              //                   },
              //                   child: Container(
              //                       decoration: BoxDecoration(
              //                         borderRadius: BorderRadius.circular(15.0),
              //                         color: Colors.blue.shade200,
              //                       ),
              //                       child: const Padding(
              //                         padding: EdgeInsets.all(8.0),
              //                         child: Text("더보기"),
              //                       )))),
              //         ],
              //       ),
              //     ),
              //     Column(
              //       children: <Widget>[
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Row(
              //             children: <Widget>[
              //               Expanded(
              //                 child: Container(
              //                   height: 100,
              //                   color: const Color.fromARGB(190, 35, 20, 235),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
    //         ),
    //       ),
    //     ],
    //   ),
    );
  }
}
