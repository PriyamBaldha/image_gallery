class IMAGE {
  final String image;
  final List images;

  IMAGE({
    required this.image,
    required this.images,
  });

  factory IMAGE.fromJSON(Map json) {
    return IMAGE(image: json["image"], images: json["images"]);
  }
}
