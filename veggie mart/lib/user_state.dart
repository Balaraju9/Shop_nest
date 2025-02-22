import 'main.dart';
import 'login.dart';


// user_state.dart


class UserState {
  static final UserState _instance = UserState._internal();

  factory UserState() {
    return _instance;
  }

  UserState._internal();

  String? email;
  String? username;

  void setUserInfo(String email, String username) {
    this.email = email;
    this.username = username;
  }
}
