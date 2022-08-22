import 'package:flutter/material.dart';
import 'package:flutter_app/app2/portfolio/controller.dart';
import 'package:flutter_app/model/business.dart';
import 'package:flutter_app/model/service.dart';
import 'package:flutter_app/model/staffer.dart';
import 'package:flutter_app/resources/RColors.dart';
import 'package:flutter_app/widget/text/divider_with_text.dart';
import 'package:get/get.dart';

class PortfolioScreen extends StatelessWidget {
  final Business business;
  final Staffer staffer;
  final Service service;

  PortfolioScreen({
    this.business,
    this.service,
    @required this.staffer,
  });

  @override
  Widget build(BuildContext context) {
    var _query = MediaQuery.of(context).size;
    var controller =
        Get.put(PortfolioController(business: business, service: service));
    return Scaffold(
      backgroundColor: RColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          service?.serviceName ?? '',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: RColors.backgroundColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: <Widget>[
          _ProfessionalInfo(
            staffer: staffer,
            widgetHeight: _query.height * 0.18,
            onBookTap: () => controller.goToMakeAppointment(staffer),
          ),
          DividerWithText(
            marginTop: 12,
            text: 'Portfolio',
          ),
          Expanded(
            child: PortfolioList(professional: staffer, query: _query),
          ),
        ],
      ),
    );
  }
}

class PortfolioList extends StatelessWidget {
  final Staffer professional;
  final Size _query;

  PortfolioList({
    @required this.professional,
    @required Size query,
  }) : _query = query;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: professional.portfolio.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/load1.gif',
            image: professional.portfolio[index],
            fit: BoxFit.cover,
            width: double.infinity,
            height: _query.height * 0.4,
          ),
        );
      },
    );
  }
}

class _ProfessionalInfo extends StatelessWidget {
  final PortfolioController controller = Get.find();
  final Staffer staffer;
  final double widgetHeight;
  final Function() onBookTap;

  _ProfessionalInfo({
    @required this.staffer,
    @required this.widgetHeight,
    @required this.onBookTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        width: double.infinity,
        height: widgetHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: staffer.imageUrl.hashCode + staffer.name.hashCode,
              child: Container(
                width: MediaQuery.of(context).size.height * 0.18,
                height: MediaQuery.of(context).size.height * 0.18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/load1.gif',
                    image: staffer.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${staffer.name}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: Text(
                                '${staffer.profession}',
                                style: TextStyle(
                                    color: Colors.white30, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                      Visibility(
                        visible: controller.service != null,
                        child: MaterialButton(
                          minWidth: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 8,
                          color: RColors.primaryColor,
                          onPressed: onBookTap,
                          child: Text(
                            'Book',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0, top: 6),
                    child: Text(
                      '${staffer.info ?? ''}',
                      style: TextStyle(color: Colors.white30, fontSize: 12),
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
