class UserModel {
  static UserModel? currentUser;
  String id;
  String name;
  String email;
   List<String> favEventsIds;

  UserModel({required this.id, required this.name, required this.email, this.favEventsIds = const []}) ;

  UserModel.fromJson(Map<String, dynamic> json)
    : this(id: json["id"], name: json["name"],
    email: json["email"],
   favEventsIds: (json["favEventsIds"] as List<dynamic>).map((item)=> item.toString()).toList(),


  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "favEventsIds":favEventsIds
  };
}
