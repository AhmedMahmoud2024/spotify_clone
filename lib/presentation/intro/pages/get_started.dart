import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget{
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:Stack(
       children: [
         Container(
           padding: const EdgeInsets.symmetric(
             vertical: 40,
             horizontal: 40
           ),
           decoration: const BoxDecoration(
             image: DecorationImage(
               fit: BoxFit.fill,
               image: AssetImage(
                 AppImages.introBg
               )
             )
           ),

         ),
         Container(
           color: Colors.black.withOpacity(0.15),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(
             horizontal: 40,
             vertical: 40
           ),
           child: Column(
             children: [
               Align(
                 alignment: Alignment.topCenter,
                 child: SvgPicture.asset(
                     AppVectors.logo
                 ),
               ),
               const Spacer(),
               const Text(
                 "Enjoy Listening to music",
                 style: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.white,
                     fontSize: 18
                 ),
               ),
               const SizedBox(height: 21,),
               const Text(
                 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                 style: TextStyle(
                     fontWeight: FontWeight.w500,
                     color: AppColors.grey,
                     fontSize: 13
                 ),
                 textAlign: TextAlign.center,
               ),
               const SizedBox(height: 20,),
               BasicAppButton(
                   onPressed: (){
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (BuildContext context) => const ChooseModePage()
                         )
                     );
                   }
                   , title: "Get Started")
             ],
           ),
         ) ,
       ],
     )
   );
  }

}