import 'package:flutter/material.dart';

class PhotoCircle extends StatelessWidget {
  final photo;
  final onTap;
  PhotoCircle(this.photo, this.onTap);

  @override
  Widget build(BuildContext context) {
    const double h = 150;
    const double w = 150;
    const double r = w/2;
    return Center(
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: CircleAvatar(
          radius: r,
          backgroundColor: Theme.of(context).primaryColor,
          child: photo != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(r),
                  child: Image.file(
                    photo,
                    width: w,
                    height: h,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(r)),
                  width: w,
                  height: h,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey[800],
                  ),
                ),
        ),
      ),
    );
  }
}
