import 'package:evently_app/core/config/theme/app_colors.dart';
import 'package:evently_app/core/gen/assets.gen.dart';
import 'package:evently_app/core/utils/provider/app_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextFormFiled extends StatefulWidget {
  final bool isPassword;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextFormFiled({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.controller,
    this.validator,
    this.maxLines,
    this.isPassword = false,
  });

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = Provider.of<AppSettingsController>(context);

    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLines,
      obscureText: widget.isPassword ? isPasswordVisible : false,
      validator: widget.validator,
      decoration: InputDecoration(
        hint: Text(widget.hintText ?? ""),
        hintStyle: theme.textTheme.bodyMedium,
        enabled: true,
        filled: true,
        fillColor: provider.isDark() ? AppColors.unSelectedItem : Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
            color: provider.isDark()
                ? AppColors.strokeDarkBorder
                : AppColors.strokeBorder,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
            color: provider.isDark()
                ? AppColors.strokeDarkBorder
                : AppColors.strokeBorder,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
            color: provider.isDark()
                ? AppColors.strokeDarkBorder
                : AppColors.strokeBorder,
            width: 1.0,
          ),
        ),
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: widget.prefixIcon,
              )
            : null,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                child: Icon(
                  isPasswordVisible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.secText,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(12.0),
                child: widget.suffixIcon,
              ),
      ),
    );
  }
}
