class LoginRequestModel {

  LoginRequestModel({required this.email, required this.password});
  String email;
  String password;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
