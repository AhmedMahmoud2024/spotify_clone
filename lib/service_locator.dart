import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify/data/repository/song/song_repository_imp.dart';
import 'package:spotify/data/sources/auth/auth_firebase_services.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/domain/usecases/song/add_or_remove_favorate_song.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';
import 'package:spotify/domain/usecases/song/get_play_list.dart';

import 'data/sources/song/song_firebase_service.dart';
import 'domain/repository/song/song.dart';
import 'domain/usecases/song/is_favorate_song.dart';

final sl=GetIt.instance;

 Future<void> initializeDependencies() async{

   sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );
   sl.registerSingleton<SongFirebaseService>(
       SongFirebaseServiceImpl()
   );

   sl.registerSingleton<AuthRepository>(
       AuthRepositoryImpl()
   );
   sl.registerSingleton<SongsRepository>(
       SongRepositoryImp()
   );
   sl.registerSingleton<SignupUseCase>(
       SignupUseCase()
   );

   sl.registerSingleton<SigninUseCase>(
       SigninUseCase()
   );
   sl.registerSingleton<GetNewsSongsUseCase>(
       GetNewsSongsUseCase()
   );
   sl.registerSingleton<GetPlayListUseCase>(
       GetPlayListUseCase()
   );
   sl.registerSingleton<AddOrRemoveFavorateSongUseCase>(
       AddOrRemoveFavorateSongUseCase()
   );
   sl.registerSingleton<IsFavorateSongUseCase>(
       IsFavorateSongUseCase()
   );
 }