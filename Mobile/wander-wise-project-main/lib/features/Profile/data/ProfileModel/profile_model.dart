
class ProfileModel {
    final User? user;

    ProfileModel({
        this.user,
    });

    ProfileModel copyWith({
        User? user,
    }) => 
        ProfileModel(
            user: user ?? this.user,
        );

    factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
    );

    Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
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
    final Profile? profile;

    User({
        this.id,
        this.name,
        this.email,
        this.role,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.profile,
    });

    User copyWith({
        int? id,
        String? name,
        String? email,
        String? role,
        dynamic emailVerifiedAt,
        DateTime? createdAt,
        DateTime? updatedAt,
        Profile? profile,
    }) => 
        User(
            id: id ?? this.id,
            name: name ?? this.name,
            email: email ?? this.email,
            role: role ?? this.role,
            emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            profile: profile ?? this.profile,
        );

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        profile: json["profile"] == null ? null : Profile.fromMap(json["profile"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "profile": profile?.toMap(),
    };
}

class Profile {
    final int? id;
    final int? userId;
    final String? phone;
    final dynamic address;
    final dynamic dateOfBirth;
    final String? image;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Profile({
        this.id,
        this.userId,
        this.phone,
        this.address,
        this.dateOfBirth,
        this.image,
        this.createdAt,
        this.updatedAt,
    });

    Profile copyWith({
        int? id,
        int? userId,
        String? phone,
        dynamic address,
        String? dateOfBirth,
        String? image,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        Profile(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            phone: phone ?? this.phone,
            address: address ?? this.address,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            image: image ?? this.image,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        id: json["id"],
        userId: json["user_id"],
        phone: json["phone"],
        address: json["address"],
        dateOfBirth: json["date-of-birth"],
        image: json["image"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "phone": phone,
        "address": address,
        "date-of-birth": dateOfBirth,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}