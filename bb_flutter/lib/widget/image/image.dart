import 'package:flutter/material.dart';

class CircleFadeInImage extends StatelessWidget {
  final String imageUrl;
  final double size;

  CircleFadeInImage({@required this.imageUrl, this.size = 50, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/images/load1.gif',
          image: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
