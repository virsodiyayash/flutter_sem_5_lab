class StudentModel{

  int? id;
  String name;
  String enrollment;
  String email;

  StudentModel({required this.name , required this.enrollment , required this.email});

  Map<String , dynamic> toMap() => {
    "ID" : id,
    "NAME" : name,
    "ENROLLMENT" : enrollment,
    "EMAIL" : email
  };

  factory StudentModel.fromMap(Map<String , dynamic> map){
    return StudentModel(
        name: "NAME",
        enrollment: "ENROLLMENT",
        email: "EMAIL");
  }

}