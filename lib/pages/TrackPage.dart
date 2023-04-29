import 'dart:convert';

import 'package:apna_software/InternetChecking.dart';
import 'package:apna_software/dataModel/trackModel/TrackInfoDetails.dart';
import 'package:flutter/material.dart';

// import '../TrackInfo/TrackInfo.dart';
import 'package:http/http.dart' as http;

class TrackDetailsClass extends StatefulWidget {

  String trackId;
  TrackDetailsClass({Key? key,required this.trackId}) : super(key: key);

  @override
  State<TrackDetailsClass> createState() => _TrackDetailsClassState();
}

class _TrackDetailsClassState extends State<TrackDetailsClass> {

  Future<TrackInfoDetails> trackDetails() async{
    final response = await http.get(Uri.parse("https://api.musixmatch.com/ws/1.1/track.get?track_id=${widget.trackId}&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      return TrackInfoDetails.fromJson(data);
    }else{
      return TrackInfoDetails.fromJson(data);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // trackDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Track Details"),
      ),
      body: InternetChecking(widget: FutureBuilder(
        future: trackDetails(),
        builder: (context, snapshot) {
          if(snapshot.data == null){
            return const Center(child: CircularProgressIndicator(),);
          }else{
            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  const Text("Track Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Text(snapshot.data?.message?.body?.track?.trackName as String,style: const TextStyle(fontSize: 20,color: Colors.grey)),
                  const SizedBox(height:20,),

                  const Text("Artist Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Text(snapshot.data?.message?.body?.track?.artistName as String,style: const TextStyle(fontSize: 20,color: Colors.grey)),
                  const SizedBox(height:20,),

                  const Text("Album Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Text(snapshot.data?.message?.body?.track?.albumName as String,style: const TextStyle(fontSize: 20,color: Colors.grey)),
                  const SizedBox(height:20,),

                  const Text("Rating",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Text(snapshot.data?.message?.body?.track?.trackRating.toString() as String,style: const TextStyle(fontSize: 20,color: Colors.grey)),
                  const SizedBox(height:20,),

                  const Text("Track url",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Text(snapshot.data?.message?.body?.track?.trackShareUrl as String,style: const TextStyle(fontSize: 20,color: Colors.grey)),
                  const SizedBox(height:20,),

                  const Text("Track Edit url",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Text(snapshot.data?.message?.body?.track?.trackEditUrl as String,style: const TextStyle(fontSize: 20,color: Colors.grey)),
                  const SizedBox(height:20,),

                ],
              ),
            );
          }
        },)),
    );
  }
}
