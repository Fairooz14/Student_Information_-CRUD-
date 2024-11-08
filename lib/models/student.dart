class Student {
  int? id;
  String? studentId;
  String? name;
  String? phone;
  String? email;
  String? location;

  Student({this.id, this.studentId, this.name, this.phone, this.email, this.location});

  // Convert a Student object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentId': studentId ?? '', // Provide default empty strings for null values
      'name': name ?? '',
      'phone': phone ?? '',
      'email': email ?? '',
      'location': location ?? '',
    };
  }

  // Extract a Student object from a Map object
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int?,
      studentId: map['studentId'] as String?,
      name: map['name'] as String?,
      phone: map['phone'] as String?,
      email: map['email'] as String?,
      location: map['location'] as String?,
    );
  }
}
