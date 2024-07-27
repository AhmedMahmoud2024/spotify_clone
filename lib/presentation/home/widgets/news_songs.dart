import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify/presentation/home/bloc/news_songs_state.dart';

import '../../../domain/entities/song/song.dart';

class NewsSongs extends StatelessWidget{
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
 return BlocProvider(
     create: (_) =>NewsSongsCubit()..getNewsSongs(),
   child: SizedBox(
     height: 200,
     child:BlocBuilder<NewsSongsCubit,NewsSongsState>(
       builder: (context,state){
         if(state is NewsSongsLoading){
           return Container(
             alignment: Alignment.center,
               child: CircularProgressIndicator()
           );
         }
         if(state is NewsSongsLoaded){
           return _songs(
             state.songs
           ) ;
         }
         return Container();
       },
     )

   ),
 );
  }
 Widget _songs(List<SongEntity> songs){
    return  ListView.separated(
      scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return SizedBox(
            width: 160,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image:NetworkImage(
                        '${AppURLs.firestorage}${songs[index].artist} - ${songs[index].title}.jpg?${AppURLs.mediaAlt}'
                        )
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 40,
                          width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.darkGrey
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                    songs[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  songs[index].title,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder:  (context,index) => SizedBox(width: 14,) ,
        itemCount: songs.length
    );
 }
}