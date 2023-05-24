import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maskarad_online_shop/constants/constants.dart';
import 'package:maskarad_online_shop/constants/routes.dart';
import 'package:maskarad_online_shop/firebase_helper/firebase_auth_helper.dart/firebase_auth_helper.dart';
import 'package:maskarad_online_shop/screens/home/home.dart';
import 'package:maskarad_online_shop/widgets/primary_button.dart';
import 'package:maskarad_online_shop/widgets/top_titles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitles(
                title: "Kirish", subtitle: "Kiring va buyurtma bering"),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined), hintText: "Email"),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _passController,
              obscureText: isShowPassword,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                      icon: Icon(!isShowPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined)),
                  prefixIcon: const Icon(Icons.password_sharp),
                  hintText: "Parol"),
            ),
            const SizedBox(
              height: 40,
            ),
            PrimaryButton(
              title: "Kirish",
              onPressed: () async {
                bool isValid = loginValidation(
                    _emailController.text, _passController.text);
                if (isValid) {
                  bool isLogin = await FirebaseAuthHelper.instance.login(
                      _emailController.text, _passController.text, context);
                  if (isLogin) {
                    // ignore: use_build_context_synchronously
                    Routes.instanse.pushAndRemoveUtil(const Home(), context);
                  }
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const Center(
              child: Text(
                "Ro'yxatdan o'tmaganmisiz?",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Center(
                child: CupertinoButton(
                    child: Text(
                      "Ro'yxatdan o'tish",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {}))
          ],
        ),
      ),
    );
  }
}
