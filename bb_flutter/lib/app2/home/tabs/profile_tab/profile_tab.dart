import 'package:flutter/material.dart';
import 'package:flutter_app/resources/RColors.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _query = MediaQuery.of(context).size;
    return Container(
      width: _query.width,
      height: _query.height,
      color: RColors.backgroundColor,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              CurveDecorationWidget(
                widgetHeight: _query.height * 0.42,
                bgColor: RColors.amber90,
                shadow: true,
                bottomLeft: Radius.elliptical(180, 100),
                bottomRight: Radius.elliptical(180, 100),
              ),
              CurveDecorationWidget(
                widgetHeight: _query.height * 0.4,
                bgColor: RColors.backgroundColor,
                shadow: false,
                bottomLeft: Radius.elliptical(180, 180),
                bottomRight: Radius.elliptical(180, 180),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Column(
              children: <Widget>[
                IconWithTextWidget(
                  icon: Icons.announcement,
                  text: 'Reviews',
                  onTap: () {},
                ),
                IconWithTextWidget(
                  icon: Icons.payment,
                  text: 'Payments',
                  onTap: () {},
                ),
                IconWithTextWidget(
                  icon: Icons.assessment,
                  text: 'Statistics',
                  onTap: () {},
                ),
                IconWithTextWidget(
                    icon: Icons.arrow_back,
                    text: 'Log out',
                    onTap: () {
                      // FireBaseAuthManager.getInstance().signOut();
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CurveDecorationWidget extends StatelessWidget {
  final double widgetHeight;
  final Color bgColor;
  final bool shadow;
  final Radius bottomLeft;
  final Radius bottomRight;

  CurveDecorationWidget(
      {@required this.widgetHeight,
      @required this.shadow,
      @required this.bgColor,
      @required this.bottomLeft,
      @required this.bottomRight});

  @override
  Widget build(BuildContext context) {
    var _widgetWidth = MediaQuery.of(context).size.width;
    return Stack(children: <Widget>[
      Container(
          width: double.infinity,
          height: widgetHeight,
          decoration: BoxDecoration(
              boxShadow: shadow
                  ? [
                      BoxShadow(
                        color: RColors.blackShadowColor,
                        blurRadius: 15.0,
                        // has the effect of softening the shadow
                        offset: Offset(
                          0.0, // horizontal, move right 10
                          5.0, // vertical, move down 10
                        ),
                      )
                    ]
                  : null,
              color: bgColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: bottomLeft, bottomRight: bottomRight))),
      Positioned(
        left: _widgetWidth * 0.5 - _widgetWidth * 0.4 / 2,
        top: widgetHeight * 0.5 / 2,
        child: Column(
          children: <Widget>[
            Container(
              width: _widgetWidth * 0.4,
              height: _widgetWidth * 0.4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/load1.gif',
                  image:
                      'https://www.couturehairdesign.com/uploads/2/6/5/2/26524431/5186700_orig.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                'Phill Jhones',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 32,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mode_edit,
                color: Colors.white,
                size: 32,
              ),
            )
          ],
        ),
      )
    ]);
  }
}

class IconWithTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  IconWithTextWidget(
      {@required this.icon, @required this.text, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(icon, size: 34, color: Colors.white),
              ),
              Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
