import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String? buttonTitle;
  final void Function()? onPressed;

  const CustomButtonWidget({
    super.key,
    this.buttonTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: theme.primaryColor,
        padding: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: onPressed,
      child: Text(
        buttonTitle ?? '',
        style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
      ),
    );
  }
}
