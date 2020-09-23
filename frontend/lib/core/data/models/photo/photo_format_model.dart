import 'format_data_model.dart';

class PhotoFormatModel {
  PhotoFormatModel({
    this.large,
    this.small,
    this.medium,
    this.thumbnail,
  });

  final FormatDataModel large;
  final FormatDataModel small;
  final FormatDataModel medium;
  final FormatDataModel thumbnail;

  PhotoFormatModel copyWith({
    FormatDataModel large,
    FormatDataModel small,
    FormatDataModel medium,
    FormatDataModel thumbnail,
  }) =>
      PhotoFormatModel(
        large: large ?? this.large,
        small: small ?? this.small,
        medium: medium ?? this.medium,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory PhotoFormatModel.fromMap(Map<String, dynamic> json) =>
      PhotoFormatModel(
        large: json["large"] == null
            ? null
            : FormatDataModel.fromMap(json["large"]),
        small: json["small"] == null
            ? null
            : FormatDataModel.fromMap(json["small"]),
        medium: json["medium"] == null
            ? null
            : FormatDataModel.fromMap(json["medium"]),
        thumbnail: json["thumbnail"] == null
            ? null
            : FormatDataModel.fromMap(json["thumbnail"]),
      );

  Map<String, dynamic> toMap() => {
        "large": large == null ? null : large.toMap(),
        "small": small == null ? null : small.toMap(),
        "medium": medium == null ? null : medium.toMap(),
        "thumbnail": thumbnail == null ? null : thumbnail.toMap(),
      };

  @override
  String toString() {
    return 'PhotoFormatModel(large: $large, small: $small, medium: $medium, thumbnail: $thumbnail)';
  }
}
