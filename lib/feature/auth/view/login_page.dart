import 'dart:ui';

import 'package:cat_facts/config/route_config.dart';
import 'package:cat_facts/feature/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<AuthController> {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SafeArea(
            child: controller.obx(
              (state) => _buildForm(),
              onLoading: Stack(
                children: [
                  _buildForm(),
                  Container(
                    color: Colors.black.withOpacity(.5),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
              onError: (_) => _buildForm(isError: true),
              onEmpty: _buildForm(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm({bool isError = false}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black45,
            Colors.black87,
          ],
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(.5),
                      Colors.white.withOpacity(.2),
                    ],
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    width: 1.5,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      initialValue: controller.username.value,
                      onChanged: (value) {
                        controller.setUsername(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Username',
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      initialValue: controller.password.value,
                      obscureText: controller.isHidePassword.value,
                      onChanged: (value) {
                        controller.setPassword(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.togglePassword();
                          },
                          child: Icon(
                            controller.isHidePassword.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: TextButton(
                        onPressed: () async {
                          final isSuccess = await controller.login();
                          if (isSuccess) {
                            Get.rootDelegate.offNamed(RouteConfig.homeRoute);
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                            Colors.black87,
                          ),
                          foregroundColor: MaterialStatePropertyAll<Color>(
                            Colors.white,
                          ),
                        ),
                        child: Text('Login'),
                      ),
                    ),
                    if (isError)
                      Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Text(
                          'There is error on login process, try again',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
