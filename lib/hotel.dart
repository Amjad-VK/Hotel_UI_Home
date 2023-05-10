// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

final List rooms = [
  {"image": "assets/rooms/room1.jpg", "title": "Awesome room near Kakkanad"},
  {"image": "assets/rooms/room1.jpg", "title": "Awesome room near Kakkanad"},
  {"image": "assets/rooms/room1.jpg", "title": "Awesome room near Kakkanad"},
  {"image": "assets/rooms/room1.jpg", "title": "Awesome room near Kakkanad"},
];

class Hotelui extends StatelessWidget {
  const Hotelui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            backgroundColor: Colors.cyan,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
            floating: true,
            flexibleSpace: ListView(
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Type Your Location",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Kakkand,Kochi",
                        icon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                        )),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 10,
          )),
          const SliverToBoxAdapter(child: SizedBox(height: 10.0,),),
          SliverToBoxAdapter(
            child: buildCategories(),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return buildRooms(context, index);
            }, childCount: 100),
          )
        ],
      ),
    );
  }

  Widget buildCategories() {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          SizedBox(width: 15.0,),
          Category(
            backgroundColor: Colors.pink,
            icon: Icons.hotel,
            title: "Hotel",
          ),
          SizedBox(width: 15.0,),
          Category(
            backgroundColor: Colors.blue,
            title: "Restaurant",
            icon: Icons.restaurant,
          ),
          SizedBox(width: 15.0,),
          Category(
            icon: Icons.local_cafe,
            backgroundColor: Colors.orange,
            title: "Cafe",
          )
        ],
      ),
    );
  }

  Widget buildRooms(BuildContext context, int index) {
    var room = rooms[index % rooms.length];
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(5.0),
            color: Color.fromARGB(255, 184, 190, 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.asset(room['image']),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Icon(Icons.star, color: Colors.grey.shade800,size: 20.0,),
                    ),
                    const Positioned(
                      right: 8,
                      top: 8,
                      child: Icon(Icons.star_border, color: Colors.white,size: 24.0,),
                    ),
                    Positioned(
                      bottom: 20.0,
                      right: 10.0,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.white,
                        child: const Text("\$40"),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(room['title'], style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),),
                      const SizedBox(height: 5.0,),
                      const Text("Kakkanad,Kochi"),
                      const SizedBox(height: 10.0,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Icon(Icons.star, color: Colors.green,),
                          Icon(Icons.star, color: Colors.green,),
                          Icon(Icons.star, color: Colors.green,),
                          Icon(Icons.star, color: Colors.green,),
                          Icon(Icons.star, color: Colors.green,),
                          SizedBox(width: 5.0,),
                          Text("(220 reviews)", style: TextStyle(color: Colors.grey),)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
}

// BOX COLOR CODE ALT
//       Padding(
//         padding: const EdgeInsets.only(top: 30.0),
//         child: Icon(Icons.hotel),
//       ),
//     ])),
// SizedBox(
//   width: 10,
// ),
// Container(
//     width: 100,
//     height: 100,
//     color: Colors.green,
//     child: Column(children: [
//       Padding(
//         padding: const EdgeInsets.only(top: 30.0),
//         child: Icon(Icons.restaurant),
//       ),
//     ])),
// SizedBox(
//   width: 10,
// ),
// Container(
//     width: 100,
//     height: 100,
//     color: Colors.yellow,
//     child: Column(children: [
//       Padding(
//         padding: const EdgeInsets.only(top: 30.0),
//         child: Icon(Icons.local_cafe),
//       ),
// ]))
}
class Category extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? backgroundColor;

  const Category({
    Key? key,
    required this.icon,
    required this.title,
    this.backgroundColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(5.0))
        ),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(10.0),
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: Colors.white,),
            const SizedBox(height: 5.0,),
            Text(title, style: const TextStyle(
                color: Colors.white
            ))
          ],
        ),
      ),
    );
  }
}