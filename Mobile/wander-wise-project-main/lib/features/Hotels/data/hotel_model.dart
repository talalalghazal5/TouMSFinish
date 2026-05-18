class HotelModel {
    final int? id;
    final String? hotelName;
    final String? cityName;
    final String? hotelStatus;
    final String? roomStatus;
    final String? hotelDayPrice;
    final String? status;
    final String? image1;
    final String? image2;
    final String? image3;
    final String? image4;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    HotelModel({
        this.id,
        this.hotelName,
        this.cityName,
        this.hotelStatus,
        this.roomStatus,
        this.hotelDayPrice,
        this.status,
        this.image1,
        this.image2,
        this.image3,
        this.image4,
        this.createdAt,
        this.updatedAt,
    });

    HotelModel copyWith({
        int? id,
        String? hotelName,
        String? cityName,
        String? hotelStatus,
        String? roomStatus,
        String? hotelDayPrice,
        String? status,
        String? image1,
        String? image2,
        String? image3,
        String? image4,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        HotelModel(
            id: id ?? this.id,
            hotelName: hotelName ?? this.hotelName,
            cityName: cityName ?? this.cityName,
            hotelStatus: hotelStatus ?? this.hotelStatus,
            roomStatus: roomStatus ?? this.roomStatus,
            hotelDayPrice: hotelDayPrice ?? this.hotelDayPrice,
            status: status ?? this.status,
            image1: image1 ?? this.image1,
            image2: image2 ?? this.image2,
            image3: image3 ?? this.image3,
            image4: image4 ?? this.image4,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory HotelModel.fromMap(Map<String, dynamic> json) => HotelModel(
        id: json["id"],
        hotelName: json["hotelName"],
        cityName: json["cityName"],
        hotelStatus: json["hotelStatus"],
        roomStatus: json["roomStatus"],
        hotelDayPrice: json["hotelDayPrice"],
        status: json["status"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "hotelName": hotelName,
        "cityName": cityName,
        "hotelStatus": hotelStatus,
        "roomStatus": roomStatus,
        "hotelDayPrice": hotelDayPrice,
        "status": status,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
