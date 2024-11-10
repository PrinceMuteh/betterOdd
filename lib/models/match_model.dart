// class Matchs {
//   final String id;
//   final String team1;
//   final String team2;
//   final String time;
//   final List<BettingOdds> odds;

//   Matchs({
//     required this.id,
//     required this.team1,
//     required this.team2,
//     required this.time,
//     required this.odds,
//   });

//   factory Matchs.fromJson(Map<String, dynamic> json) {
//     var oddsList = json['odds'] as List;
//     List<BettingOdds> oddsData =
//         oddsList.map((i) => BettingOdds.fromJson(i)).toList();

//     return Matchs(
//       id: json['id'],
//       team1: json['team1'],
//       team2: json['team2'],
//       time: json['time'],
//       odds: oddsData,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'team1': team1,
//       'team2': team2,
//       'time': time,
//       'odds': odds.map((o) => o.toJson()).toList(),
//     };
//   }
// }

// class BettingOdds {
//   final String site;
//   final String odd1;
//   final String oddX;
//   final String odd2;

//   BettingOdds({
//     required this.site,
//     required this.odd1,
//     required this.oddX,
//     required this.odd2,
//   });

//   factory BettingOdds.fromJson(Map<String, dynamic> json) {
//     return BettingOdds(
//       site: json['site'],
//       odd1: json['odd1'],
//       oddX: json['oddX'],
//       odd2: json['odd2'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'site': site,
//       'odd1': odd1,
//       'oddX': oddX,
//       'odd2': odd2,
//     };
//   }
// }

class Matchs {
  final String id;
  final String season;
  final String country;
  final String logo;
  final List<MatchDetail> details;

  Matchs({
    required this.id,
    required this.season,
    required this.country,
    required this.logo,
    required this.details,
  });

  factory Matchs.fromJson(Map<String, dynamic> json) {
    var detailsFromJson = json['details'] as List;
    List<MatchDetail> detailList =
        detailsFromJson.map((detail) => MatchDetail.fromJson(detail)).toList();
    return Matchs(
      id: json['id'],
      season: json['season'],
      country: json['country'],
      logo: json['logo'],
      details: detailList,
    );
  }
}

class MatchDetail {
  final String id;
  final String team1;
  final String team1logo;
  final String team2;
  final String team2logo;
  final String time;
  final List<Odds> odds;

  MatchDetail({
    required this.id,
    required this.team1,
    required this.team1logo,
    required this.team2,
    required this.team2logo,
    required this.time,
    required this.odds,
  });

  factory MatchDetail.fromJson(Map<String, dynamic> json) {
    var oddsFromJson = json['odds'] as List;
    List<Odds> oddsList = oddsFromJson.map((odd) => Odds.fromJson(odd)).toList();

    return MatchDetail(
      id: json['id'],
      team1: json['team1'],
      team1logo: json['team1logo'],
      team2: json['team2'],
      team2logo: json['team2logo'],
      time: json['time'],
      odds: oddsList,
    );
  }
}

class Odds {
  final String site;
  final String odd1;
  final String oddX;
  final String odd2;

  Odds({
    required this.site,
    required this.odd1,
    required this.oddX,
    required this.odd2,
  });

  factory Odds.fromJson(Map<String, dynamic> json) {
    return Odds(
      site: json['site'],
      odd1: json['odd1'],
      oddX: json['oddX'],
      odd2: json['odd2'],
    );
  }
}
