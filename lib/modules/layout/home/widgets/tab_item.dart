import 'package:evently_app/core/config/theme/app_colors.dart';
import 'package:evently_app/models/category_data.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final CategoryData data;
  final bool isSelected;

  const TabItem({super.key, required this.data, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.strokeBorder),
      ),
      child: Row(
        spacing: 4,
        children: [
          Icon(data.icon, color: isSelected ? Colors.white : AppColors.primary),
          Text(
            data.name,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : AppColors.mainText,
            ),
          ),
        ],
      ),
    );
  }
}
