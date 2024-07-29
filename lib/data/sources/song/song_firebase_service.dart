import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/song/song.dart';
import 'package:spotify/domain/entities/song/song.dart';

  abstract class SongFirebaseService{
   Future<Either> getSongsNews() ;
   Future<Either> getPlayList() ;
   Future<Either> addOrRemoveFavorateSong(String songId) ;
   Future<bool> isFavoriteSong(String songId) ;
   }
  class SongFirebaseServiceImpl extends SongFirebaseService{
    @override
  Future<Either> getSongsNews() async {
   try{
    List<SongEntity> songs = [];
    var data = await FirebaseFirestore.instance.collection('Songs')
        .orderBy('releaseDate', descending: true)
        .limit(3)
        .get();
    for (var element in data.docs) {
      var songModel = SongModel.fromJson(element.data());
      songs.add(
          songModel.toEntity()
      );

    }
       return Right(songs) ;
  } catch(e){
      return const Left("An Error Occoured, Please Try Again");
   }
  }

  @override
  Future<Either> getPlayList() async{
    try{
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance.collection('Songs')
          .orderBy('releaseDate', descending: true)
          .get();
      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(
            songModel.toEntity()
        );

      }
      return Right(songs) ;
    } catch(e){
      return const Left("An Error Occoured, Please Try Again");
    }
  }

  @override
  Future<Either> addOrRemoveFavorateSong(String songId) async {
    try{
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      late bool isFavorate ;
      var user = await firebaseAuth.currentUser;
      String uId = user!.uid;
      QuerySnapshot favorateSong = await firebaseFirestore.collection('Users')
          .doc(uId)
          .collection('Favorates')
          .where(
          'songId', isEqualTo: songId
      ).get();
      if (favorateSong.docs.isNotEmpty) {
        await favorateSong.docs.first.reference.delete();
        isFavorate =false ;
      } else {
        await firebaseFirestore
            .collection('Users')
            .doc(uId)
            .collection('Favorites')
            .add(
            {
              'songId': songId,
              'addedDate': Timestamp.now()
            }
        );
        isFavorate =true ;

      }
      return Right(isFavorate) ;
    }catch(e){
      return const Left("An Error Occured") ;
    }
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {

    try{
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      var user = await firebaseAuth.currentUser;
      String uId = user!.uid;
      QuerySnapshot favorateSong = await firebaseFirestore.collection('Users')
          .doc(uId)
          .collection('Favorates')
          .where(
          'songId', isEqualTo: songId
      ).get();
      if (favorateSong.docs.isNotEmpty) {
      return true ;
      } else {
     return false ;
      }

    }catch(e){
      return false ;
    }
  }

}