





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/configs/theme/app_colors.dart';
import '../../../../domain/entities/song/song.dart';
import '../../bloc/song_player_cubit.dart';
import '../../bloc/song_player_state.dart';

class SongPlayerWidget extends StatelessWidget {
  final SongEntity songEntity;

  const SongPlayerWidget({
    super.key, required this.songEntity
  });

  @override
  Widget build(BuildContext context) {
    return songPlayer(context);
  }

  Widget songPlayer( context){
    return BlocBuilder<SongPlayerCubit,SongPlayerState>(
        builder: (context,state){
          if(state is SongPlayerLoading){
            return const CircularProgressIndicator();
          }
          if(state is SongPlayerLoading){
            return Column(
              children: [
                Slider(
                    value: context.read<SongPlayerCubit>().songPosition.inSeconds.toDouble(),
                    min: 0.0,
                    max: context.read<SongPlayerCubit>().songDuration.inSeconds.toDouble(),
                    onChanged: (value){

                    }
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatDuration(
                          context.read<SongPlayerCubit>().songPosition
                      ),
                    ),
                    Text(
                      formatDuration(
                          context.read<SongPlayerCubit>().songDuration
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    context.read<SongPlayerCubit>().playOrPauseSong() ;
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary
                    ),
                    child: Icon(
                        context.read<SongPlayerCubit>().audioPlayer.playing ? Icons.pause :Icons.play_arrow_rounded
                    ),
                  ),
                )
              ],
            );
          }
          return Container() ;
        }
    );
  }
  String formatDuration(Duration duration){
    final minutes =duration.inMinutes.remainder(60) ;
    final seconds =duration.inSeconds.remainder(60) ;
    return '${minutes.toString().padLeft(2,'0')} : ${seconds.toString().padLeft(2,'0')}' ;
  }
}