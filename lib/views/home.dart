import 'package:flutter/material.dart';
import 'package:rick_morty_api/Controller/homeController.dart';
import 'package:rick_morty_api/Model/character.dart';
import 'package:rick_morty_api/utilities/widgets/characterWidget.dart';
import 'package:rick_morty_api/utilities/widgets/my_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick And Morty'),
      ),
      drawer: const Drawer(
        child: MyDrawer(),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
         getCharacter(),
        
        ],
      )),
    );
  }
}
FutureBuilder<List<Results>> getCharacter() => 
FutureBuilder<List<Results>>( future: homeController.getCharacters(), builder: (context, snapshot) {
 if (snapshot.hasData) {
   final List<Results> characters = snapshot.data ?? [];
            final bool characterCounter = characters.isNotEmpty;
            if (characterCounter) {
              return _buildMyCharacters(characters);
            } else {
              return Container();
            }  
 }else {
   return const SizedBox(
     height: 300,
     child:Center (child: CircularProgressIndicator(),),
   );
 }
});

  Widget _buildMyCharacters(List<Results> characters) {
    return ListView.builder(
        physics: const  NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return characterCard(results: characters[index]);
        });
  }
