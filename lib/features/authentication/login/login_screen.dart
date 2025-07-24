import 'package:evently_c15_mon/core/assets_manager.dart';
import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:evently_c15_mon/core/routes_manager.dart';
import 'package:evently_c15_mon/core/widgets/custom_elevated_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Padding(
        padding:  REdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Image.asset(ImageAssets.eventlyLogo),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                SizedBox(height: 24.h,),
                CustomTextFormField(label: appLocalizations.email
                  , prefixIcon: Icons.email,),
                SizedBox(height: 16.h,),
                CustomTextFormField(label: appLocalizations.password,
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility_off,),
                Container(
                    alignment: Alignment.centerRight,
                    child: CustomTextButton(title: appLocalizations.forget_password, onPressed: (){},)),
                SizedBox(height: 8.h,),
                CustomElevatedButton(title:appLocalizations.login),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(appLocalizations.dont_have_account, style:Theme.of(context).textTheme.bodySmall,)
                    ,CustomTextButton(title: appLocalizations.create_account,onPressed: () {
                      Navigator.pushReplacementNamed(context, RoutesManger.register);
                    }, )
                  ],)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
