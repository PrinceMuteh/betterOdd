// import 'dart:convert';
// import 'package:betterodds/constants.dart';
// import 'package:betterodds/models/match_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;

// class Matches extends StatefulWidget {
//   const Matches({super.key});
//   @override
//   State<Matches> createState() => _MatchesState();
// }

// class _MatchesState extends State<Matches> {
//   late Future<List<Matchs>> matchFuture;

//   @override
//   void initState() {
//     super.initState();
//     matchFuture = loadMatchFromJson();
//   }

//   Future<List<Matchs>> loadMatchFromJson() async {
//     try {
//       String jsonString = await rootBundle.loadString('assets/match.json');
//       final jsonResponse = json.decode(jsonString);
//       return jsonResponse.map<Matchs>((json) => Matchs.fromJson(json)).toList();
//     } catch (e) {
//       print('Error: $e');
//       throw Exception('Failed to load match data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Matchs>>(
//       future: matchFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return const Center(child: Text("Error loading match data"));
//         } else if (snapshot.hasData) {
//           List<Matchs> matches = snapshot.data!;
//           return ListView.builder(
//             itemCount: matches.length,
//             itemBuilder: (context, index) {
//               // return Text("Hello wot");
//               return MyRowContainer(matchs: matches[index]);
//             },
//           );
//         }
//         return const SizedBox(); // Return empty widget if no data
//       },
//     );
//   }
// }

// class MyRowContainer extends StatelessWidget {
//   final Matchs matchs;
//   const MyRowContainer({super.key, required this.matchs});
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           matchs.season,
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         ...matchs.details.map((detail) => MatchCard(detail: detail)).toList(),
//       ],
//     );
//   }
// }

// class MatchCard extends StatefulWidget {
//   final MatchDetail detail;
//   const MatchCard({super.key, required this.detail});

//   @override
//   State<MatchCard> createState() => _MatchCardState();
// }

// class _MatchCardState extends State<MatchCard> {
//   bool isOddsVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           leading: Image.network(widget.detail.team1logo, width: 40),
//           title: Text('${widget.detail.team1} vs ${widget.detail.team2}'),
//           subtitle: Text(widget.detail.time),
//           trailing: IconButton(
//             icon: Icon(isOddsVisible ? Icons.expand_less : Icons.expand_more),
//             onPressed: () {
//               setState(() {
//                 isOddsVisible = !isOddsVisible;
//               });
//             },
//           ),
//         ),
//         if (isOddsVisible)
//           Column(
//             children: widget.detail.odds.map((odd) {
//               // _buildOddsRow(bgColor, Colors.blue, ["", "1", "X", "2"]);
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(odd.site),
//                   Text("1: ${odd.odd1}"),
//                   Text("X: ${odd.oddX}"),
//                   Text("2: ${odd.odd2}"),
//                 ],
//               );
//             }).toList(),
//           ),
//       ],
//     );
//   }

//   Widget _buildOddsRow(
//       Color borderColor, Color backgroundColor, List<String> values) {
//     return Row(
//       children: List.generate(values.length, (index) {
//         return Expanded(
//           flex: index == 0 ? 2 : 1,
//           child: Container(
//             padding: const EdgeInsets.all(12.0),
//             decoration: BoxDecoration(
//               color: backgroundColor,
//               border: Border.all(color: borderColor),
//             ),
//             child: Center(
//               child: index == 0 && backgroundColor == Colors.blue
//                   ? const Icon(
//                       Icons.star_border_outlined,
//                       color: Colors.white,
//                       size: 14.0,
//                     )
//                   : Text(
//                       values[index],
//                       style: TextStyle(
//                         color: backgroundColor == Colors.blue
//                             ? Colors.white
//                             : Colors.black,
//                       ),
//                     ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }

// class MyRowContainer extends StatefulWidget {
//   final Matchs matchs;
//   const MyRowContainer({super.key, required this.matchs});
//   @override
//   State<MyRowContainer> createState() => _MyRowContainerState();
// }

