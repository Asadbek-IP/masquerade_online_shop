import 'package:flutter/material.dart';

class AssetImages {
  static AssetImages instance = AssetImages();

  static const String _imagePath = "assets/images";
  final String welcomeImage = "$_imagePath/welcome.png";
  final String facebookLogo = "$_imagePath/facebook.png";
  final String googleLogo = "$_imagePath/google.png";
}
