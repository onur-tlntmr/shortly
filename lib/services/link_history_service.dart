import 'dart:collection';

import 'package:shortly/Models/link.dart';

class LinkHistoryService {
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
  }

  get(int index){
    return links[index];
  }

  getAll(){
    return links;
  }


  removeLink(Link link){
    links.remove(link);
  }

  removeAtLink(int index){
    links.removeAt(index);
  }

  getSize(){
    return links.length;
  }


}
