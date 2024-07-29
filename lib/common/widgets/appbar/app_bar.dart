import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Widget ?title ;
  final Widget ?action ;
  final bool hideBack ;
  const BasicAppBar({
    super.key,
    this.title,
    this.hideBack =false,
    this.action
  });

  @override
  Widget build(BuildContext context) {
 return AppBar(
 backgroundColor: Colors.transparent,
   elevation: 0,
   centerTitle: true,
   title: title ?? const Text(''),
   actions: [
     action ?? Container()
   ],
   leading: hideBack ? null : IconButton(
       onPressed: (){
         Navigator.pop(context);
       },
       icon: Container(
         height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: context.isDarkMode ? Colors.white.withOpacity(0.03) : Colors.black.withOpacity(0.04),
          shape: BoxShape.circle
        ),
         child: Icon(
           Icons.arrow_back_ios_new,
           size: 15,
           color: context.isDarkMode ? Colors.white :Colors.black,
         )
         ),

   ),
 );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}