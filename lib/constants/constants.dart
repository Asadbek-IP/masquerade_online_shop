import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color kPrimaryColor = Color(0xFF006ad7);

void showMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.red.withOpacity(0.8),
      textColor: Colors.white,
      fontSize: 16.0);
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Builder(
        builder: (context) => SizedBox(
              width: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 7),
                    child: Text("Kuting..."),
                  )
                ],
              ),
            )),
  );

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => alert,
  );
}

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
      return "Bu email ro'yxatdan o'tgan. Kirish ga o'ting";
    case "account-exists-with-different-credential":
      return "Bu email ro'yxatdan o'tgan. Kirish ga o'ting";
    case "email-already-in-use":
      return "Bu email ro'yxatdan o'tgan. Kirish ga o'ting";
    case "ERROR_WRONG_PASSWORD":
    case "Notog'ri parol":
      return "Wrong Password ";
    case "ERROR_USER_NOT_FOUND":
      return "Bunday foydalanuvchi topilmadi";
    case "user-not-found":
      return "Bunday foydalanuvchi topilmadi";
    case "ERROR_USER_DISABLED":
      return "Bunday foydalanuvchi topilmadi";
    case "user-disabled":
      return "Bunday foydalanuvchi topilmadi";
    case "ERROR_TOO_MANY_REQUESTS":
      return "Ko'p kirishga urinish,keyinroq urinib ko'ring";
    case "operation-not-allowed":
      return "Ko'p kirishga urinish,keyinroq urinib ko'ring";
    case "ERROR_OPERATION_NOT_ALLOWED":
      return "Ko'p kirishga urinish,keyinroq urinib ko'ring";
    case "ERROR_INVALID_EMAIL":
      return "Notog'ri email";
    case "invalid-email":
      return "Notog'ri email";
    default:
      return "Kirishda xatolik, qaytadan urinib ko'ring";
  }
}

bool loginValidation(String email, String password) {
  if (email.isEmpty && password.isEmpty) {
    showMessage("Email va Parolni yozing");
    return false;
  } else if (email.isEmpty) {
    showMessage("Emailni yozing");

    return false;
  } else if (password.isEmpty) {
    showMessage("Parolni yozing");

    return false;
  } else {
    return true;
  }
}

bool sigUpValidation(String email, String password, String name, String phone) {
  if (email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty) {
    showMessage("Barcha joylarni to'liq yozing");
    return false;
  } else if (email.isEmpty) {
    showMessage("Emailni yozing");

    return false;
  } else if (password.isEmpty) {
    showMessage("Parolni yozing");

    return false;
  }
  if (name.isEmpty) {
    showMessage("Ismni yozing");

    return false;
  } else if (phone.isEmpty) {
    showMessage("Nomerni yozing");

    return false;
  } else {
    return true;
  }
}
