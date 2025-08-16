import 'dart:io';

import 'package:evently_c15_mon/core/assets_manager.dart';
import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:evently_c15_mon/core/contant_manager.dart';
import 'package:evently_c15_mon/core/routes_manager.dart';
import 'package:evently_c15_mon/core/utils/dialog_utils.dart';
import 'package:evently_c15_mon/core/utils/validate_email.dart';
import 'package:evently_c15_mon/core/widgets/custom_elevated_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_form_field.dart';
import 'package:evently_c15_mon/firebase_service/firebase_service.dart';
import 'package:evently_c15_mon/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evently_c15_mon/l10n/app_localizations.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _nameController;

  late TextEditingController _emailController;

  late TextEditingController _passwordController;

  late TextEditingController _rePasswordController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations.register)),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  ImageAssets.eventlyLogo,
                  width: 136.w,
                  height: 186.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    SizedBox(height: 24.h),
                    CustomTextFormField(
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return "Plz, enter ur name";
                        }

                        return null;
                      },
                      controller: _nameController,
                      label: appLocalizations.name,
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return "Plz, enter ur email";
                        }
                        if (!isValidEmail(input)) {
                          return "Email Bad Format";
                        }
                        return null;
                      },
                      controller: _emailController,
                      label: appLocalizations.email,
                      prefixIcon: Icons.mail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return "Plz, enter password";
                        }
                        if (input.length < 6) {
                          return "Password should be at least 6 chars";
                        }
                        return null;
                      },
                      controller: _passwordController,
                      label: appLocalizations.password,
                      suffixIcon: Icons.visibility_off,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return "Plz, confirm password";
                        }
                        if (input != _passwordController.text) {
                          return "Password doesn't match";
                        }
                        return null;
                      },
                      controller: _rePasswordController,
                      label: appLocalizations.re_password,
                      suffixIcon: Icons.visibility_off,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 16.h),
                    CustomElevatedButton(
                      title: appLocalizations.create_account,
                      onPress: _createAccount,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          appLocalizations.already_have_account,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        CustomTextButton(
                          title: appLocalizations.login,
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              RoutesManger.login,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _createAccount() async {
    if (formKey.currentState?.validate() == false) return;
    try {
      DialogUtils.showLoading(context);
      await FirebaseService.register(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text
      );
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(
        context,
        message: "User registered successfully.",
      );
  await   Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, RoutesManger.login);
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideDialog(context);
      if (e.code == FirebaseConstant.weakPassword) {
        DialogUtils.showMessage(context, message: FirebaseConstant.weakPasswordMessage);
      } else if (e.code == FirebaseConstant.emailInUse) {
        DialogUtils.showMessage(context, message: FirebaseConstant.emailInUseMessage);

      }
    } catch (e) {
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context, message: e.toString());
    }

    /// register user
  }
}
