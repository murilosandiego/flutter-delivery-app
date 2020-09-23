class FormatDataModel {
  FormatDataModel({
    this.ext,
    this.url,
    this.hash,
    this.mime,
    this.path,
    this.size,
    this.width,
    this.height,
  });

  final String ext;
  final String url;
  final String hash;
  final String mime;
  final dynamic path;
  final double size;
  final int width;
  final int height;

  FormatDataModel copyWith({
    String ext,
    String url,
    String hash,
    String mime,
    dynamic path,
    double size,
    int width,
    int height,
  }) =>
      FormatDataModel(
        ext: ext ?? this.ext,
        url: url ?? this.url,
        hash: hash ?? this.hash,
        mime: mime ?? this.mime,
        path: path ?? this.path,
        size: size ?? this.size,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  factory FormatDataModel.fromMap(Map<String, dynamic> json) => FormatDataModel(
        ext: json["ext"] == null ? null : json["ext"],
        url: json["url"] == null ? null : json["url"],
        hash: json["hash"] == null ? null : json["hash"],
        mime: json["mime"] == null ? null : json["mime"],
        path: json["path"] == null ? null : json["path"],
        size: json["size"] == null ? null : json["size"].toDouble(),
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
      );

  Map<String, dynamic> toMap() => {
        "ext": ext,
        "url": url,
        "hash": hash,
        "mime": mime,
        "path": path,
        "size": size,
        "width": width,
        "height": height,
      };
}
