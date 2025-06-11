class LikeUnlikeModel{

  List<Map<String , dynamic>> _users = [
    {"name" : "Yash" , "isFav" : false},
    {"name" : "meet" , "isFav" : false},
    {"name" : "mann" , "isFav" : false},
    {"name" : "vandan" , "isFav" : false},
    {"name" : "dhruv" , "isFav" : false},
    {"name" : "shyam" , "isFav" : false}
  ];

  List<Map<String , dynamic>> get data => _users;

  void insertIntoList(Map<String , dynamic> user){
    _users.add(user);
    print("User is added into the list");
  }

  void favouriteUser(bool isFav , String name){
    int index = _users.indexWhere((element) => element["name"] == name);

    _users[index]["isFav"] = isFav;

    print(_users[index][isFav]);
    print("User is added to the favourite");
  }

}