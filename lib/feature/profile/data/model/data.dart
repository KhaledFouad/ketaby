class Data {
  int? id;
  String? name;
  String? email;
  String? address;
  String? city;
  String? phone;
  bool? emailVerified;
  String? image;

  Data({
    this.id,
    this.name,
    this.email,
    this.address,
    this.city,
    this.phone,
    this.emailVerified,
    this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        address: json['address'] ?? 'Address',
        city: json['city'] ?? 'City',
        phone: json['phone'] ?? '0000000000',
        emailVerified: json['email_verified'] as bool?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'address': address,
        'city': city,
        'phone': phone,
        'email_verified': emailVerified,
        'image': image,
      };
}
