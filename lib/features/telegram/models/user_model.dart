import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    this.id = -1,
    this.name = '',
    this.userPhoto = '',
    this.lastSeen = '',
    this.isOnline = false,
    this.isTyping = false,
    this.isVerified = false,
  });

  final int id;
  final String name;
  final String userPhoto;
  final String lastSeen;
  final bool isOnline;
  final bool isTyping;
  final bool isVerified;

  UserModel copyWith({
    int? id,
    String? name,
    String? userPhoto,
    String? lastSeen,
    bool? isOnline,
    bool? isTyping,
    bool? isVerified,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      userPhoto: userPhoto ?? this.userPhoto,
      lastSeen: lastSeen ?? this.lastSeen,
      isOnline: isOnline ?? this.isOnline,
      isTyping: isTyping ?? this.isTyping,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        userPhoto,
        lastSeen,
        isOnline,
        isTyping,
        isVerified,
      ];
}
