class DestinationModel {
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

    DestinationModel({
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
    });

    DestinationModel copyWith({
        int? id,
        String? destinationName,
        String? destinationType,
        String? description,
        String? country,
        String? image1,
        String? image2,
        String? image3,
        String? image4,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        DestinationModel(
            id: id ?? this.id,
            destinationName: destinationName ?? this.destinationName,
            destinationType: destinationType ?? this.destinationType,
            description: description ?? this.description,
            country: country ?? this.country,
            image1: image1 ?? this.image1,
            image2: image2 ?? this.image2,
            image3: image3 ?? this.image3,
            image4: image4 ?? this.image4,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory DestinationModel.fromMap(Map<String, dynamic> json) => DestinationModel(
        id: json["id"],
        destinationName: json["destinationName"],
        destinationType: json["destinationType"],
        description: json["description"],
        country: json["country"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "destinationName": destinationName,
        "destinationType": destinationType,
        "description": description,
        "country": country,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}