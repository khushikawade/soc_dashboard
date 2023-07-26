// import 'package:fluttertoast/fluttertoast.dart';

class Validator {
// bool? Function(String?)? usernameValidator = (String? username) {
  static bool emailValidation(String value) {
    final validEmail =
        RegExp(r'\S+@\S+\.\S+'); //RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$");
    return validEmail.hasMatch(value);
  }

//password validator possible structure
  static String? passwordValidator(dynamic password) {
    // String? Function(String?)? passwordValidator = (String? password) {
    if (password.isEmpty) {
      // Fluttertoast.showToast(msg: "Password can't be empty");
      return "Password can't be empty";
    } else if (password.length < 6) {
      // Fluttertoast.showToast(msg: "Please enter valid password");
      return "Please enter valid password";
    }
    return null;
  }

  // String? Function(String?)?
  static bool emailValidator(String? email) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (email!.isEmpty) {
      //Fluttertoast.showToast(msg: "Please enter valid email");

      return false;
    } else if (!regex.hasMatch(email)) {
      // Fluttertoast.showToast(msg: "Please enter valid email");
      return false;
    } else
      return true;
  }

  static String? emailValidate(dynamic value) {
    if (value.isNotEmpty) {
      if (Validator.emailValidation(value.trim())) {
        return null;
      } else {
        return "Please enter valid email";
      }
    } else {
      return "This field can't be empty";
    }
  }

  static String? fullNameValidate(String fullName) {
    String patttern = '[a-zA-Z]';
    RegExp regExp = new RegExp(patttern);
    if (fullName.length == 0) {
      return "This field can't be empty";
    } else if (!regExp.hasMatch(fullName)) {
      return null;
    }
    return "Please enter full name";
  }

  static String? validMobile(String value) {
    // final mobileRegExp = RegExp(r'^[6-9][0-9]{9}$');
    final mobileRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    // if (value.isNotEmpty && mobileRegExp.hasMatch(value)) {
    //   return null;
    // }
    if (!mobileRegExp.hasMatch(value)) {
      return "Please enter valid phone number";
    } else if (value.isEmpty || value == null) {
      //AppUtil.showToast(Constants.enterMobileNumber);
      return "This field can't be empty";
    } else if (value.length < 10) {
      return "Phone number can't be less than 10 digit";
    } else {
      return null;
    }
  }

  static String? fieldCheckboxEmpty(String value) {
    // Text('Field can not be emptyoooo');
    String message = "Field can't be empty";
    //  String message =  Text('Field can not be emptyoooo',
    //       style:
    //           const TextStyle(fontSize: 50, backgroundColor: Color(0xff858D93)));
    if (value.isNotEmpty) {
      return null;
    } else {
      return message;
    }
  }

  static String? nameValidate(dynamic value) {
    if (value.isNotEmpty) {
      return null;
    } else {
      return "Please enter name";
    }
  }

  static String? fieldEmpty(String? value) {
    if (value!.isNotEmpty) {
      return null;
    } else {
      return "This field can't be empty";
    }
  }

  static String? emailValidateNew(String? value) {
    final RegExp validEmail = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$');

    if (value!.isNotEmpty && validEmail.hasMatch(value)) {
      return null;
    }
    if (value.isEmpty) {
      return 'Please enter email';
    } else {
      return 'Please enter valid emial';
    }
  }
}
