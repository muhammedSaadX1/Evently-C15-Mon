import 'package:evently_c15_mon/core/assets_manager.dart';
import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:evently_c15_mon/core/routes_manager.dart';
import 'package:evently_c15_mon/core/widgets/custom_elevated_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations.register)),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(ImageAssets.eventlyLogo, width: 136.w, height: 186.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
          
                children: [
                  SizedBox(height: 24.h),
                  CustomTextFormField(
                    label: appLocalizations.name,
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 16.h,),
                  CustomTextFormField(
                    label:appLocalizations.email,
                    prefixIcon: Icons.mail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16.h,),
                  CustomTextFormField(
                    label: appLocalizations.password,
                    suffixIcon: Icons.visibility_off,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 16.h,),
                  CustomTextFormField(
                    label: appLocalizations.re_password,
                    suffixIcon: Icons.visibility_off,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 16.h,),
                  CustomElevatedButton(title: appLocalizations.create_account),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(appLocalizations.already_have_account, style: Theme.of(context).textTheme.bodySmall,)
               ,CustomTextButton(title: appLocalizations.login, onPressed: () {
                 Navigator.pushReplacementNamed(context, RoutesManger.login);
                    },)
                ],)
                
                ],
              )
          
            ],
          ),
        ),
      ),
    );
  }
}
