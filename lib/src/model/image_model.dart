class ImageModel {
  String url;
  String id;
  ImageModel(this.url, this.id);
  factory ImageModel.fromJson(dynamic json) {
    return ImageModel(json['url'] as String, json['id'] as String);
  }
  @override
  String toString() {
    return 'url:$url, id:$id';
  }
}
