import 'package:evently_c15_mon/core/assets_manager.dart';
import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:evently_c15_mon/core/widgets/custom_elevated_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
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
                    label: "Name",
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 16.h,),
                  CustomTextFormField(
                    label: "E-mail",
                    prefixIcon: Icons.mail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16.h,),
                  CustomTextFormField(
                    label: "Password",
                    suffixIcon: Icons.visibility_off,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 16.h,),
                  CustomTextFormField(
                    label: "Password",
                    suffixIcon: Icons.visibility_off,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 16.h,),
                  CustomElevatedButton(title: "Create Account"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Already Have Account?", style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500, color: ColorsManager.black),)
               ,CustomTextButton(title: "Login")
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
