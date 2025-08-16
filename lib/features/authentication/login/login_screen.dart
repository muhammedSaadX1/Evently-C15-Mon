import 'package:evently_c15_mon/core/assets_manager.dart';
import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:evently_c15_mon/core/routes_manager.dart';
import 'package:evently_c15_mon/core/utils/dialog_utils.dart';
import 'package:evently_c15_mon/core/utils/validate_email.dart';
import 'package:evently_c15_mon/core/widgets/custom_elevated_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_form_field.dart';
import 'package:evently_c15_mon/firebase_service/firebase_service.dart';
import 'package:evently_c15_mon/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Image.asset(ImageAssets.eventlyLogo),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 24.h),
                CustomTextFormField(
                  controller: _emailController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return "Plz, enter email";
                    }
                    if (!isValidEmail(input)) {
                      return "Email Bad Format";
                    }
                    return null;
                  },

                  label: appLocalizations.email,
                  prefixIcon: Icons.email,
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  controller: _passwordController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return "Plz, enter password";
                    }
                    if (input.length < 6) {
                      return "Sorry, password should be at least 6 chars";
                      ;
                    }
                    return null;
                  },
                  label: appLocalizations.password,
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility_off,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: CustomTextButton(
                    title: appLocalizations.forget_password,
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 8.h),
                CustomElevatedButton(
                  title: appLocalizations.login,
                  onPress: _signIn,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      appLocalizations.dont_have_account,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    CustomTextButton(
                      title: appLocalizations.create_account,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesManger.register,
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
    );
  }

  void _signIn() async{
    try{
      DialogUtils.showLoading(context);
    await   FirebaseService.login(
        email: _emailController.text,
        password: _passwordController.text,
      );
    DialogUtils.hideDialog(context);
    DialogUtils.showMessage(context, message: "Logged-in Successfully");
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, RoutesManger.mainLayout);
    }on FirebaseAuthException catch(e){
    DialogUtils.hideDialog(context);
    DialogUtils.showMessage(context, message: "Wrong email or password");
    }catch(e){
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context, message: e.toString());

    }
  }
}
