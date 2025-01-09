class UserModel {
  String? id;
  String? username;
  String? email;
  String? password;
  String? profilePic;
  String? gender;
  String? language;
  String? city;
  String? favouriteEvent;
  String? musicGenre;
  String? phoneNumber;
  String? dateOfBirth;
  String? status;
  bool? isOnline;
  String? lastActive;
  String? createdAt;

  UserModel({
    this.id = '',
    this.username = '',
    this.email = '',
    this.language = '',
    this.city = '',
    this.favouriteEvent = '',
    this.musicGenre = '',
    this.password = '',
    this.profilePic = '',
    this.gender = '',
    this.phoneNumber = '',
    this.dateOfBirth = '',
    this.status = '',
    this.isOnline = false,
    this.lastActive = '',
    this.createdAt = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'city': city,
      'language': language,
      'favouriteEvent': favouriteEvent,
      'musicGenre': musicGenre,
      'profilePic': profilePic,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth,
      'status': status,
      'isOnline': isOnline,
      'lastActive': lastActive,
      'createdAt':
          createdAt ?? DateTime.now().millisecondsSinceEpoch.toString(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      city: map['city'] ?? '',
      language: map['language'] ?? '',
      favouriteEvent: map['favouriteEvent'] ?? '',
      musicGenre: map['musicGenre'] ?? '',
      profilePic: map['profilePic'] ?? '',
      gender: map['gender'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      status: map['status'] ?? '',
      isOnline: map['isOnline'] ?? false,
      lastActive: map['lastActive'] ?? '',
      createdAt:
          map['createdAt'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
    );
  }
}
