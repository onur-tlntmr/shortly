import 'package:flutter/material.dart';
import 'package:shortly/Models/link.dart';

class LinkHistoryService extends ChangeNotifier {
  final List<Link> links = [];

  static final LinkHistoryService _service = LinkHistoryService._internal();

  LinkHistoryService._internal();

  factory LinkHistoryService(){
    return _service;
  }


  addLink(Link link){

    if(!links.contains(link)){
      links.add(link);
    }
    else{
      throw Exception("Link already exist!");
    }
    notifyListeners();
  }

  get(int index){
    return links[index];
  }

  getAll(){
    return links;
  }


  removeLink(Link link){
    links.remove(link);
    notifyListeners();
  }

  removeAtLink(int index){
    links.removeAt(index);
    notifyListeners();
  }

  getSize(){
    return links.length;
  }


}
