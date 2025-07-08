class UserModel
{
  bool status;
  String message;
  UserModel({
    required this.status,
    required this.message
  });

  factory UserModel.fetchUser(Map<String, dynamic> json)
  {
    return UserModel(status: json["status"], message: json["message"]);
  }
}