
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController{

  final bookMarkLists = [].obs;

  addOrRemoveListItem(Map<String,dynamic> map,String id,String name){
    int isExist = bookMarkLists.indexWhere((element) => element['id'] == id);
    if(isExist != -1){
      bookMarkLists.removeAt(isExist);
      Get.snackbar(name, "Remove the item SuccessFully...",colorText: Colors.red,margin: const EdgeInsets.only(top: 80,left: 10,right: 10),duration: const Duration(milliseconds: 1000));
    }else{
      bookMarkLists.add(map);
      Get.snackbar(name, "Add the item SuccessFully...",colorText: Colors.green,margin: const EdgeInsets.only(top: 80,left: 10,right: 10),duration: const Duration(milliseconds: 1000));
    }
  }

  addedOrNotInList(String id){
    int isExist = bookMarkLists.indexWhere((element) => element['id'] == id);
    if(isExist != -1){
      return true;
    }else{
      return false;
    }
  }

}

class BookMarkItem{
  String trackId,trackName;
  BookMarkItem(this.trackId,this.trackName);
}