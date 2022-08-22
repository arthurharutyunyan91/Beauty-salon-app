import 'package:flutter_app/model/user.dart';

class Review {
  User user;
  int date;
  double starsCount;
  String comment;

  Review(this.user, this.date, this.starsCount, this.comment);

  Review.fromJson(Map<dynamic, dynamic> data) {
    user = User.fromJson(data['user']);
    date = data['date'];
    starsCount = data['starsCount'];
    comment = data['comment'];
  }

  toJson() => {
        'user': user.toJson(),
        'date': date,
        'starsCount': starsCount,
        'comment': comment
      };
}
