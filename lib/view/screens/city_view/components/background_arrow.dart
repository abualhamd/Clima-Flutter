import 'package:clima/core/utils/assets_manager.dart';
import 'package:clima/core/utils/extensions/media_query_extension.dart';
import 'package:clima/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class BackgroundArrow extends StatelessWidget {
  const BackgroundArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    return Align(
      alignment: Alignment.topLeft,
      child: TextButton(
        onPressed: () {
          Navigator.pop(
            context,
          );
        },
        child: Icon(
          IconsManager.arrowBack,
          size: width * ValuesManger.s0_1,
        ),
      ),
    );
  }
}
