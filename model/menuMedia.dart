class MenuMedia {
  final String? alt;
  final String src;
  final String? thumbnail;

  MenuMedia({this.thumbnail, this.alt, required this.src});

  factory MenuMedia.fromMap(Map<String, dynamic> mediaMap) {
    return MenuMedia(
      alt: mediaMap['alt'],
      src: mediaMap['src'] ?? '',
      thumbnail: mediaMap['thumnail'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'alt': alt,
      'src': src,
      'thumnail': thumbnail,
    };
  }
}
