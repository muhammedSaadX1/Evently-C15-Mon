import 'package:evently_c15_mon/core/assets_manager.dart';
import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:evently_c15_mon/core/routes_manager.dart';
import 'package:evently_c15_mon/core/widgets/custom_elevated_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                CustomTextFormField(label: "E-mail", prefixIcon: Icons.email,),
                SizedBox(height: 16.h,),
                CustomTextFormField(label: "Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility_off,),
                Container(
                    alignment: Alignment.centerRight,
                    child: CustomTextButton(title: "Forget Password", onPressed: (){},)),
                SizedBox(height: 8.h,),
                CustomElevatedButton(title: "Login"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have Account?", style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500, color: ColorsManager.black),)
                    ,CustomTextButton(title: "Create Account",onPressed: () {
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
