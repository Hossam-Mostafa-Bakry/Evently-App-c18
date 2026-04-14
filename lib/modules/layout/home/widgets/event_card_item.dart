import 'package:evently_app/core/config/theme/app_colors.dart';
import 'package:evently_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class EventCardItem extends StatelessWidget {
  const EventCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 190,
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.strokeBorder),
        image: DecorationImage(
          image: Assets.images.sportImg.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFF4F7FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "21 Jan",
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFF4F7FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text(
                  "This is a Birthday Party ",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.mainText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Assets.icons.heartActiveIcn.svg(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
