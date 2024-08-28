import 'package:cat_facts/feature/home/model/user.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<User>> {
  final dio = Dio(
    BaseOptions(connectTimeout: Duration(seconds: 15)),
  );

  String? error;

  @override
  void onInit() async {
    super.onInit();
    getFacts();
  }

  getFacts() async {
    change(null, status: RxStatus.loading());

    try {
      final result = await dio.get('https://dummyjson.com/users');
      final response = result.data['users'] as List<dynamic>;
      final list = response
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList();
      change(
        list,
        status: list.isEmpty ? RxStatus.empty() : RxStatus.success(),
      );
    } catch (e) {
      error = e.toString();
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
