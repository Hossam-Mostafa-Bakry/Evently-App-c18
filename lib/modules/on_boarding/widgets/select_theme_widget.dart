import 'package:evently_app/core/config/theme/app_colors.dart';
import 'package:evently_app/core/gen/assets.gen.dart';
import 'package:evently_app/core/utils/provider/app_settings_controller.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectThemeWidget extends StatelessWidget {
  const SelectThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<AppSettingsController>(
      builder: (context, provider, _) {
        return Row(
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.theme,
                style: theme.textTheme.titleMedium,
              ),
            ),
            GestureDetector(
              onTap: () {
                provider.setCurrentTheme(ThemeMode.light);
              },
              child: Container(
                width: 80,
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: provider.isDark()
                      ? AppColors.unSelectedItem
                      : AppColors.primary,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: provider.isDark()
                        ? AppColors.strokeBorder
                        : Colors.transparent,
                  ),
                ),
                child: Assets.icons.sun.svg(
                  colorFilter: ColorFilter.mode(
                    provider.isDark() ? Colors.white : Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                provider.setCurrentTheme(ThemeMode.dark);
              },
              child: Container(
                width: 80,
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: provider.isDark() ? theme.primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Assets.icons.moon.svg(
                  colorFilter: ColorFilter.mode(
                    provider.isDark() ? Colors.white : theme.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
