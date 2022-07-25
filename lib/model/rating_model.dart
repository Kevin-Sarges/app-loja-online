// ignore_for_file: public_member_api_docs, sort_constructors_first
class RatingModel {
  late double rate;
  late int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  RatingModel.fromJson(Map<String, dynamic> json) {
    rate =
        json['rate'] is int ? (json['rate'] as int).toDouble() : json['rate'];
    count = json['count'] as int;
  }
}
