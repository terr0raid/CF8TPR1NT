// firebase response model
class LoginResponseModel {
  final String? idToken;
  final String? email;
  final String? refreshToken;
  final String? expiresIn;
  final String? localId;
  final String? registered;

  LoginResponseModel({
    this.idToken,
    this.email,
    this.refreshToken,
    this.expiresIn,
    this.localId,
    this.registered,
  });

  factory LoginResponseModel.fromJson(Map<String, String?> json) => LoginResponseModel(
        idToken: json["idToken"],
        email: json["email"],
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"],
        localId: json["localId"],
        registered: json["registered"],
      );
}
