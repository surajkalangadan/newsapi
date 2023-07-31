class Newsmodel {
  Newsmodel({
      this.status, 
      this.items,});

  Newsmodel.fromJson(dynamic json) {
    status = json['status'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
  }
  String? status;
  List<Items>? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Items {
  Items({
      this.title, 
      this.snippet, 
      this.publisher, 
      this.timestamp, 
      this.newsUrl, 
      this.images, 
      this.hasSubnews, 
      this.subnews,});

  Items.fromJson(dynamic json) {
    title = json['title'];
    snippet = json['snippet'];
    publisher = json['publisher'];
    timestamp = json['timestamp'];
    newsUrl = json['newsUrl'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    hasSubnews = json['hasSubnews'];
    if (json['subnews'] != null) {
      subnews = [];
      json['subnews'].forEach((v) {
        subnews?.add(Subnews.fromJson(v));
      });
    }
  }
  String? title;
  String? snippet;
  String? publisher;
  String? timestamp;
  String? newsUrl;
  Images? images;
  bool? hasSubnews;
  List<Subnews>? subnews;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['snippet'] = snippet;
    map['publisher'] = publisher;
    map['timestamp'] = timestamp;
    map['newsUrl'] = newsUrl;
    if (images != null) {
      map['images'] = images?.toJson();
    }
    map['hasSubnews'] = hasSubnews;
    if (subnews != null) {
      map['subnews'] = subnews?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Subnews {
  Subnews({
      this.title, 
      this.snippet, 
      this.publisher, 
      this.timestamp, 
      this.newsUrl, 
      this.images,});

  Subnews.fromJson(dynamic json) {
    title = json['title'];
    snippet = json['snippet'];
    publisher = json['publisher'];
    timestamp = json['timestamp'];
    newsUrl = json['newsUrl'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
  }
  String? title;
  String? snippet;
  String? publisher;
  String? timestamp;
  String? newsUrl;
  Images? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['snippet'] = snippet;
    map['publisher'] = publisher;
    map['timestamp'] = timestamp;
    map['newsUrl'] = newsUrl;
    if (images != null) {
      map['images'] = images?.toJson();
    }
    return map;
  }

}

class Images {
  Images({
      this.thumbnail, 
      this.original,});

  Images.fromJson(dynamic json) {
    thumbnail = json['thumbnail'];
    original = json['original'];
  }
  String? thumbnail;
  String? original;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['thumbnail'] = thumbnail;
    map['original'] = original;
    return map;
  }

}

