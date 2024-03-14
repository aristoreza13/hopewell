class VideoYoutubeData {
  String? title;
  String? authorName;
  String? authorUrl;
  String? type;
  int? height;
  int? width;
  String? version;
  String? providerName;
  String? providerUrl;
  int? thumbnailHeight;
  int? thumbnailWidth;
  String? thumbnailUrl;
  String? html;

  VideoYoutubeData({
    this.title,
    this.authorName,
    this.authorUrl,
    this.type,
    this.height,
    this.width,
    this.version,
    this.providerName,
    this.providerUrl,
    this.thumbnailHeight,
    this.thumbnailWidth,
    this.thumbnailUrl,
    this.html,
  });

  factory VideoYoutubeData.fromJson(Map<String, dynamic> json) =>
      VideoYoutubeData(
        title: json["title"],
        authorName: json["author_name"],
        authorUrl: json["author_url"],
        type: json["type"],
        height: json["height"],
        width: json["width"],
        version: json["version"],
        providerName: json["provider_name"],
        providerUrl: json["provider_url"],
        thumbnailHeight: json["thumbnail_height"],
        thumbnailWidth: json["thumbnail_width"],
        thumbnailUrl: json["thumbnail_url"],
        html: json["html"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "author_name": authorName,
        "author_url": authorUrl,
        "type": type,
        "height": height,
        "width": width,
        "version": version,
        "provider_name": providerName,
        "provider_url": providerUrl,
        "thumbnail_height": thumbnailHeight,
        "thumbnail_width": thumbnailWidth,
        "thumbnail_url": thumbnailUrl,
        "html": html,
      };
}
