import 'package:flutter/material.dart';

class ProfileEntires extends StatelessWidget {
  final entries;
  ProfileEntires(this.entries);
  @override
  Widget build(BuildContext context) {
    final temp =
        'https://cdn.getyourguide.com/img/location/546c82dc2cb7e.jpeg/88.jpg';
    return Container(
      height: 500,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1),
          itemCount: 100,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0.5),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        // NETWORK IMAGE IS TEMP. WILL REPLACE WITH DEFAULT IMAGE IF CHALLENGE IMAGE DOES NOT LOAD
                        NetworkImage(temp)),
              ),
              height: 300,
              width: double.infinity,
            );
          }),
    );
  }
}
