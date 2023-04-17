import 'package:clima/core/utils/app_strings.dart';
import 'package:clima/core/utils/extensions/media_query_extension.dart';
import 'package:clima/core/utils/values_manager.dart';
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
    final width = context.width;
    return Container(
      padding: EdgeInsets.all(width * ValuesManger.s0_05),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: ColorsManager.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorsManager.white,
          hintText: AppStrings.enterAcity,
          hintStyle: const TextStyle(
            color: ColorsManager.grey,
          ),
          icon: const Icon(
            IconsManager.cityIcon,
            color: ColorsManager.white,
          ),
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(width * ValuesManger.s0_02)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
