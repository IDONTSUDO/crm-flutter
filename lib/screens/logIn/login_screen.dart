import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jetti/constants.dart';
import 'package:jetti/controllers/auth_controller.dart';
import 'package:jetti/enums.dart';
import 'package:websafe_svg/websafe_svg.dart';

class LoginScreen extends StatelessWidget {
  // final AuthController auth = Get.put(AuthController.instance());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.05),
          WebsafeSvg.asset("assets/icons/Jetti CRM logo.svg", height: 100),
          SizedBox(height: Get.height * 0.05),
          Container(
            child: Center(
              child: GetBuilder<AuthController>(
                init: AuthController.instance(),
                builder: (auth) => auth.appState == AppState.initial
                    ? CircularProgressIndicator()
                    : FlatButton(
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                            vertical: kDefaultPadding),
                        minWidth: Get.width * 0.1,
                        color: kBlueColor,
                        onPressed: () => auth.microsoftLogin(),
                        child: auth.appState == AppState.authenticating
                            ? CircularProgressIndicator()
                            : Text(
                                "Login",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(color: Colors.white),
                              ),
                      ),
              ),
            ),
          ),
          Expanded(
            child: WebsafeSvg.asset("assets/icons/bg_login.svg", width: 1389),
          ),
        ],
      ),
    );
  }
}
