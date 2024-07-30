import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/data/models/auth/user.dart';

import '../../../core/configs/constants/app_urls.dart';
import '../../../domain/entities/auth/user.dart';

abstract class AuthFirebaseService{
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);
  Future<Either> getUser() ;
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
    var data=  await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email,
          password: createUserReq.password
      );
      FirebaseFirestore.instance.collection('Users').doc(data.user?.uid).
      set(
          { 'name': createUserReq.fullName,
            'email': data.user?.email
          }
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

  @override
  Future < Either > getUser() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = await firebaseFirestore.collection('Users').doc(
          firebaseAuth.currentUser?.uid
      ).get();

      UserModel userModel = UserModel.fromJson(user.data() !);
      userModel.imageUrl = firebaseAuth.currentUser?.photoURL ?? AppURLs.defaultImage;
      UserEntity userEntity = userModel.toEntity();
      return Right(userEntity);
    } catch (e) {
      return const Left('An error occurred');
    }
  }

}