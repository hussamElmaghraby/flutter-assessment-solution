import 'dart:typed_data';

import 'package:assessment/Constants/constants.dart';
import 'package:assessment/screens/register_screen.dart';
import 'package:assessment/services/auth_service.dart';
import 'package:assessment/validation/validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final routeName = '/register';
  final _form = GlobalKey<FormState>();
  // final validation = Validation();
  var _isVisible = false;

  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'ARABIC', 'locale': Locale('ar', 'AR')},
  ];
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('Choose Your Language'),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          print(locale[index]['name']);
                          updateLanguage(locale[index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  void _submitLogin(BuildContext context) async {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);
    final validation = Provider.of<Validation>(context, listen: false);
    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } on FirebaseAuthException catch (e) {
      validation.getMessageFromErrorCode(context, e);
    } catch (e) {
      validation.getMessageFromErrorCode(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Color.fromRGBO(51, 36, 99, 1), BlendMode.colorBurn),
                      image: AssetImage('assets/images/background.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    return buildLanguageDialog(context);
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(15)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),
                  icon: const Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  label: Text(
                    'changelang'.tr,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 300,
                margin: const EdgeInsets.all(100),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/' + 'logo'.tr + '.jpeg'),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                alignment: Alignment.lerp(
                    Alignment.bottomCenter, Alignment.center, 0.8),
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    child: Form(
                      key: _form,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              // validator: (value) => Validation.validateEmail(
                              //     value!, Constants.EMAIL_ERROR),
                              decoration: InputDecoration(
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                labelText: 'email'.tr,
                                labelStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                controller: passwordController,
                                keyboardType: TextInputType.emailAddress,
                                obscureText: true,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    // ignore: prefer_const_constructors
                                    icon: Icon(
                                      Icons.visibility_off,
                                      size: 28,
                                    ),
                                    color: Colors.white,
                                    onPressed: () {},
                                  ),
                                  // ignore: prefer_const_constructors
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  labelText: 'password'.tr,
                                  labelStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                textStyle: MaterialStateProperty.all(
                                  TextStyle(fontSize: 20),
                                ),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                ),
                              ),
                              onPressed: () {
                                onPressed:
                                _submitLogin(context);
                              },
                              child: Text('login'.tr),
                            ),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(RegisterScreen.routeName);
                                },
                                style: ButtonStyle(
                                  textStyle: MaterialStateProperty.all(
                                    TextStyle(fontSize: 20),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 30),
                                  ),
                                ),
                                child: Text('signup'.tr),
                              ),
                              Spacer(),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'forgetpass'.tr,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      //   body: Form(
      //     key: _form,
      //     child: Container(
      //       margin: EdgeInsets.only(top: 200),
      //       child: Column(
      //         children: [
      //           TextFormField(
      //             controller: emailController,
      //             keyboardType: TextInputType.emailAddress,
      //             validator: (value) =>
      //                 Validation.validateEmail(value!, Constants.EMAIL_ERROR),
      //             decoration: InputDecoration(
      //                 labelText: 'email'.tr, hintText: "email..."),
      //           ),
      //           TextFormField(
      //             controller: passwordController,
      //             obscureText: true,
      //             decoration: InputDecoration(
      //                 labelText: 'password'.tr, hintText: "password.."),
      //           ),
      //           Row(
      //             children: [
      //               ElevatedButton(
      //                 onPressed: () {
      //                   _submitLogin(context);
      //                 },
      //                 child: Text('login'.tr),
      //               ),
      //               ElevatedButton(
      //                 onPressed: () {
      //                   Navigator.of(context).pushNamed(RegisterScreen.routeName);
      //                 },
      //                 child: Text('signup'.tr),
      //               ),
      //             ],
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
    );
  }
}
