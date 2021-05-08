import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/assets_utils.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/utilities/var_utils.dart';
import 'package:radio_station/view/authentication_view/signup_screen.dart';
import 'package:radio_station/view/custom_widgets/custom_button.dart';
import 'package:radio_station/view/custom_widgets/custom_image_view.dart';
import 'package:radio_station/view/custom_widgets/custom_social_button.dart';
import 'package:radio_station/view/custom_widgets/custom_text_field.dart';
import 'package:radio_station/view/startup_guide_view/startup_guide_screen.dart';
import 'forgot_password_screen.dart';

/// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
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
                    SizedBox(height: screenSize.height * 0.08),
                    CustomImageView(
                      imageUrl: AssetData.appLogo,
                      isFromAssets: true,
                      height: screenSize.height * 0.15,
                    ),
                    SizedBox(height: 17),
                    Text(
                      'Welcome Back !',
                      style: FontStyleData.h30(
                        fontColor: _themeController.isDarkMode
                            ? ColorData.color_0xffffffff
                            : ColorData.color_0xff543d81,
                      ),
                    ),
                    Text(
                      'Login to continue Radio App',
                      style: FontStyleData.h14(
                        fontColor: ColorData.color_0xff9184a6,
                      ),
                    ),
                    SizedBox(height: 26),
                    CustomTextField(
                      icon: AssetData.mailSvg,
                      hintText: "Email Address",
                    ),
                    SizedBox(height: 18),
                    CustomTextField(
                      icon: AssetData.lockSvg,
                      hintText: "Password",
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ColorData.color_0xff1d192c,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(3),
                          child: Icon(
                            Icons.check,
                            color: ColorData.color_0xff9184a6,
                            size: 10,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Remember me',
                          style: FontStyleData.h12(
                            fontColor: _themeController.isDarkMode
                                ? ColorData.color_0xff9184a6
                                : ColorData.color_0xff1d192c,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.off(ForgotPasswordScreen());
                          },
                          child: Text(
                            'Forgot password?',
                            style: FontStyleData.h12(
                              fontColor: _themeController.isDarkMode
                                  ? ColorData.color_0xff9184a6
                                  : ColorData.color_0xff1d192c,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    CustomButton(
                      title: "Log In",
                      onPress: loginFunction,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'OR',
                      style: FontStyleData.h23(
                        fontColor: _themeController.isDarkMode
                            ? ColorData.color_0xff9184a6
                            : ColorData.color_0xff1d192c,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomSocialButton(
                          icon: AssetData.googlePng,
                          height: 18,
                          width: 18,
                          onPress: () {},
                        ),
                        CustomSocialButton(
                          icon: AssetData.facebookPng,
                          width: 18,
                          height: 18,
                          onPress: () {},
                        ),
                        CustomSocialButton(
                          icon: AssetData.twitterPng,
                          width: 21,
                          height: 18,
                          onPress: () {},
                        )
                      ],
                    ),
                    SizedBox(height: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account ? ",
                          style: FontStyleData.h13(
                            fontColor: ColorData.color_0xffa79dbf,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.off(SignupScreen());
                          },
                          child: Text(
                            "Sign up",
                            style: FontStyleData.h13(
                              fontColor: ColorData.color_0xfff42f78,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: screenSize.width / 2,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "By Signing you indicate that you have read and agreed to the Patch ",
                              style: FontStyleData.h9(
                                  fontColor: _themeController.isDarkMode
                                      ? ColorData.color_0xff727cbe
                                      : ColorData.color_0xffa79dbf),
                            ),
                            TextSpan(
                              text: "Temrs Or Service",
                              style: FontStyleData.h9(
                                  fontColor: ColorData.color_0xfff42f78),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  void loginFunction() {
    prefs.write("isRadioStationAppLogin", true);
    Get.offAll(StartupGuideScreen());
  }
}
