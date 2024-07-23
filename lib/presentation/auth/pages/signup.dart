import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: _signinText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
    body:  Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 50
      ),
      child: Column(
        children: [
            _registerText(),
          const SizedBox(height: 50,),
          _fullNameField(context),
          const SizedBox(height: 20,),
          _emailField(context),
           const SizedBox(height: 20,),
          _passwordField(context),
          const SizedBox(height: 20,),
          BasicAppButton(
            onPressed: () {  },
            title: 'Create Account',

          )
        ],
      ),
    ),
    );

  }

  Widget _registerText(){
    return const Text(
      "Register",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25
      ),
      textAlign: TextAlign.center,
    );
  }
}
  Widget _fullNameField(BuildContext context){
   return TextField(
     decoration: const InputDecoration(
       hintText: "Full Name"
     ).applyDefaults(
       Theme.of(context).inputDecorationTheme
     ),
   );
  }

Widget _emailField(BuildContext context){
  return TextField(
    decoration: const InputDecoration(
        hintText: "Enter Email"
    ).applyDefaults(
        Theme.of(context).inputDecorationTheme
    ),
  );
}

Widget _passwordField(BuildContext context){
  return TextField(
    decoration: const InputDecoration(
        hintText: "Enter Password"
    ).applyDefaults(
        Theme.of(context).inputDecorationTheme
    ),
  );
}

Widget _signinText(BuildContext context){
  return  Padding(
    padding:  const EdgeInsets.symmetric(
      vertical: 30
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Do You Have An Account?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14
          ),
        ),
        TextButton(
            onPressed:(){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const SignInPage()
                  )
              );
            },
            child: const Text(
              "Sign In"
            )
        )
      ],
    ),
  );
}