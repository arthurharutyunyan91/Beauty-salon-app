import 'package:flutter/material.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import '../../model/business.dart';
import '../../resources/RColors.dart';
import '../icon/favorite_icon.dart';

class BusinessWidget extends StatelessWidget {
  final Business business;
  final Function() onTap;

  //TODO add favorite icon tap logic
  BusinessWidget({@required this.business, @required this.onTap, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 8, right: 8),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 8.0,
                offset: Offset(
                  1.0, // horizontal, move right 10
                  2.0, // vertical, move down 10
                ),
              )
            ],
            color: RColors.backgroundColor,
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Hero(
                  tag: business.address.hashCode,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/load1.gif',
                    image: business.imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            business.name,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                          FavoriteIcon(isFavorite: business.favorite),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 12, right: 12),
                        child: Align(
                          alignment: Alignment(-1, 0),
                          child: Text(
                            business.address,
                            style:
                                TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${business.distance}km',
                            style: TextStyle(
                              color: Colors.white30,
                              fontSize: 12,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              GFRating(
                                onChanged: (i) {},
                                value: business.starCount.toDouble(),
                                size: 10,
                                color: RColors.primaryColor,
                                borderColor: RColors.primaryColor,
                              ),
                              Container(
                                width: 70,
                                padding: const EdgeInsets.only(left: 8.0),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${business.reviewCount} reviews',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        onTap: onTap,
        // () {
        // Navigator.of(context).pushNamed(BusinessDetailsPage.routeName,
        //     arguments: SalonDetailsArgs(business));
        // },
      ),
    );
  }
}
