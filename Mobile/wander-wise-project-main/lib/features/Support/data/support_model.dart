class SupportModel {
    final int? id;
    final String? requestDescription;
    final String? requestType;
    final String? requestResponse;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    SupportModel({
        this.id,
        this.requestDescription,
        this.requestType,
        this.requestResponse,
        this.createdAt,
        this.updatedAt,
    });

    SupportModel copyWith({
        int? id,
        String? requestDescription,
        String? requestType,
        String? requestResponse,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        SupportModel(
            id: id ?? this.id,
            requestDescription: requestDescription ?? this.requestDescription,
            requestType: requestType ?? this.requestType,
            requestResponse: requestResponse ?? this.requestResponse,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory SupportModel.fromMap(Map<String, dynamic> json) => SupportModel(
        id: json["id"],
        requestDescription: json["requestDescription"],
        requestType: json["requestType"],
        requestResponse: json["requestResponse"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "requestDescription": requestDescription,
        "requestType": requestType,
        "requestResponse": requestResponse,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}