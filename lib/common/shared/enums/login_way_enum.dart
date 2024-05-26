class LoginWayEnum {
  final int token;
  final int phone;
  final int email;
  final int socialMedia;

  const LoginWayEnum(
      {this.phone = 2, this.token = 1, this.socialMedia = 4, this.email = 3});
}
