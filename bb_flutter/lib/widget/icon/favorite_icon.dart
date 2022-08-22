import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  //  TODO remove
  final bool isFavorite;

  FavoriteIcon({this.isFavorite = false});

  @override
  _FavoriteIconState createState() => _FavoriteIconState(isFavorite);
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool _isFavorite;


  _FavoriteIconState(this._isFavorite);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: Icon(
        _isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.white70,
      ),
      onPressed: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
      },
    );
  }
}