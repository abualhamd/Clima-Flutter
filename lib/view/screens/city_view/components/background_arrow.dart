import 'package:clima/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class BackgroundArrow extends StatelessWidget {
  const BackgroundArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: TextButton(
        onPressed: () {
          Navigator.pop(
            context,
          );
        },
        child: const Icon(
          IconsManager.arrowBack,
          size: 50.0,
        ),
      ),
    );
  }
}

