import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bogdashka/constants.dart';
import 'package:bogdashka/controllers/auth_controller.dart';
import 'package:bogdashka/enums.dart';
import 'package:websafe_svg/websafe_svg.dart';

class LoginScreen extends StatelessWidget {
  static String path = '/login';
  // final AuthController auth = Get.put(AuthController.instance());
  @override
  Widget build(BuildContext context) {
    final authInput = {'email': '', 'password': ''};
// test1@test.com
// test123123
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.05),
          WebsafeSvg.asset("assets/icons/logo.svg", height: 400),
          SizedBox(height: Get.height * 0.05),
          Container(
            child: Center(
              child: GetBuilder<AuthController>(
                init: AuthController.instance(),
                builder: (auth) => auth.appState == AppState.initial
                    ? CircularProgressIndicator()
                    : Container(
                        width: 400,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Enter your email',
                              ),
                              onChanged: (e) => {authInput['email'] = e},
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Enter your password',
                              ),
                              onChanged: (e) => {authInput['password'] = e},
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await AuthController.fireStoreLogin(
                                      authInput['email'],
                                      authInput['password']);
                                },
                                child: Text('Submit'),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//  FlatButton(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: kDefaultPadding,
//                             vertical: kDefaultPadding),
//                         minWidth: Get.width * 0.1,
//                         color: kBlueColor,
//                         onPressed: () => auth.microsoftLogin(),
//                         child: auth.appState == AppState.authenticating
//                             ? CircularProgressIndicator()
//                             : Text(
//                                 "Login",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .subtitle1
//                                     .copyWith(color: Colors.white),
//                               ),
//                       ),