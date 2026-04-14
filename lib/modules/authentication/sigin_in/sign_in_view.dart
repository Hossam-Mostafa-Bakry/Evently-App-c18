import 'dart:developer';

import 'package:evently_app/core/config/routes/pages_route_name.dart';
import 'package:evently_app/core/config/theme/app_colors.dart';
import 'package:evently_app/core/gen/assets.gen.dart';
import 'package:evently_app/core/services/snackbar_service.dart';
import 'package:evently_app/core/utils/firebase_utils/firebase_auth.dart';
import 'package:evently_app/core/utils/provider/app_settings_controller.dart';
import 'package:evently_app/core/widgets/custom_button_widget.dart';
import 'package:evently_app/core/widgets/custom_text_form_filed.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController(
    text: "hossam@gamil.com",
  );
  final TextEditingController _passwordController = TextEditingController(
    text: "Asdf12345",
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    final provider = Provider.of<AppSettingsController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Assets.images.eventlyLogoImg.image(
          width: 142,
          color: theme.primaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                local.login_to_your_account,
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(height: 24),
              CustomTextFormFiled(
                controller: _emailController,
                hintText: local.enter_your_email,
                prefixIcon: Assets.icons.smsIcn.svg(),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "plz enter your email";
                  }

                  final regex = RegExp(
                    r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
                  );
                  if (!regex.hasMatch(value)) {
                    return 'Enter valid email';
                  }

                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormFiled(
                controller: _passwordController,
                isPassword: true,
                hintText: local.enter_your_password,
                prefixIcon: Assets.icons.lockIcn.svg(),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "plz enter your password";
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              GestureDetector(
                child: Text(
                  local.forget_password,
                  textAlign: TextAlign.end,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    decorationColor: theme.primaryColor,
                    decorationThickness: 2,
                  ),
                ),
              ),
              SizedBox(height: 48),
              CustomButtonWidget(
                buttonTitle: local.login,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    EasyLoading.show();
                    FirebaseAuthUtils.signInWithEmailAndPassword(
                      _emailController.text,
                      _passwordController.text,
                    ).then((value) {
                      if (value) {
                        EasyLoading.dismiss();
                        SnackBarService.showSuccessMessage(
                          "Login successfully",
                        );
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          PagesRouteName.home,
                          (route) => false,
                        );
                      }
                    });
                  }
                },
              ),
              SizedBox(height: 48),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: local.dont_have_an_account,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    WidgetSpan(child: SizedBox(width: 2)),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed(PagesRouteName.signUp);
                        },
                        child: Text(
                          local.signup,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: theme.primaryColor,
                            decorationThickness: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: AppColors.strokeBorder,
                      endIndent: 20,
                    ),
                  ),
                  Text(
                    "OR",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: AppColors.strokeBorder,
                      indent: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: AppColors.strokeBorder, width: 1.0),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.googleImg.image(width: 24, height: 24),
                    SizedBox(width: 10),
                    Text(
                      local.login_with_google,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
