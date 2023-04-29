import 'package:apna_software/InternetChecking.dart';
import 'package:apna_software/dataModel/trackModel/TrackInfoDetails.dart';
import 'package:apna_software/pages/TrackPage.dart';
import 'package:apna_software/stateManagement/HomePageController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BookMarkPage extends StatefulWidget {
  BookMarkPage({Key? key}) : super(key: key);

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  final HomePageController controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "BookMark Lists",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: InternetChecking(
          widget: Column(
        children: [
          Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: controller.bookMarkLists.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(CupertinoIcons.music_note_2,
                              color: Colors.blue, size: 30),
                          trailing: IconButton(
                              onPressed: () {
                                Map<String, dynamic> map = {};
                                controller.addOrRemoveListItem(
                                    map,
                                    controller.bookMarkLists[index]['id']
                                        .toString(),
                                    controller.bookMarkLists[index]
                                        ['trackName']);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                          title: Text(controller.bookMarkLists[index]
                                  ['trackName']
                              .toString()),
                          subtitle: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.bookMarkLists[index]['artistName']
                                  .toString()),
                              Text(controller.bookMarkLists[index]['id']
                                  .toString()),
                            ],
                          ),
                          onTap: () => Get.to(
                              TrackDetailsClass(
                                  trackId: controller.bookMarkLists[index]
                                      ['id']),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(seconds: 1)),
                        ),
                        const Divider(
                          thickness: 3,
                        )
                      ],
                    );
                  }))),
        ],
      )),
    );
  }
}
