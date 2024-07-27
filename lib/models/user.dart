class User {
  int? id;
  String? firstName;
  String? lastName;
  String? gender;
  int? age;
  String? email;
  String? phone;
  String? image;
  Address? address;

  User.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    firstName = data['firstName'];
    lastName = data['lastName'];
    gender = data['gender'];
    age = data['age'];
    email = data['email'];
    phone = data['phone'];
    image = data['image'];
    address = Address.fromJson(data['address']);
  }
}

class Address {
  String? address;
  String? city;
  String? state;
  String? country;

  Address.fromJson(Map<String, dynamic> data) {
    address = data['address'];
    city = data['city'];
    state = data.containsKey('state') ? data['state'] : '';
    country = data['country'];
  }
}
