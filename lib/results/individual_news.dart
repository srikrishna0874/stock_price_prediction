import 'package:flutter/material.dart';
import 'package:stock_price_prediction/backend/functions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class IndividualNews extends StatefulWidget {
  const IndividualNews({super.key, required this.news});

  final Map<String, dynamic> news;

  @override
  State<IndividualNews> createState() => _IndividualNewsState();
}

class _IndividualNewsState extends State<IndividualNews> {
  String sentiment = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Image.network(
                widget.news['image'],
                errorBuilder: (error, stack, context) {
                  return Image.asset('assets/news.jpg');
                },
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                widget.news['headline'],
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.news['summary'],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  sentiment.isEmpty
                      ? ElevatedButton(
                          onPressed: () async {
                            try {
                              setState(() {
                                sentiment = 'loading';
                              });
                              Map<String, dynamic> res =
                                  await getSentimentForNews(
                                      widget.news['headline']);
                              setState(() {
                                sentiment = res['sentiment'];
                              });
                            } catch (e) {
                              print(e.toString());
                              setState(() {
                                sentiment = 'Neutral';
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                          ),
                          child: Text(
                            "Get Sentiment",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : sentiment == 'loading'
                          ? Padding(
                              padding: const EdgeInsets.only(left: 38.0),
                              child: CircularProgressIndicator(
                                color: Colors.deepOrange,
                              ),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.05,
                              //padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: sentiment == 'Positive'
                                    ? Colors.green.shade100
                                    : Colors.red.shade100,
                                border: Border.all(
                                  color: sentiment == 'Positive'
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text(
                                  sentiment.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: sentiment == 'Positive'
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              ),
                            ),
                  ElevatedButton(
                    onPressed: () async {
                      final Uri url = Uri.parse(widget.news['url']);
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      "View News",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
