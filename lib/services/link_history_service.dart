import 'package:flutter/material.dart';
import 'package:shortly/Models/link.dart';

class LinkHistoryService extends ChangeNotifier {
  final List<Link> links = [];

  static final LinkHistoryService _service = LinkHistoryService._internal();

  LinkHistoryService._internal();

  factory LinkHistoryService(){ //this is singleton obj
    return _service;
  }


  addLink(Link link){

    if(!links.contains(link)){
      links.add(link);
    }
    else{
      throw Exception("Link already exist!");
    }
    notifyListeners(); //for notify changes
  }

  get(int index){
    return links[index];
  }

  getAll(){
    return links;
  }


  removeLink(Link link){
    links.remove(link);
    notifyListeners();//for notify changes
  }

  removeAtLink(int index){
    links.removeAt(index);
    notifyListeners();//for notify changes
  }

  getSize(){
    return links.length;
  }


}
