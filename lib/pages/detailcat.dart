import 'package:finalproject/components/palettes.dart';
import 'package:finalproject/data/cats.dart';
import 'package:flutter/material.dart';

class DetailCat extends StatelessWidget {
  final Cats cats;

  const DetailCat({Key? key, required this.cats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cats.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                cats.imageLink,
                width: MediaQuery.of(context).size.width,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              cats.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Description :"),
            SizedBox(height: 10),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Origin"),
                      SizedBox(height: 5),
                      Text(cats.origin),
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(color: Palette.mainColor)),
                ),
                // Text("Origin"),
                // Text("Lenght"),
                // Text("Min Weight :"),
                // Text("Max Weight :"),
                // Text("Min Life Expectancy :"),
                // Text("Max Life Expectancy :"),
                // Text("Intelligence :"),
                // Text("Playfulness :"),
                // Text("General Health :"),
                // Text("Children Friendly :"),
                // Text("Stranger Friendly :"),
              ],
            ),
            // Row(
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(cats.origin),
            //         Text(cats.length),
            //         Text((cats.maxWeight).toString()),
            //         Text((cats.minWeight).toString()),
            //         Text((cats.minLifeExpectancy).toString()),
            //         Text((cats.maxLifeExpectancy).toString()),
            //         Text((cats.intelligence).toString()),
            //         Text((cats.playfulness).toString()),
            //         Text((cats.generalHealth).toString()),
            //         Text((cats.childrenFriendly).toString()),
            //         Text((cats.strangerFriendly).toString()),
            //       ],
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
