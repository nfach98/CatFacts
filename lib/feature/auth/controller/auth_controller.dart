import 'package:cat_facts/config/string_key.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController with StateMixin<bool> {
  var username = ''.obs;
  var password = ''.obs;
  var isHidePassword = true.obs;

  late SharedPreferences sharedPref;

  @override
  Future<void> onInit() async {
    sharedPref = await SharedPreferences.getInstance();
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  void setUsername(String value) {
    username.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void togglePassword() {
    isHidePassword.toggle();
  }

  Future<bool> checkUser() async {
    final username = sharedPref.getString(usernameKey);
    final password = sharedPref.getString(passwordKey);
    final result = username != null && password != null;
    return result;
  }

  Future<bool> login() async {
    change(null, status: RxStatus.loading());
    final setUsername = await sharedPref.setString(usernameKey, username.value);
    final setPassword = await sharedPref.setString(passwordKey, password.value);
    final result = setUsername && setPassword;

    change(result, status: result ? RxStatus.success() : RxStatus.error());
    return result;
  }

  Future<bool> logout() async {
    change(null, status: RxStatus.loading());
    final removeUsername = await sharedPref.remove(usernameKey);
    final removePassword = await sharedPref.remove(passwordKey);
    final result = removeUsername && removePassword;

    change(result, status: result ? RxStatus.success() : RxStatus.error());
    return result;
  }
}
