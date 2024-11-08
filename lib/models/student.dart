class Student {
  int? id;
  String name;
  String studentId;
  String phone;
  String email;
  String location;

  Student({this.id, required this.name, required this.studentId, required this.phone, required this.email, required this.location});

  // Convert Student object to Map for database storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'StudentId': studentId,
      'phone': phone,
      'email': email,
      'location': location,
    };
  }

  // Convert Map to Student object
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      studentId: map['studentId'],
      phone: map['phone'],
      email: map['email'],
      location: map['location'],
    );
  }
}
