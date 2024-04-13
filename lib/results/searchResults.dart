import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stock_price_prediction/widgets/inSearchResults.dart';

class SearchResultsPage extends StatefulWidget {
  const SearchResultsPage({super.key, required this.searchResultMap});

  final Map<String, dynamic> searchResultMap;

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: true,
        title: Image.asset(
          'assets/app_logo.jpeg',
          height: 60,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 5),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Text(
                  "TODAY'S ${widget.searchResultMap['ticker']} STOCK DATA",
                  style: const TextStyle(
                    color: Color.fromRGBO(0, 123, 255, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InSearchResults().buildTodaysResults(
                const Color.fromRGBO(0, 123, 255, 1),
                widget.searchResultMap["today_stock_results"]["today_open"]
                    .toString(),
                "OPEN",
                context,
              ),
              const SizedBox(
                height: 15,
              ),
              InSearchResults().buildTodaysResults(
                const Color.fromRGBO(255, 193, 7, 1),
                widget.searchResultMap["today_stock_results"]["today_high"]
                    .toString(),
                "HIGH",
                context,
              ),
              const SizedBox(
                height: 15,
              ),
              InSearchResults().buildTodaysResults(
                const Color.fromRGBO(40, 167, 69, 1),
                widget.searchResultMap["today_stock_results"]["today_low"]
                    .toString(),
                "LOW",
                context,
              ),
              const SizedBox(
                height: 15,
              ),
              InSearchResults().buildTodaysResults(
                const Color.fromRGBO(220, 53, 69, 1),
                widget.searchResultMap["today_stock_results"]["today_close"]
                    .toString(),
                "CLOSE",
                context,
              ),
              const SizedBox(
                height: 15,
              ),
              InSearchResults().buildTodaysResults(
                Colors.deepOrange,
                widget.searchResultMap["today_stock_results"]["today_adj_close"]
                    .toString(),
                "ADJ CLOSE",
                context,
              ),
              SizedBox(
                height: 18,
              ),
              InSearchResults().buildGraphsInSearchResults(
                  context,
                  widget.searchResultMap['PREDICTED_IMAGES']['TREND'],
                  widget.searchResultMap['ticker'],
                  "RECENT TRENDS IN ${widget.searchResultMap['ticker']} STOCK PRICES"),
              const SizedBox(
                height: 30,
              ),
              InSearchResults().buildGraphsInSearchResults(
                context,
                widget.searchResultMap['PREDICTED_IMAGES']['ARIMA'],
                widget.searchResultMap['ticker'],
                "ARIMA MODEL ACCURACY",
              ),
              const SizedBox(
                height: 30,
              ),
              InSearchResults().buildGraphsInSearchResults(
                context,
                widget.searchResultMap['PREDICTED_IMAGES']['LSTM'],
                widget.searchResultMap['ticker'],
                "LSTM MODEL ACCURACY",
              ),
              const SizedBox(
                height: 30,
              ),
              InSearchResults().buildGraphsInSearchResults(
                context,
                widget.searchResultMap['PREDICTED_IMAGES']['LINEAR REGRESSION'],
                widget.searchResultMap['ticker'],
                "LINEAR REGRESSION MODEL ACCURACY",
              ),
              SizedBox(
                height: 20,
              ),
              InSearchResults().buildTomorrowsResults(
                Color.fromRGBO(0, 123, 255, 1),
                widget.searchResultMap["ARIMA PREDICTION"].toString(),
                "TOMORROW'S ${widget.searchResultMap['ticker']} CLOSING PRICE BY ARIMA",
                context,
              ),
              SizedBox(
                height: 15,
              ),
              InSearchResults().buildTomorrowsResults(
                Color.fromRGBO(255, 193, 7, 1),
                widget.searchResultMap["LSTM_PREDICTION"].toString(),
                "TOMORROW'S ${widget.searchResultMap['ticker']} CLOSING PRICE BY LSTM",
                context,
              ),
              SizedBox(
                height: 15,
              ),
              InSearchResults().buildTomorrowsResults(
                Color.fromRGBO(40, 167, 69, 1),
                widget.searchResultMap["LINEAR_REGRESSION_PREDICTION"]
                    .toString(),
                "TOMORROW'S ${widget.searchResultMap['ticker']} CLOSING PRICE BY LINEAR REGRESSION",
                context,
              ),
              SizedBox(
                height: 15,
              ),
              InSearchResults().buildTomorrowsResults(
                Color.fromRGBO(220, 53, 69, 1),
                widget.searchResultMap["ARIMA_ERROR"].toString(),
                "ARIMA RSE",
                context,
              ),
              SizedBox(
                height: 15,
              ),
              InSearchResults().buildTomorrowsResults(
                Colors.deepOrange,
                widget.searchResultMap["LSTM_ERROR"].toString(),
                "LSTM RSE",
                context,
              ),
              SizedBox(
                height: 15,
              ),
              InSearchResults().buildTomorrowsResults(
                Colors.deepPurple,
                widget.searchResultMap["LINEAR_REGRESSION_ERROR"].toString(),
                "LINEAR REGRESSION RSE",
                context,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurStyle: BlurStyle.outer,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Text(
                        "RECENT TWEETS AND NEWS ABOUT ${widget.searchResultMap['ticker']} STOCK",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    for (String i in widget.searchResultMap['RECENT_TWEETS'])
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          '    $i',
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "SENTIMENT ANALYSIS FOR ${widget.searchResultMap['ticker']} STOCK",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Image.network(widget.searchResultMap['PREDICTED_IMAGES']
                        ['SENTIMENT_CHART']),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.37,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox.shrink(),
                        Text(
                          "Close",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/increase_pic.jpg',
                          width: 150,
                          height: 250,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i in widget
                                .searchResultMap['NEXT_SEVEN_DAYS_RESULTS'])
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text(i.toString()),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: widget.searchResultMap['OVERALL_RESULT'] ==
                          'Overall Positive'
                      ? Color.fromRGBO(40, 167, 69, 1)
                      : Color.fromRGBO(220, 53, 69, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.searchResultMap['OVERALL_RESULT'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "OVERALL NEWS POLARITY",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 110,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 123, 255, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "According to the ML Predictions & Sentiment Analysis of the Market News, a ${widget.searchResultMap['IDEA']} in AAPL stock is expected => ${widget.searchResultMap['DECISION']}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
