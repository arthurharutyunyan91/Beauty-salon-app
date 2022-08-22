import 'package:flutter/material.dart';
import 'package:flutter_app/app/details/main/controller.dart';
import 'package:flutter_app/model/business.dart';
import 'package:flutter_app/resources/RColors.dart';
import 'package:flutter_app/util/sliverAppBarDelegate.dart';
import 'package:flutter_app/widget/gradient/vertical_gradient.dart';
import 'package:flutter_app/widget/icon/favorite_icon.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/rating/gf_rating.dart';

import '../tabs/details_tab/screen.dart';
import '../tabs/review_tab/screen.dart';
import '../tabs/service_tab/screen.dart';

class BusinessDetailsScreen extends StatelessWidget {
  final Business business;

  BusinessDetailsScreen({this.business});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsMainController(business));
    return Scaffold(
      backgroundColor: RColors.backgroundColor,
      body: BusinessDetailTabs(
        business: business,
      ),
    );
  }
}

class BusinessDetailTabs extends StatefulWidget {
  final Business business;

  BusinessDetailTabs({this.business});

  @override
  _BusinessDetailTabsState createState() => _BusinessDetailTabsState();
}

class _BusinessDetailTabsState extends State<BusinessDetailTabs>
    with TickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController =
        TabController(vsync: this, length: 3, animationDuration: Duration.zero)
          ..addListener(() {
            _scrollController.animateTo(
                _tabController.index == 0
                    ? 0.0
                    : MediaQuery.of(context).size.height * 0.4 - 50,
                duration: Duration(milliseconds: 200),
                curve: Curves.linear);
          });
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          _SliverAppBar(
            business: widget.business,
            onReviewTap: () => _tabController.index = 2,
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              TabBar(
                  controller: _tabController,
                  labelPadding: EdgeInsets.all(10),
                  unselectedLabelColor: Colors.white30,
                  indicatorColor: Colors.white,
                  indicatorWeight: 2,
                  tabs: <Widget>[
                    Tab(child: Text('Services')),
                    Tab(child: Text('Details')),
                    Tab(child: Text('Reviews')),
                  ]),
            ),
          ),
        ];
      },
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: <Widget>[
          ServicesTab2(),
          DetailTab2(),
          ReviewsTab2(),
        ],
      ),
      // ),
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  final Business business;
  final Function() onReviewTap;

  _SliverAppBar({this.business, this.onReviewTap});

  @override
  Widget build(BuildContext context) {
    final _appBarExpandedHeight = MediaQuery.of(context).size.height * 0.4;
    return GetBuilder<DetailsMainController>(
        builder: (_) => SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: true,
            iconTheme: IconThemeData(color: Colors.white),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20), child: FavoriteIcon()),
            ],
            title: Text(
              business.name,
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: RColors.backgroundColor,
            expandedHeight: _appBarExpandedHeight,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: SalonDetailsPictureWidget(
                business: business,
                onReviewTap: onReviewTap,
              ),
            )));
  }
}

class SalonDetailsPictureWidget extends StatefulWidget {
  final Business business;
  final Function onReviewTap;

  SalonDetailsPictureWidget({this.business, this.onReviewTap});

  @override
  _SalonDetailsPictureWidgetState createState() =>
      _SalonDetailsPictureWidgetState();
}

class _SalonDetailsPictureWidgetState extends State<SalonDetailsPictureWidget>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final widgetWidth = MediaQuery.of(context).size.width;
    final widgetHeight = MediaQuery.of(context).size.height * 0.45;
    return Container(
      key: ValueKey(widget.business.hashCode),
      width: widgetWidth,
      height: widgetHeight,
      child: Stack(
        children: <Widget>[
          Hero(
            tag: widget.business.address.hashCode,
            child: Image.network(
              widget.business.imageUrl,
              fit: BoxFit.cover,
              width: widgetWidth,
              height: widgetHeight,
            ),
          ),
          FadeTransition(
            opacity: animation,
            child: VerticalGradient(),
          ),
          FadeTransition(
            opacity: animation,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: widgetWidth,
                height: widgetHeight * 0.25,
                color: RColors.blackTransparentOverlay,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 4, bottom: 4, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            '${widget.business.name}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '${widget.business.address}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 4, bottom: 4, right: 20),
                      child: GestureDetector(
                        onTap: widget.onReviewTap,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GFRating(
                              value: widget.business.starCount,
                              size: 12,
                              onChanged: (r) {},
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 4),
                              child: Text(
                                '${widget.business.reviewCount} reviews',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 10,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
