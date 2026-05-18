class LoginModel {
    final String? message;
    final User? user;
    final String? token;

    LoginModel({
        this.message,
        this.user,
        this.token,
    });
        LoginModel copyWith({
        String? message,
        User? user,
        String? token,
    }) => 
        LoginModel(
            message: message ?? this.message,
            user: user ?? this.user,
            token: token ?? this.token,
        );

    factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        message: json["message:"],
        user: json["User:"] == null ? null : User.fromMap(json["User:"]),
        token: json["Token:"],
    );

    Map<String, dynamic> toMap() => {
        "message:": message,
        "User:": user?.toMap(),
        "Token:": token,
    };
}

class User {
    final int? id;
    final String? name;
    final String? email;
    final String? role;
    final dynamic emailVerifiedAt;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    User({
        this.id,
        this.name,
        this.email,
        this.role,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };

}

