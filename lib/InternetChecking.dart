import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetChecking extends StatelessWidget {
  Widget widget;
  InternetChecking({Key? key,required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Connectivity connectivity = Connectivity();
    return StreamBuilder<ConnectivityResult>(
      stream: connectivity.onConnectivityChanged,
      builder: (context,AsyncSnapshot<ConnectivityResult> snapshot) {
          return InternetWidget(widget: widget, snapshot: snapshot);
    },);
  }
}

class InternetWidget extends StatefulWidget {
  AsyncSnapshot<ConnectivityResult> snapshot;
  final Widget widget;
  InternetWidget({Key? key,required this.widget,required this.snapshot}) : super(key: key);

  @override
  State<InternetWidget> createState() => _InternetWidgetState();
}

class _InternetWidgetState extends State<InternetWidget> {

  @override
  Widget build(BuildContext context) {
    switch(widget.snapshot.connectionState){
      case ConnectionState.active:
        final state = widget.snapshot.data;
        switch(state){
          case ConnectivityResult.none:
            return Center(child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.wifi_off_outlined,color: Colors.red,size: 40,),
                SizedBox(height: 10,),
                Text("No Internet Connection",style: TextStyle(fontSize: 18,color: Colors.red),),
              ],
            ),);
          default:
            return widget.widget;
        }
      case ConnectionState.waiting:
        final state = widget.snapshot.data;
        switch(state){
          case ConnectivityResult.none:
            return Center(child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.wifi_off_outlined,color: Colors.red,size: 40,),
                SizedBox(height: 10,),
                Text("No Internet Connection",style: TextStyle(fontSize: 18,color: Colors.red),),
              ],
            ),);
          default:
            return widget.widget;
        }
      default:
        return const Text('error');
    }
  }
}

