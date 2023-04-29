import 'dart:convert';
import 'TrackPage.dart';
import 'package:apna_software/InternetChecking.dart';
import 'package:apna_software/dataModel/trackListModel/TrackListModel.dart';
import 'package:apna_software/pages/BookMarkPage.dart';
import 'package:apna_software/stateManagement/HomePageController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController controller = Get.put(HomePageController());

  Future<TrackListModel> getData() async{
    final response = await http.get(Uri.parse("https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      return TrackListModel.fromJson(data);
    }else{
      return TrackListModel.fromJson(data);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar code...
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Trending Song",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      //body code here...
      body: InternetChecking(widget: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
        if(!snapshot.hasData){
          return const Center(child: CircularProgressIndicator());
        }else{
          return ListView.builder(
            itemCount: snapshot.data?.message?.body?.trackList?.length,
            itemBuilder: (context, index) {

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () => Get.to(TrackDetailsClass(trackId: snapshot.data?.message?.body?.trackList![index].track?.trackId.toString() as String),transition: Transition.rightToLeftWithFade,duration: const Duration(seconds: 1)),
                    leading: const Icon(CupertinoIcons.music_note_2,
                        color: Colors.blue, size: 30),
                    trailing: Obx(() => IconButton(
                      onPressed: () {
                        Map<String,dynamic> map = {
                          'id' : snapshot.data?.message?.body?.trackList![index].track?.trackId.toString(),
                          'trackName' : snapshot.data?.message?.body?.trackList![index].track?.trackName.toString(),
                          "artistName" : snapshot.data?.message?.body?.trackList![index].track?.artistName.toString() as String
                        };
                        controller.addOrRemoveListItem(map,snapshot.data?.message?.body?.trackList![index].track?.trackId.toString() as String,snapshot.data?.message?.body?.trackList![index].track?.trackName.toString() as String);
                      },
                      icon: controller.addedOrNotInList(snapshot.data?.message?.body?.trackList![index].track?.trackId.toString() as String,)
                          ? const Icon(
                        Icons.bookmark_added,
                        color: Colors.blue,
                      )
                          : const Icon(
                        Icons.bookmark_add_outlined,
                        color: Colors.blue,
                      ),
                    )),
                    title: Text(
                      snapshot.data?.message?.body?.trackList![index].track?.trackName.toString() as String,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(snapshot.data?.message?.body?.trackList![index].track?.artistName.toString() as String),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                ],
              );
            },
          );
        }
      },)),

      //floating action visible when the bookmarks list length greater than 0...
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(controller.bookMarkLists.isEmpty){
            Get.snackbar("Empty BookMark", "No Element Present in BookMark List...",margin: const EdgeInsets.only(bottom: 90,left: 10,right: 10),colorText: Colors.blue,snackPosition: SnackPosition.BOTTOM,duration: const Duration(seconds: 1));
          }else{
            Get.to(BookMarkPage(),transition: Transition.downToUp,duration: const Duration(seconds: 1));
          }
        },
        child: Obx(() => Badge(
          label: Text(controller.bookMarkLists.length.toString()),
          isLabelVisible: controller.bookMarkLists.isNotEmpty?true:false,
          child: const Icon(Icons.bookmarks),
        ),)
      ),

    );
  }
}
