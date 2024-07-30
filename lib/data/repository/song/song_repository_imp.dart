

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/sources/auth/auth_firebase_services.dart';
import 'package:spotify/domain/repository/song/song.dart';

import '../../../service_locator.dart';
import '../../sources/song/song_firebase_service.dart';

class SongRepositoryImp extends SongsRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getSongsNews();
  }

  @override
  Future<Either> getPlayList() async {
    return await sl<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFavoriteSong(String songId) async {
    return await sl<SongFirebaseService>().addOrRemoveFavorateSong(songId);
}

  @override
  Future<bool> isFavoriteSong(String songId) async {
    return await sl<SongFirebaseService>().isFavoriteSong(songId);
  }

}