

import 'package:flutter/material.dart';

extension KeyExtension on Key? {
  String get value {
    return this?.toString().replaceAll("[<'", "").replaceAll("'>]", "") ?? '';
  }
}