import 'package:cat_facts/home/model/fact_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<FactModel>> {
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
    change([], status: RxStatus.loading());

    try {
      final result = await dio.get('https://cat-fact.herokuapp.com/facts');
      final response = result.data as List<dynamic>;
      final list = response
          .map((e) => FactModel.fromJson(e as Map<String, dynamic>))
          .toList();
      change(list, status: RxStatus.success());
    } catch (e) {
      error = e.toString();
      change([], status: RxStatus.error(e.toString()));
    }
  }
}
