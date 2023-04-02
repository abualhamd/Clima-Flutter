import 'package:clima/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/colors_manager.dart';

class CityTextField extends StatelessWidget {
  const CityTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: ColorsManager.black,
        ),
        decoration: const InputDecoration(
          filled: true,
          fillColor: ColorsManager.white,
          hintText: AppStrings.enterAcity,
          hintStyle: TextStyle(
            color: ColorsManager.grey,
          ),
          icon: Icon(
            IconsManager.cityIcon,
            color: ColorsManager.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
