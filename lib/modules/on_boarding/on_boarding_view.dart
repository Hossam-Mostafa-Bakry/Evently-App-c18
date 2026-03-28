import 'package:evently_app/core/config/theme/app_colors.dart';
import 'package:evently_app/core/gen/assets.gen.dart';
import 'package:evently_app/core/utils/provider/app_settings_controller.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/modules/on_boarding/widgets/select_language_widget.dart';
import 'package:evently_app/modules/on_boarding/widgets/select_theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = Provider.of<AppSettingsController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Assets.images.eventlyLogoImg.image(
          width: 140,
          color: theme.primaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Assets.images.onBoardingConfigImg.image(
              color: provider.isDark() ? Colors.white : theme.primaryColor,
            ),
            SizedBox(height: 24),
            Text(
              "Personalize Your Experience",
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(height: 8),
            Text(
              "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
              style: theme.textTheme.bodyLarge,
            ),
            SizedBox(height: 16),
            SelectLanguageWidget(),
            SizedBox(height: 16),
            SelectThemeWidget(),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16),
                ),
              ),
              child: Text(
                AppLocalizations.of(context)!.lets_start,
                style: theme.textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
