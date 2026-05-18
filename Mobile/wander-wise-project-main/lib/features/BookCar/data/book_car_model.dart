class BookCarModel {
  final The0? the0;
  final String? message;

  BookCarModel({this.the0, this.message});

  BookCarModel copyWith({The0? the0, String? message}) =>
      BookCarModel(the0: the0 ?? this.the0, message: message ?? this.message);

  factory BookCarModel.fromMap(Map<String, dynamic> json) => BookCarModel(
    the0: json["0"] == null ? null : The0.fromMap(json["0"]),
    message: json['message'] ?? 'Car booked successfully',
  );

  Map<String, dynamic> toMap() => {"0": the0?.toMap(), "message": message};
}

class The0 {
  final String? bookingId;
  final String? pickUpLocation;
  final String? pickupTime;
  final String? dropOffLocation;
  final String? pickdate;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  The0({
    this.bookingId,
    this.pickUpLocation,
    this.pickupTime,
    this.dropOffLocation,
    this.pickdate,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  The0 copyWith({
    String? bookingId,
    String? pickUpLocation,
    String? pickupTime,
    String? dropOffLocation,
    String? pickdate,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) => The0(
    bookingId: bookingId ?? this.bookingId,
    pickUpLocation: pickUpLocation ?? this.pickUpLocation,
    pickupTime: pickupTime ?? this.pickupTime,
    dropOffLocation: dropOffLocation ?? this.dropOffLocation,
    pickdate: pickdate ?? this.pickdate,
    updatedAt: updatedAt ?? this.updatedAt,
    createdAt: createdAt ?? this.createdAt,
    id: id ?? this.id,
  );

factory The0.fromMap(Map<String, dynamic> json) => The0(
  bookingId: json["booking_id"]?.toString(),
  pickUpLocation: json["pickUpLocation"]?.toString(),
  pickupTime: json["pickupTime"]?.toString(),
  dropOffLocation: json["dropOffLocation"]?.toString(),
  pickdate: json["pickdate"]?.toString(),
  updatedAt: json["updated_at"] == null ? null : DateTime.tryParse(json["updated_at"]),
  createdAt: json["created_at"] == null ? null : DateTime.tryParse(json["created_at"]),
  id: json["id"] is int ? json["id"] : int.tryParse(json["id"]?.toString() ?? ''),
);

  Map<String, dynamic> toMap() => {
    "booking_id": bookingId,
    "pickUpLocation": pickUpLocation,
    "pickupTime": pickupTime,
    "dropOffLocation": dropOffLocation,
    "pickdate": pickdate,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };
}
