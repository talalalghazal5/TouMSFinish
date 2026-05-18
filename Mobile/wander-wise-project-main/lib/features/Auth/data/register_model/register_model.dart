class RegisterModel {
  final String? message;
  final User? user;

  RegisterModel({this.message, this.user});

  RegisterModel copyWith({String? message, User? user}) =>
      RegisterModel(message: message ?? this.message, user: user ?? this.user);

  factory RegisterModel.fromMap(Map<String, dynamic> json) => RegisterModel(
    message: json["message:"],
    user: json["User"] == null ? null : User.fromMap(json["User"]),
  );

  Map<String, dynamic> toMap() => {"message:": message, "User": user?.toMap()};
}

class User {
  final String? name;
  final String? email;
  final String? role;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  User({
    this.name,
    this.email,
    this.role,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  User copyWith({
    String? name,
    String? email,
    String? role,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) => User(
    name: name ?? this.name,
    email: email ?? this.email,
    role: role ?? this.role,
    updatedAt: updatedAt ?? this.updatedAt,
    createdAt: createdAt ?? this.createdAt,
    id: id ?? this.id,
  );

  factory User.fromMap(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    role: json["role"],
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email,
    "role": role,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };
}
