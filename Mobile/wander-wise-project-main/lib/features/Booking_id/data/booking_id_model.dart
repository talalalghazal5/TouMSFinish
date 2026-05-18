class BookingIdModel {
    final String? bookingFor;
    final int? numbers;
    final String? bookingStatus;
    final int? userId;
    final DateTime? updatedAt;
    final DateTime? createdAt;
    final int? id;

    BookingIdModel({
        this.bookingFor,
        this.numbers,
        this.bookingStatus,
        this.userId,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    BookingIdModel copyWith({
        String? bookingFor,
        int? numbers,
        String? bookingStatus,
        int? userId,
        DateTime? updatedAt,
        DateTime? createdAt,
        int? id,
    }) => 
        BookingIdModel(
            bookingFor: bookingFor ?? this.bookingFor,
            numbers: numbers ?? this.numbers,
            bookingStatus: bookingStatus ?? this.bookingStatus,
            userId: userId ?? this.userId,
            updatedAt: updatedAt ?? this.updatedAt,
            createdAt: createdAt ?? this.createdAt,
            id: id ?? this.id,
        );

    factory BookingIdModel.fromMap(Map<String, dynamic> json) => BookingIdModel(
        bookingFor: json["bookingFor"],
        numbers: json["numbers"],
        bookingStatus: json["bookingStatus"],
        userId: json["user_id"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "bookingFor": bookingFor,
        "numbers": numbers,
        "bookingStatus": bookingStatus,
        "user_id": userId,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}