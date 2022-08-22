import 'package:flutter/material.dart';
import 'package:flutter_app/app2/home/tabs/search_tab/controller.dart';
import 'package:flutter_app/model/business.dart';
import 'package:flutter_app/resources/RColors.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';

import '../../../../widget/business_item/business_item.dart';

class SearchTab2 extends StatelessWidget {
  final SearchTabController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: RColors.backgroundColor,
      child: DefaultTabController(
        length: 3,
        child: CustomScrollView(
          slivers: <Widget>[
            _SliverAppBar(),
            GetBuilder<SearchTabController>(
              builder: (_) {
                return _SliverBusinessesList(
                  businesses: controller.businessesByCategory,
                  onBusinessTap: controller.goToBusinessDetails,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBar extends StatefulWidget {
  @override
  _SliverAppBarState createState() => _SliverAppBarState();
}

class _SliverAppBarState extends State<_SliverAppBar>
    with SingleTickerProviderStateMixin {
  final SearchTabController controller = Get.find();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this)
      ..addListener(() => controller.updateBusinessesByCategory(
          SearchTabController.tabs[_tabController.index]));
    _tabController.index = controller.selectedCategory;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 8,
      forceElevated: true,
      automaticallyImplyLeading: false,
      backgroundColor: RColors.backgroundColor,
      expandedHeight: MediaQuery.of(context).size.height * 0.15,
      floating: true,
      title: SearchBarWidget(controller.businesses,
          () => controller.goToMap(controller.businesses[0])),
      bottom: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white30,
          labelPadding: EdgeInsets.all(10),
          indicatorColor: Colors.white,
          indicatorWeight: 2,
          controller: _tabController,
          tabs: <Widget>[
            Text(SearchTabController.tabs[0]),
            Text(SearchTabController.tabs[1]),
            Text(SearchTabController.tabs[2]),
          ]),
    );
  }
}

class _SliverBusinessesList extends StatelessWidget {
  final List<Business> businesses;
  final Function(Business) onBusinessTap;

  _SliverBusinessesList({this.businesses, this.onBusinessTap});

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 140,
      delegate: SliverChildListDelegate(
        businesses
            .map((item) => BusinessWidget(
                business: item,
                onTap: () => onBusinessTap(item),
                key: Key(item.name)))
            .toList(),
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  final List<Business> businesses;
  final Function() goToMap;

  SearchBarWidget(this.businesses, this.goToMap);

  @override
  Widget build(BuildContext context) {
    List<String> list = [];
    businesses.forEach((e) {
      list.add(e.name);
    });
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: GFSearchBar(
              searchList: list,
              overlaySearchListItemBuilder: (item) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              },
              searchQueryBuilder: (query, list) {
                return list
                    .where((item) =>
                        item.toLowerCase().contains(query.toLowerCase()))
                    .toList();
              },
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.location_on),
          iconSize: 40,
          color: Colors.white,
          onPressed: goToMap,
        ),
      ],
    );
  }
}
