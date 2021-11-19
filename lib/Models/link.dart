class Link {
  late String _url, _shortLink;

  Link();

  Link.withParams(this._url,this._shortLink);


  String get url => _url;
  String get shortLink => _shortLink;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    map["url"] = url;
    map["shortLink"] = shortLink;

    return map;
  }


  Link.fromObject(dynamic o){
    _url = o["url"];
    _shortLink = o["shortLink"];

  }

}
