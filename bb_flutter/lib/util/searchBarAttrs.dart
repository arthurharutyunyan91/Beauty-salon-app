// import 'package:flutter_app/resources/RColors.dart';
// import 'package:loader_search_bar/loader_search_bar.dart';
// import 'package:flutter/material.dart';
//
// class MySearchBarAttrs extends SearchBarAttrs {
//   MySearchBarAttrs({
//     Color primaryDetailColor = Colors.white70,
//     this.secondaryDetailColor = Colors.white30,
//     this.disabledDetailColor = RColors.blackShadowColor,
//     this.searchBarColor = RColors.blackShadowColor,
//     this.loaderBottomMargin = 0.0,
//     this.textBoxOutlineWidth = 0.0,
//     this.textBoxOutlineRadius = 3.0,
//     this.searchInputMargin = const EdgeInsets.all(0.0),
//     this.textBoxOutlineColor = RColors.blackShadowColor,
//     this.textBoxBackgroundColor = RColors.blackShadowColor,
//     this.statusBarColor = RColors.blackShadowColor,
//     TextStyle textStyle,
//   })  : this.primaryDetailColor = primaryDetailColor,
//         this.textStyle = textStyle ?? _getDefaultTextStyle(primaryDetailColor);
//
//   factory MySearchBarAttrs.defaultIconified() => MySearchBarAttrs(
//       textBoxBackgroundColor: Colors.transparent,
//       textBoxOutlineColor: Colors.transparent);
//
//   factory MySearchBarAttrs.defaultMerged() => MySearchBarAttrs(
//       textBoxBackgroundColor: Colors.black12,
//       textBoxOutlineColor: Colors.black26);
//
//   static TextStyle _getDefaultTextStyle(Color color) =>
//       TextStyle(fontSize: 18.0, color: color);
//
//   final Color primaryDetailColor;
//   final Color secondaryDetailColor;
//   final Color searchBarColor;
//   final Color disabledDetailColor;
//   final Color textBoxBackgroundColor;
//   final Color textBoxOutlineColor;
//   final double textBoxOutlineWidth;
//   final double textBoxOutlineRadius;
//   final double loaderBottomMargin;
//   final Color statusBarColor;
//   final TextStyle textStyle;
//   final EdgeInsets searchInputMargin;
//   final double blankInputIconSize = 40.0;
//   final double searchBarElevation = 0.0;
//   final double cancelSearchMarginLeft = 8.0;
//   final double searchTextFieldHeight = 36.0;
//   final double searchBarPadding = 4.0;
//   final EdgeInsets highlightButtonMargin = EdgeInsets.only(left: 4.0);
//   final EdgeInsets clearButtonMargin = EdgeInsets.only(right: 4.0);
//   final EdgeInsets searchInputBaseMargin =
//       EdgeInsets.symmetric(horizontal: 4.0);
//   final EdgeInsets searchTextFieldPadding =
//       EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0);
//   final Size searchBarSize = Size(500.0, 80.0);
//
//   /// Merges attributes with [other] into new object. Returned instance will
//   /// take all attrs of [other] that are not null and source object attributes
//   /// otherwise.
//   SearchBarAttrs merge(SearchBarAttrs other) {
//     return SearchBarAttrs(
//       primaryDetailColor: other.primaryDetailColor ?? this.primaryDetailColor,
//       secondaryDetailColor:
//           other.secondaryDetailColor ?? this.secondaryDetailColor,
//       disabledDetailColor:
//           other.disabledDetailColor ?? this.disabledDetailColor,
//       searchBarColor: other.searchBarColor ?? this.searchBarColor,
//       textBoxBackgroundColor:
//           other.textBoxBackgroundColor ?? this.textBoxBackgroundColor,
//       textBoxOutlineColor:
//           other.textBoxOutlineColor ?? this.textBoxOutlineColor,
//       loaderBottomMargin: other.loaderBottomMargin ?? this.loaderBottomMargin,
//       textBoxOutlineWidth:
//           other.textBoxOutlineWidth ?? this.textBoxOutlineWidth,
//       textBoxOutlineRadius:
//           other.textBoxOutlineRadius ?? this.textBoxOutlineRadius,
//       searchInputMargin: other.searchInputMargin ?? this.searchInputMargin,
//       statusBarColor: other.statusBarColor ?? this.statusBarColor,
//       textStyle: other.textStyle ?? this.textStyle,
//     );
//   }
// }
