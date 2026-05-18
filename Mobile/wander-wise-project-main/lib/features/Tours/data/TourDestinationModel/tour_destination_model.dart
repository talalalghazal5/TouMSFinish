class TourDestinationModel {
  final int? id;
  final String? destinationName;
  final String? destinationType;
  final String? description;
  final String? country;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pivot? pivot;

  TourDestinationModel({
    this.id,
    this.destinationName,
    this.destinationType,
    this.description,
    this.country,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory TourDestinationModel.fromMap(Map<String, dynamic> json) =>
      TourDestinationModel(
        id: json["id"],
        destinationName: json["destinationName"],
        destinationType: json["destinationType"],
        description: json["description"],
        country: json["country"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null ? null : Pivot.fromMap(json["pivot"]),
      );
}
class Pivot {
    final int? tourId;
    final int? destinationId;

    Pivot({
        this.tourId,
        this.destinationId,
    });

    Pivot copyWith({
        int? tourId,
        int? destinationId,
    }) => 
        Pivot(
            tourId: tourId ?? this.tourId,
            destinationId: destinationId ?? this.destinationId,
        );

    factory Pivot.fromMap(Map<String, dynamic> json) => Pivot(
        tourId: json["tour_id"],
        destinationId: json["destination_id"],
    );

    Map<String, dynamic> toMap() => {
        "tour_id": tourId,
        "destination_id": destinationId,
    };
}