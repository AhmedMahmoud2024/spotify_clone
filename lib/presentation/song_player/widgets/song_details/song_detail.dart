





import 'package:flutter/cupertino.dart';

import '../../../../common/widgets/favorite_button/favorite_button.dart';
import '../../../../domain/entities/song/song.dart';

class SongDetailWidget extends StatelessWidget {
  final SongEntity songEntity;

  const SongDetailWidget({
    super.key, required this.songEntity
  });

  @override
  Widget build(BuildContext context) {
    return songDetail();
  }

  Widget songDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              songEntity.artist,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14
              ),
            ),
          ],
        ),
        FavoriteButton(
            songEntity: songEntity
        )
      ],
    );
  }
}