// class _MyRowContainerState extends State<MyRowContainer> {
//   bool isOddsVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(6.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Wrap(
//                 crossAxisAlignment: WrapCrossAlignment.center,
//                 children: [
//                   _buildImage(
//                     "https://static.livescore.com/competition/high/2023-spain-laliga.png",
//                     width: 20,
//                   ),
//                   const SizedBox(width: defaultPadding),
//                   _buildTextColumn(widget.matchs.team1, widget.matchs.team2),
//                 ],
//               ),
//               const Icon(
//                 Icons.arrow_right,
//                 color: Colors.white,
//                 size: 16.0,
//               ),
//             ],
//           ),
//           const SizedBox(height: defaultPadding),
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 isOddsVisible = !isOddsVisible; // Toggle the visibility
//               });
//             },
//             child: _buildGameInfo(widget.matchs), // Make game info clickable
//           ),
//           if (isOddsVisible) // Conditionally render the odds comparison
//             _buildOddsComparison(widget.matchs),
//         ],
//       ),
//     );
//   }

//   Widget _buildImage(String url, {double width = 15}) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Image.network(url, width: width),
//     );
//   }

//   Widget _buildTextColumn(String team1, String team2) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           team1,
//           style: const TextStyle(fontSize: 14.0, color: Colors.white),
//         ),
//         Text(
//           team2,
//           style: const TextStyle(fontSize: 10.0, color: Colors.white60),
//         ),
//       ],
//     );
//   }

//   Widget _buildGameInfo(matchs) {
//     return Container(
//       padding: const EdgeInsets.all(12.0),
//       decoration: const BoxDecoration(
//         color: Colors.white54,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               const Text("20:00",
//                   style: TextStyle(fontSize: 14.0, color: Colors.black)),
//               const SizedBox(width: defaultPadding),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildTeamRow(
//                     "https://lsm-static-prod.livescore.com/medium/enet/9885.png", // Team 1 image
//                     matchs.team1,
//                   ),
//                   const SizedBox(height: defaultPadding),
//                   _buildTeamRow(
//                     "https://lsm-static-prod.livescore.com/medium/enet/8633.png", // Team 2 image
//                     matchs.team2,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const Icon(
//             Icons.star_border_outlined,
//             color: Colors.white,
//             size: 14.0,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTeamRow(String imageUrl, String teamName) {
//     return Row(
//       children: [
//         _buildImage(imageUrl),
//         const SizedBox(width: defaultPadding),
//         Text(
//           teamName,
//           style: const TextStyle(fontSize: 14.0, color: Colors.black54),
//         ),
//       ],
//     );
//   }

//   Widget _buildOddsComparison(Matchs match) {
//     return Column(
//       children: match.odds.map((bettingOdds) {
//         return Row(
//           children: [
//             Expanded(
//               flex: 2,
//               child: Container(
//                 padding: const EdgeInsets.all(12.0),
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   border: Border.all(color: bgColor),
//                 ),
//                 child: Center(
//                   child: Text(bettingOdds.site),
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 padding: const EdgeInsets.all(12.0),
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   border: Border.all(color: bgColor),
//                 ),
//                 child: Center(
//                   child: Text(bettingOdds.odd1),
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 padding: const EdgeInsets.all(12.0),
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   border: Border.all(color: bgColor),
//                 ),
//                 child: Center(
//                   child: Text(bettingOdds.oddX),
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 padding: const EdgeInsets.all(12.0),
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   border: Border.all(color: bgColor),
//                 ),
//                 child: Center(
//                   child: Text(bettingOdds.odd2),
//                 ),
//               ),
//             ),
//           ],
//         );
//       }).toList(),
//     );
//   }
// }

import 'dart:convert';

