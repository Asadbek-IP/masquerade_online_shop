import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maskarad_online_shop/constants/asset_images.dart';
import 'package:maskarad_online_shop/constants/routes.dart';
import 'package:maskarad_online_shop/screens/auth_ui/login/login.dart';
import 'package:maskarad_online_shop/screens/auth_ui/sign_up/sign_up.dart';
import 'package:maskarad_online_shop/widgets/primary_button.dart';
import 'package:maskarad_online_shop/widgets/top_titles.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const TopTitles(
              title: "Xush Kelibsiz!",
              subtitle: "Har hil turdagi Masqarad kiyimlari"),
          const SizedBox(
            height: 30,
          ),
          Center(
              child: Image.asset(
            AssetImages.instance.welcomeImage,
            scale: 4,
          )),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                child: Image.asset(
                  AssetImages.instance.facebookLogo,
                  scale: 5,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                child: Image.asset(
                  AssetImages.instance.googleLogo,
                  scale: 5,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          PrimaryButton(
            title: "Kirish",
            onPressed: () {
              Routes.instanse.push(const Login(), context);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          PrimaryButton(
            title: "Ro'yxatdan o'tish",
            onPressed: () {
              Routes.instanse.push(SignUp(), context);
            },
          ),
          const Spacer(),
          Center(
            child: Text(
              "By Bekchanov Asadbek",
              style: TextStyle(color: Colors.grey.shade400),
            ),
          )
        ]),
      ),
    );
  }
}
