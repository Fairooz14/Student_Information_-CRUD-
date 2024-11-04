class Student {
  int? id;
  String name;
  String phone;
  String email;
  String location;

  Student({this.id, required this.name, required this.phone, required this.email, required this.location});

  // Convert Student object to Map for database storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
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
      phone: map['phone'],
      email: map['email'],
      location: map['location'],
    );
  }
}
