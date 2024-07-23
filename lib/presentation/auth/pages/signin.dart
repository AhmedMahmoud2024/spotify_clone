import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: _signupText(context),
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

            _emailField(context),
            const SizedBox(height: 20,),
            _passwordField(context),
            const SizedBox(height: 20,),
            BasicAppButton(
              onPressed: () {

              },
              title: 'Sign In',

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

Widget _signupText(BuildContext context){
  return  Padding(
    padding:  const EdgeInsets.symmetric(
        vertical: 30
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Not a Member?",
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
                      builder: (BuildContext context) => const SignUp()
                  )
              );
            },
            child: const Text(
                "Register Now"
            )
        )
      ],
    ),
  );
}