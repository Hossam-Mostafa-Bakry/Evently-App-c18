import 'package:evently_app/core/config/theme/app_colors.dart';
import 'package:evently_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CustomLeadingBar extends StatelessWidget {
  const CustomLeadingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.strokeBorder),
        ),
        child: Assets.icons.arrowLeftIcn.svg(),
      ),
    );
  }
}
