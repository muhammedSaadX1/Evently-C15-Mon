class UserModel{
   String name;
   String email;
  static  UserModel? currentUser;

  UserModel({required this.name, required this.email, });
}