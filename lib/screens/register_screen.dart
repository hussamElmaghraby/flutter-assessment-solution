import 'package:assessment/services/auth_service.dart';
import 'package:assessment/validation/validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  static const routeName = '/register';
  final _form = GlobalKey<FormState>();

  Future<void> _saveForm(BuildContext context) async {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);
    final validation = Provider.of<Validation>(context, listen: false);
    try {
      await authService.createUserWithEmailAndPassword(
          emailController.text, passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      validation.getMessageFromErrorCode(context, e);
    } catch (e) {
      validation.getMessageFromErrorCode(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("register"),
        backgroundColor: const Color.fromRGBO(51, 36, 99, 1),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(51, 36, 99, 1),
          ),
          child: Form(
            key: _form,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
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
                    //   validator: (value) =>
                    //       Validation.validateEmail(value!, Constants.EMAIL_ERROR),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        _saveForm(context);
                      },
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 20),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                        ),
                      ),
                      child: Text('signup'.tr)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
