import 'package:finalproject/components/palettes.dart';
import 'package:finalproject/model/cats.dart';
import 'package:flutter/material.dart';

class DetailCat extends StatefulWidget {
  final Cats cats;

  const DetailCat({Key? key, required this.cats}) : super(key: key);

  @override
  State<DetailCat> createState() => _DetailCatState();
}

class _DetailCatState extends State<DetailCat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cats.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.cats.imageLink,
                width: MediaQuery.of(context).size.width,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("About " + widget.cats.name,
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text("Intelligence",
                              style: TextStyle(color: Colors.white)),
                          SizedBox(height: 5),
                          Text((widget.cats.intelligence).toString(),
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Palette.mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text("Friendly",
                              style: TextStyle(color: Colors.white)),
                          SizedBox(height: 5),
                          Text((widget.cats.strangerFriendly).toString(),
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Palette.mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text("Playfulness",
                              style: TextStyle(color: Colors.white)),
                          SizedBox(height: 5),
                          Text((widget.cats.playfulness).toString(),
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Palette.mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text("Length", style: TextStyle(color: Colors.white)),
                          SizedBox(height: 5),
                          Text((widget.cats.length),
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Palette.mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text("Origin", style: TextStyle(color: Colors.white)),
                          SizedBox(height: 5),
                          Text((widget.cats.origin).toString(),
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Palette.mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text("Health", style: TextStyle(color: Colors.white)),
                          SizedBox(height: 5),
                          Text((widget.cats.generalHealth).toString(),
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Palette.mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
