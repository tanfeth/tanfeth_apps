


class AuthEndPoints {
  final String sendCode;
  final String login;
  final String register;
  final String deleteAccount;
  final String verifyEmail;
  final String uploadDocument;
  final String getProfile;
  final String updateProfile;
  final String checkStatus;

  const AuthEndPoints({
    this.sendCode = "/User/sendCode",
    this.login="/Driver/login",
    this.register = "/User/Register",
    this.getProfile="/User/driver/profile",
    this.deleteAccount="/User/delete",
    this.verifyEmail="/User/send-email",
    this.uploadDocument="/Driver",
    this.updateProfile="/User/profile",
    this.checkStatus="/Car/DriverCarStatus",
  });

}