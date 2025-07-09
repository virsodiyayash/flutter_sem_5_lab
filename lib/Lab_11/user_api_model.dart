class UserApi{
  String? id;
  String? name;
  String? city;

  UserApi({this.id , this.name , this.city});

  Map<String , dynamic> toMap(UserApi user) => {
    "id" : user.id,
    "Name" : user.name,
    "City" : user.city,
  };

  factory UserApi.fromMap(Map<String , dynamic> map){
    return UserApi(
        id: map["id"],
        name: map["Name"],
        city: map["City"],
    );
  }
}