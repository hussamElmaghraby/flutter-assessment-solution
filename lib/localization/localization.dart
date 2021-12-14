import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        //ENGLISH LANGUAGE
        'en_US': {
          'message': 'Delivery',
          'title': 'Assessment',
          'login': 'login',
          'signup': 'sign up',
          'email': 'Enter Email Address',
          'password': 'Enter Password',
          'forgetpass': 'Forget Password',
          'logo': 'logo_en',
          'profile': 'Profile',
          'changelang': 'EN'
        },
        //HINDI LANGUAGE
        'ar_Ar': {
          'message': 'دليفري',
          'title': 'تقييم',
          'login': 'دخول',
          'signup': ' التسجيل',
          'profile': 'البروفايل',
          'logo': 'logo_ar',
          'email': 'آدخل عنوان البريد',
          'password': 'آدخل كلمه المرور',
          'forgetpass': 'نسيت كلمة السر',
          'changelang': 'AR'
        },
      };
}
