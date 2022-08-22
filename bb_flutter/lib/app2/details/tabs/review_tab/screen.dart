import 'package:flutter/material.dart';
import 'package:flutter_app/model/review.dart';
import 'package:flutter_app/resources/RColors.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';

import 'controller.dart';

class ReviewsTab2 extends StatelessWidget {
  final controller = Get.put(ReviewTabController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: RColors.backgroundColor,
      child: _ReviewsList(reviews: controller.business.reviews),
    );
  }
}

class _ReviewsList extends StatelessWidget {
  final List<Review> reviews;

  const _ReviewsList({@required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: reviews.length + 1,
      itemBuilder: (context, index) {
        return index == 0
            ? ReviewStarWithDiffWidget()
            : ReviewItemWidget(reviews[index - 1]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: Colors.white30,
          ),
        );
      },
    );
  }
}

class ReviewStarWithDiffWidget extends StatelessWidget {
  final ReviewTabController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: <Widget>[
          Text(
            controller.averageStars().toStringAsFixed(1),
            style: TextStyle(fontSize: 28, color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
          GFRating(
            onChanged: (i) {},
            value: controller.averageStars(),
            color: RColors.primaryColor,
          )
        ],
      ),
    );
  }
}

class ReviewItemWidget extends StatefulWidget {
  final Review review;

  ReviewItemWidget(this.review);

  @override
  _ReviewItemWidgetState createState() => _ReviewItemWidgetState();
}

class _ReviewItemWidgetState extends State<ReviewItemWidget> {
  bool _textExpended = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 12.0, top: 12, right: 8),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.12,
            height: MediaQuery.of(context).size.width * 0.12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/load1.gif',
                image: widget.review.user.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 12.0, bottom: 12, right: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      widget.review.user.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' (${DateFormat("MMM dd yyyy").format(DateTime.fromMillisecondsSinceEpoch(widget.review.date))})',
                      style: TextStyle(color: Colors.white30, fontSize: 12),
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(top: 4.0, bottom: 12),
                    child: GFRating(
                      value: widget.review.starsCount,
                      onChanged: (i) {},
                      size: 12.0,
                      color: RColors.primaryColor,
                    )),
                GestureDetector(
                  child: Text(
                    '${widget.review.comment}',
                    maxLines: _textExpended ? 10 : 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  onTap: () {
                    setState(() {
                      _textExpended = !_textExpended;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
