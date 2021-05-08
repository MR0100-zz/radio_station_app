import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/assets_utils.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_button.dart';
import 'package:radio_station/view/custom_widgets/custom_text_field.dart';
import 'login_screen.dart';

/// ignore:must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<ThemeController>(
          init: _themeController,
          builder: (_) {
            return Container(
              height: screenSize.height,
              width: screenSize.width,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  colors: [
                    _themeController.secondaryBackgroundGradientColor,
                    _themeController.primaryBackgroundGradientColor,
                  ],
                  radius: 1,
                ),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: screenSize.height * 0.25),
                    Text(
                      'Forgot Password',
                      style: FontStyleData.h30(
                        fontColor: _themeController.isDarkMode
                            ? ColorData.color_0xffffffff
                            : ColorData.color_0xff543d81,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: screenSize.width / 1.7,
                      child: Text(
                        'Enter your email address below.\nWe\'ll look for your account and send you a password reset email.',
                        textAlign: TextAlign.center,
                        style: FontStyleData.h14(
                          fontColor: _themeController.isDarkMode
                              ? ColorData.color_0xff9a9db0
                              : ColorData.color_0xff9184a6,
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    CustomTextField(
                      icon: AssetData.mailSvg,
                      hintText: "Email Address",
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      title: "Password Reset",
                      onPress: () {},
                    ),
                    SizedBox(height: screenSize.height * 0.3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ? ",
                          style: FontStyleData.h13(
                            fontColor: _themeController.isDarkMode
                                ? ColorData.color_0xffa79dbf
                                : ColorData.color_0xff9184a6,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.off(LoginScreen());
                          },
                          child: Text(
                            "Log In",
                            style: FontStyleData.h13(
                              fontColor: ColorData.color_0xfff42f78,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
