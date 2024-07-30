import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';

import '../../../service_locator.dart';
import '../../repository/song/song.dart';

class AddOrRemoveFavorateSongUseCase implements UseCase<Either,String> {
  @override
  Future<Either> call({ String ? params}) async{
    return await sl<SongsRepository>().addOrRemoveFavoriteSong(params!);
  }
}