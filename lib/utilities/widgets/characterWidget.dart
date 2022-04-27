import 'package:flutter/material.dart';
import 'package:rick_morty_api/Model/character.dart';

class characterCard extends StatelessWidget {
  final Results results;

  const characterCard({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        padding:const  EdgeInsets.all(10),
        child: Expanded(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: NetworkImage(
                      results.image.toString()),
                      loadingBuilder: (context, child,  progress) {
                        return progress == null ? child : const LinearProgressIndicator();
                      },
                      width: 130,
                ),
              ),
              // CircleAvatar(
              //    backgroundImage: NetworkImage(results.image.toString()),
              //    radius: 60,
              // ),
              // Image.network(
              //  results.image.toString(),
              //   width: 200,
              // ),
              Expanded(
                child: Container(
                 padding: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: [
                        Text(
                          "${results.name}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "${results.species}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          "${results.gender}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
