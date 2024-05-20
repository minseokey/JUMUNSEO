import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jumunseo/config/theme/app_color.dart';
import 'package:jumunseo/shared/blocs.dart';
import 'package:jumunseo/shared/gradient_button.dart';

import '../../dilemma.dart';
import '../model/dilemma_home_model.dart';

class DilemmaHomeScreen extends StatelessWidget {
  const DilemmaHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DilemmaHomeCubit>().state;
    return Scaffold(
        appBar: AppBar(
          title: const Text('진행 중인 딜레마'),
        ),
        body: DilemmaHomeMainView(
          state: state,
        ));
  }
}

class DilemmaHomeMainView extends StatelessWidget {
  const DilemmaHomeMainView({super.key, required this.state});

  final DilemmaHomeState state;

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case DilemmaHomeStatus.error:
        return const Center(child: Text('Oops something went wrong!'));
      case DilemmaHomeStatus.success:
        return DilemmaHomeItemView(items: state.items);
      case DilemmaHomeStatus.loading:
        return const Center(child: CircularProgressIndicator());
    }
  }
}

class DilemmaHomeItemView extends StatelessWidget {
  const DilemmaHomeItemView({super.key, required this.items});

  final List<DilemmaHomeModel> items;

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? const Center(child: Text('No Content'))
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: DilemmaHomeItemTile(
                  item: items[index],
                  // onDeletePressed: (id) {
                  //   context.read<ComplexListCubit>().deleteItem(id);
                  // },
                ),
              );
            },
            itemCount: items.length,
          );
  }
}

class DilemmaHomeItemTile extends StatelessWidget {
  const DilemmaHomeItemTile({
    super.key,
    required this.item,
  });

  final DilemmaHomeModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorStyles.mainColor,
            ColorStyles.secondMainColor,
          ],
        ),
      ),
      height: 200,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context.push('/dilemma/chat/${item.id}');
          },
          highlightColor: ColorStyles.secondMainColor,
          splashColor: ColorStyles.mainColor,
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, top: 20, bottom: 20, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                      //   child: Text("제목",
                      //       maxLines: 1,
                      //       overflow: TextOverflow.ellipsis,
                      //       style: const TextStyle(
                      //           fontSize: 16, fontWeight: FontWeight.bold)),
                      // ),
                      // Expanded(
                      //   child: Padding(
                      //     padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
                      //     child: Text(
                      //       //item.content,
                      //       "item.content",
                      //       maxLines: 2,
                      //       overflow: TextOverflow.ellipsis,
                      //       style: const TextStyle(
                      //           fontSize: 12, fontWeight: FontWeight.w300),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.contents,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            // Expanded(
                            //   child: Text(
                            //     " |  | ${"item.authorNickname"}",
                            //     maxLines: 1,
                            //     overflow: TextOverflow.ellipsis,
                            //     style: const TextStyle(
                            //         fontSize: 12, color: Colors.grey),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // if (item.picture.isNotEmpty)
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(15),
                //     child: ExtendedImage.network(
                //       'https://picsum.photos/200/300',
                //       height: 84,
                //       width: 84,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class ItemTile extends StatelessWidget {
//   const ItemTile({
//     required this.item,
//     required this.onDeletePressed,
//     super.key,
//   });

//   final Item item;
//   final ValueSetter<String> onDeletePressed;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Material(
//       child: ListTile(
//         title: Text(item.value),
//         trailing: item.isDeleting
//             ? const CircularProgressIndicator()
//             : IconButton(
//                 icon: Icon(Icons.delete, color: theme.colorScheme.error),
//                 onPressed: () => onDeletePressed(item.id),
//               ),
//       ),
//     );
//   }
// }