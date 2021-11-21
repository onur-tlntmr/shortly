class Link {
  late String url, shortLink;

  Link();

  Link.withUrl(this.url);

  Link.withParams(this.url, this.shortLink);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    map["url"] = url;
    map["shortLink"] = shortLink;

    return map;
  }

  Link.fromObject(dynamic o) {
    url = o["url"];
    shortLink = o["shortLink"];
  }

  // Used for link-obj comparison and the LinkHistoryService use this
  @override
  bool operator ==(Object other) {
    if (other is! Link) {
      return false;
    }
    if (other.url != url || other.shortLink != shortLink) {
      return false;
    }

    return true;
  }
}