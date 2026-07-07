import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle heading = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.lightText,
  );

  static const TextStyle title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.lightText,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.lightText,
  );

  static const TextStyle expression = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle result = TextStyle(
    fontSize: 52,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle button = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}