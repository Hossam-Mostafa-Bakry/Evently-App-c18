import 'dart:developer';

import 'package:evently_app/core/config/theme/app_colors.dart';
import 'package:evently_app/core/utils/provider/app_settings_controller.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectLanguageWidget extends StatelessWidget {
  const SelectLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // var appSettingsController = Provider.of<AppSettingsController>(context);

    return Consumer<AppSettingsController>(
      builder: (context, provider, _) {
        return Row(
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.language,
                style: theme.textTheme.titleMedium,
              ),
            ),
            GestureDetector(
              onTap: () {
                provider.setCurrentLanguage("en");
              },
              child: Container(
                width: 80,
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: provider.currentLanguage == "en"
                      ? theme.primaryColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  "English",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: provider.currentLanguage == "en"
                        ? Colors.white
                        : AppColors.primary,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                provider.setCurrentLanguage("ar");
                log("change language");
              },
              child: Container(
                width: 80,
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: provider.currentLanguage == "ar"
                      ? theme.primaryColor
                      : provider.isDark()
                      ? AppColors.unSelectedItem
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: provider.isDark()
                        ? AppColors.strokeDarkBorder
                        : Colors.transparent,
                  ),
                ),
                child: Text(
                  "Arabic",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color:
                        (provider.currentLanguage != "ar" && !provider.isDark())
                        ? AppColors.primary
                        : Colors.white,
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
