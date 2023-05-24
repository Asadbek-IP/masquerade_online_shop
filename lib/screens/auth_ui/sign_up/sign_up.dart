import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maskarad_online_shop/constants/constants.dart';
import 'package:maskarad_online_shop/constants/routes.dart';
import 'package:maskarad_online_shop/screens/auth_ui/login/login.dart';
import 'package:maskarad_online_shop/widgets/primary_button.dart';

import '../../../firebase_helper/firebase_auth_helper.dart/firebase_auth_helper.dart';
import '../../../widgets/top_titles.dart';
import '../../home/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isShowPassword = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitles(
                  title: "Ro'yxatdan o'tish",
                  subtitle: "Ro'yxatdan o'ting va buyurtma bering"),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_3_outlined), hintText: "Ism"),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined), hintText: "Email"),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone_outlined), hintText: "Phone"),
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
                title: "Ro'yxatdan o'tish",
                onPressed: () async {
                  bool isValid = sigUpValidation(
                      _emailController.text,
                      _passController.text,
                      _nameController.text,
                      _phoneController.text);
                  if (isValid) {
                    bool isLogin = await FirebaseAuthHelper.instance.sigUp(
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
                  "Ro'yxatdan o'tganmisiz?",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Center(
                  child: CupertinoButton(
                      child: Text(
                        "Kirish",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {
                        Routes.instanse.push(Login(), context);
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
