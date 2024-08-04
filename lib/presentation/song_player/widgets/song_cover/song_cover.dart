
import 'package:flutter/cupertino.dart';

import '../../../../core/configs/constants/app_urls.dart';
import '../../../../domain/entities/song/song.dart';
class SongCoverWidget extends StatelessWidget {
  final SongEntity songEntity;

  const SongCoverWidget({
    super.key, required this.songEntity
  });

  @override
  Widget build(BuildContext context) {
   return songCover(context);
   }

  Widget songCover(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  '${AppURLs.coverFirestorage}${songEntity
                      .artist} - ${songEntity.title}.jpg?${AppURLs.mediaAlt}'
              )
          )
      ),
    );
  }
}