import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String image;
  final Function() press;
  const ItemCard(
      {Key? key, required this.title, required this.image, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(right: 20, left: 20),
        height: 400,
        width: 270,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                height: 380,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34),
                    color: Colors.orange.withOpacity(0.1)),
              ),
            ),
            Positioned(
              left: 10,
              top: 10,
              child: Container(
                height: 181,
                width: 181,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange.withOpacity(0.3),
                ),
              ),
            ),
            CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage(image),
            ),
            Positioned(
              top: 250,
              right: 50,
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.brown),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
