class Video{
  String? iso_639_1;
  String? iso_3166_1;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? publishedAt;
  String? id;


  Video(
      {this.iso_639_1,
      this.iso_3166_1,
      this.name,
      this.key,
      this.site,
      this.size,
      this.type,
      this.official,
      this.publishedAt,
      this.id});

  Video.fromJson(Map<String, dynamic> json) {
    iso_639_1= json['iso_639_1'];
    iso_3166_1= json['iso_3166_1'];
    name= json['name'];
    key= json['key'];
    site= json['site'];
    size= json['size'];
    type= json['type'];
    official= json['official'];
    publishedAt= json['published_at'];
    id= json['id'];
  }

}

