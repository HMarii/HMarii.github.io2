import 'package:flutter/material.dart';
import 'package:fitness/constants/app_constants.dart';
class AppBarSettings extends StatelessWidget with PreferredSizeWidget {

  final String appBarTitle;
   AppBarSettings({Key? key,  required this.appBarTitle}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      
       title: Text(
            appBarTitle,
            style:
                TextStyle(color: colorGrey, fontWeight: FontWeight.w400, fontSize: 42, fontFamily: 'Roboto' ),
          ),
          backgroundColor: colorGreen,
          iconTheme: IconThemeData(color: mainHexColor),
          elevation: 0,
          centerTitle: true,
          
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(55);

}