import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum PostType { write, edit }

TextEditingController titleController = TextEditingController(text: "title");
TextEditingController contentController =
    TextEditingController(text: "content");

class CommunityPostFrame extends StatelessWidget {
  const CommunityPostFrame({super.key, required this.kind});

  final PostType kind;

  @override
  Widget build(BuildContext context) {
    String title = titleController.text;
    String content = contentController.text;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            (kind == PostType.write) ? 'community_write' : "community_edit"),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(initialScrollOffset: 210),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        reverse: true,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "picture",
                  style: const TextStyle(
                    color: Color(0xFF292524),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.height * 0.1,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: ElevatedButton(
                        onPressed: () async {
                          // if (imageList.length < 10) {
                          //   try {
                          //     if (!(await photoPermission())) return;
                          //     final image = await picker
                          //         .pickMultiImage(); // 갤러리에서 이미지 뽑아옴
                          //     if (imageList.length +
                          //             image.length +
                          //             oldImageListString.length >
                          //         10) {
                          //       imageList.removeRange(10, imageList.length);
                          //       ScaffoldMessenger.of(context).showSnackBar(
                          //           SnackBar(
                          //               content:
                          //                   Text("photo_upload_warning".tr())));
                          //     } else {
                          //       setState(() {
                          //         imageList.addAll(image);
                          //       });
                          //     }
                          //   } catch (e) {
                          //     logger.e(e);
                          //   }
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          backgroundColor: const Color(0xFFF7F7F7),
                          side: const BorderSide(
                              width: 1, color: Color(0xFFD3D3D3)),
                          elevation: 0,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.photo_camera_rounded,
                              size: 38,
                              color: Color(0xFFBEBEBE),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Expanded(
                  //     child: Padding(
                  //   padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  //   child: SizedBox(
                  //     height: MediaQuery.of(context).size.height * 0.15,
                  //     child: ListView.separated(
                  //         scrollDirection: Axis.horizontal,
                  //         itemBuilder: (BuildContext context, int index) {
                  //           return Container(
                  //               decoration: ShapeDecoration(
                  //                 color: Colors.white,
                  //                 shape: RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(16),
                  //                 ),
                  //               ),
                  //               child: ClipRRect(
                  //                   borderRadius: BorderRadius.circular(
                  //                       16), // ClipRRect의 모서리 설정
                  //                   child: Stack(
                  //                     children: [
                  //                       if (index < imageList.length)
                  //                         Image.file(
                  //                           File(imageList[index].path),
                  //                           height: MediaQuery.of(context)
                  //                                   .size
                  //                                   .height *
                  //                               0.15,
                  //                           width: MediaQuery.of(context)
                  //                                   .size
                  //                                   .height *
                  //                               0.15,
                  //                           fit: BoxFit.cover,
                  //                         )
                  //                       else if (widget.kind == "edit")
                  //                         ExtendedImage.network(
                  //                           oldImageListString[
                  //                               index - imageList.length],
                  //                           height: MediaQuery.of(context)
                  //                                   .size
                  //                                   .height *
                  //                               0.15,
                  //                           width: MediaQuery.of(context)
                  //                                   .size
                  //                                   .height *
                  //                               0.15,
                  //                           fit: BoxFit.cover,
                  //                         ),
                  //                       Positioned(
                  //                           right: MediaQuery.of(context)
                  //                                   .size
                  //                                   .height *
                  //                               0.015,
                  //                           child: SizedBox(
                  //                               width: MediaQuery.of(context)
                  //                                       .size
                  //                                       .height *
                  //                                   0.03,
                  //                               child: FloatingActionButton(
                  //                                 heroTag:
                  //                                     "delete_edit_image$index",
                  //                                 backgroundColor:
                  //                                     const Color(0xFFD3D3D3),
                  //                                 onPressed: () {
                  //                                   if (index <
                  //                                       imageList.length) {
                  //                                     setState(() {
                  //                                       imageList
                  //                                           .removeAt(index);
                  //                                     });
                  //                                   } else {
                  //                                     setState(() {
                  //                                       oldImageListString
                  //                                           .removeAt(index -
                  //                                               imageList
                  //                                                   .length);
                  //                                     });
                  //                                   }
                  //                                 }, // 해당 이미지 삭제
                  //                                 child: const Icon(Icons.close,
                  //                                     size: 15,
                  //                                     color: Colors.white),
                  //                               )))
                  //                     ],
                  //                   )));
                  //         },
                  //         separatorBuilder: (BuildContext context, int index) =>
                  //             const VerticalDivider(),
                  //         itemCount:
                  //             imageList.length + oldImageListString.length),
                  //   ),
                  // ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 16),
                child: Text(
                  "title",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Color(0xFF292524),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 16),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.065,
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFFD3D3D3)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                            controller: titleController,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: "write_title_hint",
                              hintStyle: const TextStyle(
                                color: Color(0xFFBEBEBE),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                            onChanged: (text) {
                              titleController.text = text;
                              // title = text;
                            }),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 16),
                child: Text(
                  "context",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Color(0xFF292524),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 16),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.3,
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFFD3D3D3)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: TextField(
                          controller: contentController,
                          scrollController: ScrollController(
                            initialScrollOffset: 0,
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: 10,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText:
                                "${"write_content_hint"}${"writing_warning_first"}\n${"writing_warning_second"}",
                            hintStyle: const TextStyle(
                              color: Color(0xFFBEBEBE),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                          ),
                          onChanged: (text) {
                            contentController.text = text;
                            // content = text;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 60,
                        child: ElevatedButton(
                          child: Text(
                            (kind == PostType.write) ? "submit" : "edit",
                          ),
                          onPressed: () async {
                            if (title == "" || content == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("입력이 있어야합")));
                            } else {
                              await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(
                                          "${"writing_warning_first"}\n${"writing_warning_second"}"),
                                      actions: [
                                        TextButton(
                                          onPressed: () async {
                                            // loading(context);

                                            context.pop();
                                            context.pop();
                                          },
                                          child: const Text('confirm'),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              context.pop();
                                            },
                                            child: const Text('cancel',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                )))
                                      ],
                                    );
                                  });
                            }
                          },
                        )),
                  )),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: (MediaQuery.of(context).viewInsets.bottom))),
            ]),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
