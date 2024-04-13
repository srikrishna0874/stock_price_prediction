import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stock_price_prediction/results/individual_news.dart';

class MarketNewsResults extends StatefulWidget {
  const MarketNewsResults({super.key, required this.marketNewsData});
  final List<dynamic> marketNewsData;
  @override
  State<MarketNewsResults> createState() => _MarketNewsResultsState();
}

class _MarketNewsResultsState extends State<MarketNewsResults> {
  @override
  void initState() {
    super.initState();
    setState(() {
      marketNews = widget.marketNewsData;
    });
  }

  List<dynamic> marketNews = [];

  List<String> categories = ['General', 'Forex', 'Crypto', 'Merger'];
  String clickedOn = "Forex";


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        setState(() {
                          clickedOn = categories[index];
                        });
                        print(49);

                        var response = await http.get(Uri.parse(
                            'https://finnhub.io/api/v1/news?category=${categories[index]}&token=cnd01f1r01qr85dt36h0cnd01f1r01qr85dt36hg'));
                        List<dynamic> res = jsonDecode(response.body);
                        setState(() {
                          marketNews = res;
                        });
                        print(57);

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: clickedOn == categories[index]
                              ? Colors.deepOrange
                              : Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.deepOrange,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            categories[index].toString(),
                            style: TextStyle(
                              color: clickedOn == categories[index]
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 4,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                IndividualNews(news: marketNews[index]),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.3,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurStyle: BlurStyle.outer,
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Image.network(
                              marketNews[index]['image'],
                              fit: BoxFit.fill,
                              errorBuilder: (error,stack,context) {
                                return Image.asset('assets/news.jpg');
                              },
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.1,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.black38,
                                    Colors.black12,
                                  ]),
                                ),
                                child: Text(
                                  marketNews[index]['headline'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: marketNews.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
