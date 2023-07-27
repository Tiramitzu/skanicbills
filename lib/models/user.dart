class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.address,
    required this.level,
    required this.profilePicture,
    required this.nisn,
    required this.nis,
    required this.grade,
    required this.major,
    required this.sClass,
  });

  late int id, phone, level, nisn, nis, grade, major, sClass;
  late String username, password, name, email, address, profilePicture;
}
