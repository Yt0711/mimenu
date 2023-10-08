class Media {
  final String? alt;
  final String src;
  final String? thumbnail;

  Media({this.thumbnail, this.alt, required this.src});

  factory Media.fromMap(Map<String, dynamic> mediaMap) {
    try {
      return Media(
        alt: mediaMap['alt'],
        src: mediaMap['src'] ?? '',
        thumbnail: mediaMap['thumnail'],
      );
    } catch (e) {
      print('Error parsing Media: $e');
      rethrow;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'alt': alt,
      'src': src,
      'thumnail': thumbnail,
    };
  }
}
