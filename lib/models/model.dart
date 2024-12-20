class Section {
  final int id;
  final String name;
  final List<Chapter> chapters;

  Section({required this.id, required this.name, required this.chapters});
}

class Chapter {
  final int id;
  final String name;
  final String? details;
  final int sectionId;
  final List<Body> body;
  final List<Media>? media;
  final DateTime updatedAt;
  final bool markAsNew;

  Chapter({
    required this.id,
    required this.name,
    this.details,
    required this.sectionId,
    required this.body,
    this.media,
    required this.updatedAt,
    required this.markAsNew,
  });
}

class Body {
  final String type;
  final String text;
  final int index;

  Body({required this.type, required this.text, required this.index});
}

class Media {
  final int mediaId;
  final String url;
  final String caption;
  final String orientation;
  final String type;

  Media({
    required this.mediaId,
    required this.url,
    required this.caption,
    required this.orientation,
    required this.type,
  });
}
