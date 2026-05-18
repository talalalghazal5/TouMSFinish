class TourModel {
  final int? id;
  final String? tourName;
  final String? duration;
  final String? tourPrice;
  final String? tourDescription;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  bool isFavorite;
  TourModel({
    this.id,
    this.tourName,
    this.duration,
    this.tourPrice,
    this.tourDescription,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.isFavorite = false,
  });

  TourModel copyWith({
    int? id,
    String? tourName,
    String? duration,
    String? tourPrice,
    String? tourDescription,
    String? image,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isFavorite,
  }) => TourModel(
    id: id ?? this.id,
    tourName: tourName ?? this.tourName,
    duration: duration ?? this.duration,
    tourPrice: tourPrice ?? this.tourPrice,
    tourDescription: tourDescription ?? this.tourDescription,
    image: image ?? this.image,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isFavorite: isFavorite ?? this.isFavorite,
  );

  factory TourModel.fromMap(Map<String, dynamic> json) => TourModel(
    id: json["id"],
    tourName: json["tourName"],
    duration: json["duration"],
    tourPrice: json["tourPrice"],
    tourDescription: json["tourDescription"],
    image: json["image"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
        isFavorite: false,
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "tourName": tourName,
    "duration": duration,
    "tourPrice": tourPrice,
    "tourDescription": tourDescription,
    "image": image,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
