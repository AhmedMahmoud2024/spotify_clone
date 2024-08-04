
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/widgets/favorite_button/favorite_button.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/song_player/bloc/song_player_cubit.dart';
import 'package:spotify/presentation/song_player/bloc/song_player_state.dart';
import 'package:spotify/presentation/song_player/widgets/song_cover/song_cover.dart';
import 'package:spotify/presentation/song_player/widgets/song_details/song_detail.dart';
import 'package:spotify/presentation/song_player/widgets/song_player/song_player.dart';
import '../../../common/widgets/appbar/app_bar.dart';
import '../../../core/configs/constants/app_urls.dart';
import '../../../core/configs/theme/app_colors.dart';
class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;

  const SongPlayerPage({
    super.key, required this.songEntity
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text(
          "Now Playing",
          style: TextStyle(
              fontSize: 18
          ),
        ),
        action: IconButton(
            onPressed: () {

            },
            icon: const Icon(
                Icons.more_vert_rounded
            )
        ),
      ),
      body: BlocProvider(
        create: (_) =>
        SongPlayerCubit()
          ..loadSong(
              '${AppURLs.songFirestorage}${songEntity.artist} - ${songEntity
                  .title}.mp3?${AppURLs.mediaAlt}'
          ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16
          ),
          child: Column(
            children: [
              SongCoverWidget(songEntity: songEntity),
              const SizedBox(height: 20,),
              SongDetailWidget(songEntity: songEntity),
              const SizedBox(height: 30,),
              SongPlayerWidget(songEntity: songEntity,)
            ],
          ),

        ),
      ),
    );
  }
}