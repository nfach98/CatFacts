import 'package:cat_facts/config/string_key.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController with StateMixin<bool> {
  var username = ''.obs;
  var password = ''.obs;
  var isHidePassword = false.obs;

  late SharedPreferences sharedPref;
  var isAuth = true.obs;

  @override
  Future<void> onInit() async {
    sharedPref = await SharedPreferences.getInstance();
    final username = sharedPref.getString(usernameKey);
    final password = sharedPref.getString(passwordKey);
    isAuth(username != null && password != null);
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

  Future<bool> login() async {
    change(null, status: RxStatus.loading());
    final setUsername = await sharedPref.setString(usernameKey, username.value);
    final setPassword = await sharedPref.setString(passwordKey, password.value);
    final result = setUsername && setPassword;

    change(result, status: result ? RxStatus.success() : RxStatus.error());
    isAuth(setUsername && setPassword);
    return result;
  }

  Future<bool> logout() async {
    change(null, status: RxStatus.loading());
    final removeUsername = await sharedPref.remove(usernameKey);
    final removePassword = await sharedPref.remove(passwordKey);
    final result = removeUsername && removePassword;

    change(result, status: result ? RxStatus.success() : RxStatus.error());
    isAuth(removeUsername && removePassword);
    return result;
  }
}