import 'package:betterodds/constants.dart';
import 'package:betterodds/models/match_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Matches extends StatefulWidget {
  const Matches({super.key});

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  late Future<List<Matchs>> matchFuture;

  @override
  void initState() {
    super.initState();
    matchFuture = loadMatchFromJson();
  }

  Future<List<Matchs>> loadMatchFromJson() async {
    try {
      String jsonString = await rootBundle.loadString('assets/match.json');
      final jsonResponse = json.decode(jsonString);
      return jsonResponse.map<Matchs>((json) => Matchs.fromJson(json)).toList();
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load match data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Betting Odds"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder<List<Matchs>>(
          future: matchFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Error loading match data"));
            } else if (snapshot.hasData) {
              List<Matchs> matches = snapshot.data!;
              return ListView.builder(
                itemCount: matches.length,
                itemBuilder: (context, index) {
                  return MyRowContainer(matchs: matches[index]);
                },
              );
            }
            return const SizedBox(); // Return empty widget if no data
          },
        ),
      ),
    );
  }
}

class MyRowContainer extends StatefulWidget {
  final Matchs matchs;
  const MyRowContainer({super.key, required this.matchs});

  @override
  State<MyRowContainer> createState() => _MyRowContainerState();
}

class _MyRowContainerState extends State<MyRowContainer> {
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          _buildHeaderRow(),
          const SizedBox(height: defaultPadding),
          SizedBox(
            height: 400,
            child: ListView(
                children: widget.matchs.details.map((odds) {
              return Column(
                children: [
                  GestureDetector(
                      onTap: () => setState(() => visibility = !visibility),
                      child: _buildGameInfo(odds)),
                  if (visibility) _buildExpandedContent(),
                ],
              );
            }).toList()),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _buildImage(widget.matchs.logo, width: 20),
            const SizedBox(width: defaultPadding),
            _buildTextColumn(widget.matchs.season, widget.matchs.country),
          ],
        ),
        const Icon(
          Icons.arrow_right,
          color: Colors.white,
          size: 16.0,
        ),
      ],
    );
  }

  Widget _buildExpandedContent() {
    return Column(
      children: [
        _buildOddsRow(bgColor, Colors.blue, ["", "1", "X", "2"]),
        // const SizedBox(height: defaultPadding),
        _buildOddsRow(
            bgColor, Colors.white, ["Bet9ja", "50.00", "10.00", "30"]),
        _buildOddsRow(
            bgColor, Colors.white, ["1XBET", "34.00", "180.00", "320"]),
      ],
    );
  }

  Widget _buildOddsRow(
      Color borderColor, Color backgroundColor, List<String> values) {
    return Row(
      children: List.generate(values.length, (index) {
        return Expanded(
          flex: index == 0 ? 2 : 1,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: borderColor),
            ),
            child: Center(
              child: index == 0 && backgroundColor == Colors.blue
                  ? const Icon(
                      Icons.star_border_outlined,
                      color: Color.fromARGB(255, 158, 124, 124),
                      size: 14.0,
                    )
                  : Text(
                      values[index],
                      style: TextStyle(
                        color: backgroundColor == Colors.blue
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildImage(String url, {double width = 25}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.network(url, width: width),
    );
  }

  Widget _buildTextColumn(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14.0, color: Colors.white),
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 10.0, color: Colors.white60),
        ),
      ],
    );
  }

  Widget _buildGameInfo(data) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: const BoxDecoration(
        color: Colors.white54,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                data.time ?? "",
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              const SizedBox(width: defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTeamRow(
                    "https://lsm-static-prod.livescore.com/medium/enet/9885.png",
                    "Juventus",
                  ),
                  const SizedBox(height: defaultPadding),
                  _buildTeamRow(
                    "https://lsm-static-prod.livescore.com/medium/enet/8633.png",
                    "Real Madrid",
                  ),
                ],
              ),
            ],
          ),
          const Icon(
            Icons.star_border_outlined,
            color: Colors.white,
            size: 14.0,
          ),
        ],
      ),
    );
  }

  Widget _buildTeamRow(String imageUrl, String teamName) {
    return Row(
      children: [
        _buildImage(imageUrl),
        const SizedBox(width: defaultPadding),
        Text(
          teamName,
          style: const TextStyle(fontSize: 14.0, color: Colors.black54),
        ),
      ],
    );
  }
}
