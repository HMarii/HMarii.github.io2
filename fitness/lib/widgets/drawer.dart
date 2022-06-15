
import 'package:flutter/material.dart';
import 'package:fitness/screens/bodyfat.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return Drawer(
      
       width: MediaQuery.of(context).size.width * 0.25,
          child: ListView(
          padding: const EdgeInsets.all(0),
          
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
                  image: DecorationImage(
                 image: AssetImage("assets/bmiCalc2.png"),
                     fit: BoxFit.contain)
              ), //BoxDecoration
              child:Text(
                "",
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.percent),
              title: const Text('Testzsírszázalék Becslő'),
              onTap: () {
                Navigator.of(context).pop();
                _navigateToNextScreen(context);
              },
            ),
           /* ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),*/
            const Divider(
              color: Colors.black,
            ),
                    const AboutListTile( 
                      icon: Icon(
                        Icons.info,
                      ),
                      applicationIcon: Icon(
                        Icons.health_and_safety,
                      ),
                      applicationName: 'Fitness Calculator',
                      applicationVersion: '1.0',
                      applicationLegalese: '© 2022 Mari',
                      child: Text('Info'),
                    ),
          ],
        ),
    );
  } 
   void _navigateToNextScreen(BuildContext context) {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BodyFat()));
  }

}