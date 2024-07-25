import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService{
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);
}
class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<Either> signin(SigninUserReq SigninUserReq) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: SigninUserReq.email,
          password: SigninUserReq.password
      );
      return const Right("Signin Was Successful");
    } on FirebaseAuthException catch(e){
      String message = "";
      if(e.code == "invalid_email"){
        message = "Not User found for this email" ;
      }else if(e.code == "invalid_credential"){
        "Wrong Password provided for this user." ;
      }
      return Left(message);
    }
  }

  @override
  Future<Either>signup(CreateUserReq createUserReq) async {
   try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email,
          password: createUserReq.password
      );
      return const Right("SignUp Was Successful");
   } on FirebaseAuthException catch(e){
    String message = "";
    if(e.code == "weak_password"){
      message = "The Password provided is too weak" ;
    }else if(e.code == "email_already_in_use"){
     "An Account already exists with the email." ;
    }
    return Left(message);
   }
  }

}