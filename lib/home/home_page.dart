import 'dart:convert';

import 'package:stock_price_prediction/backend/functions.dart';
import 'package:stock_price_prediction/results/individual_news.dart';
import 'package:stock_price_prediction/results/market_news_results.dart';
import 'package:stock_price_prediction/results/searchResults.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  List<dynamic> marketNewsData = [];

  Future<void> fetchMarketNews() async {
    try {
      var response = await http.get(Uri.parse(
          'https://finnhub.io/api/v1/news?category=forex&token=cnd01f1r01qr85dt36h0cnd01f1r01qr85dt36hg'));
      print(response.body);
      setState(() {
        marketNewsData = jsonDecode(response.body);
      });
      print(21);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMarketNews();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  String dropDownValue = 'Ticker Symbol';
  final tempResult = {
    'ticker': 'AAPL',
    "LSTM_ERROR": 5.55110028314222,
    "LSTM_PREDICTION": 172.13693237304688,
    "ARIMA_ERROR": 2.203923643367122,
    "ARIMA PREDICTION": 170.1346743828859,
    "LINEAR_REGRESSION_ERROR": 8.461947309613064,
    "LINEAR_REGRESSION_PREDICTION": 184.39555215830163,
    "NEXT_SEVEN_DAYS_RESULTS": [
      184.39555215830163,
      177.42164883206286,
      178.29100155987382,
      176.92488833945174,
      175.83581406386423,
      179.274989081801,
      177.52673558572306
    ],
    "today_stock_results": {
      "today_open": 171.75,
      "today_close": 171.48,
      "today_high": 172.23,
      "today_low": 170.51,
      "today_vol": 65672700,
      "today_adj_close": 171.48
    },
    "PREDICTED_IMAGES": {
      "LSTM":
          "https://storage.googleapis.com/stock-price-prediction-74e2b.appspot.com/LSTM/31-03-2024/AAPL?Expires=1720516917&GoogleAccessId=firebase-adminsdk-7vgor%40stock-price-prediction-74e2b.iam.gserviceaccount.com&Signature=M1cOT9sySd19Cnt7LWVWWhFBN2jXzNfMwfwJYndR%2BwQhgIW1Tr0UghLEpMa7F83k%2FGPz%2FPtME2%2Bp%2FXotwvtTKm%2BWsQkHD6fR0YB17o%2BhYYq%2B41TO4Mj26%2FwVfwaNJB1EpfuL57ONOXMXKC9z1S%2BIB5t7JN%2B2dWxlkddGWUGf4tdcpKzkH97RJcWK%2FWOidvupiEd40v%2BeKoE1CPbwuunYEpJpvOxbdG4gNuh7baImrPW4FtSizDFuQ9PQ%2FFWDGhiek9YgAAE3064uTFN1CjMKSCUT0z1hn8lfiPD25wEMq9Cz9vVbXhk6whaxm5fnKLQeP2d4lg2CNz3iEQ3dzxFe0g%3D%3D",
      "ARIMA":
          "https://storage.googleapis.com/stock-price-prediction-74e2b.appspot.com/ARIMA/31-03-2024/AAPL?Expires=1720516917&GoogleAccessId=firebase-adminsdk-7vgor%40stock-price-prediction-74e2b.iam.gserviceaccount.com&Signature=Zk7r7AdrvaaSOVcp3k7qB1bpPlVlIP%2F8WTW%2BFoauswuTe3nF1tWBpxIeivRWWk%2F7rLb89j5GtQVrS16Qb9SISwVvir%2B4QauWGJsmDUvGhAVBEh5fbWPQ5Qd%2Fd6w3nvWLr%2BJPa5FdUZt2AbFGoS0FO%2FfZsoI2tdb2XfAgs2ubtIhhdztyKG%2FhQx6TlLqEkBrM4CQDJAKq43NaMSbhoDuOahJVok8Qhw8%2BLQfEPg9Um5y2kfPef5R5Mj2u4jF12nQF3GPBm7MGmC4zJSLR9a53GP6dPKMTwlBw7y2BB%2Bz5g7PXBXlYJk2h5p9pPsU6H%2BT2VIr9rl1%2FqtA8rSP3L89S5w%3D%3D",
      "LINEAR REGRESSION":
          "https://storage.googleapis.com/stock-price-prediction-74e2b.appspot.com/LINEAR%20REGRESSION/31-03-2024/AAPL?Expires=1720516917&GoogleAccessId=firebase-adminsdk-7vgor%40stock-price-prediction-74e2b.iam.gserviceaccount.com&Signature=T%2Bao25aZPb8iPnUHzcmO9elirsrVqimgRFJwXRacCpgIr3Ml%2FlqdzWPVJoDpHJO8piSBXYhLQxpxGzMOx0v1K1nGiODJ6k%2F%2FsS4D38dX3E%2FbK1Gaz%2F5pdZMKSVK4uYVrwc5gVuN6el7lPG0rV1AKag5y%2BGP5HufEIwQBRB6NmRLB6v0VIp0a76xrHCTrGA4ZDs6xohioeb%2FtrME3ru4FXYmHZi7IciwMIu3dL8xbtqhRAcIgE3zDLcgTVjXZ8lDF9RcceHGouiSGm3pmwTullPr0C0%2BRPs2fQrIjgIxefeGIuDJopxI85fYsUWq3Iwf4mLaoRMA3Xt8PGTJtqbs9vw%3D%3D",
      "TREND":
          "https://storage.googleapis.com/stock-price-prediction-74e2b.appspot.com/TRENDS/31-03-2024/AAPL?Expires=1720516917&GoogleAccessId=firebase-adminsdk-7vgor%40stock-price-prediction-74e2b.iam.gserviceaccount.com&Signature=GOwF8jWAB0cR8cxAgREZcubs%2FcxMoPLbFmDInfdANBMEynyXi%2F6woZ%2Flo62aCLetxITuke4wD6Ka96mYqKstoiqnv1V4FohEjYPETWnzNvifW6Dw70AQeJjTaYiScfM02OrjQZuhT140wfHWP6olpldEgG9JaiPOhWKQY%2BcQwpe9juAoCH1AMFOPYL3CzprxlsXL46xFSUSuj3BXL7ORxEIs9h14LsG2zeqv4joW%2BTgwOPM%2FdIJwvLE3JlllRK62%2FqkSMCQbGj%2BPUpZN4D3edr8j01858Txt6jgIiG7iZdtP%2BI5YF9%2ByTEQ6dr6pv%2B0h095vIhKvQI6d42op9G43OQ%3D%3D",
      "SENTIMENT_CHART":
          "https://storage.googleapis.com/stock-price-prediction-74e2b.appspot.com/SENTIMENT_CHARTS/31-03-2024/AAPL?Expires=1720516917&GoogleAccessId=firebase-adminsdk-7vgor%40stock-price-prediction-74e2b.iam.gserviceaccount.com&Signature=i2w6Nt2UQztushDd9Nt%2B%2BXskh8ENngEtBX1n%2BpTo4VQnka6362eY%2BvaiysgqOYXjvJqOUKSpQFy%2BbkrD8gxPY21fiZgsjcFg1R48SgjWxrF0cVHmBxNsmxaE%2FDpZgGidhYFR%2BmZ70PUvL25MzaeBLeVtBb7HglhdBE95YUSDsb3YLQlRE9TxVoBaFD818E7h9Nb0A9zblh1RgadzWqlBLp6H%2FgMxVu5kJdqpa794USl1C%2Bnu1TvndtwDZZhyuBOZdkiP8brHB%2BxfuoNGO%2Fu2QVUrSVCWN99Wm76ob7Mm%2BRnrRmHIF7RcBuKQWvn%2Fanq8GeebKjPQKbw07gO9cdtXDg%3D%3D"
    },
    "RECENT_TWEETS": [
      "Dow Jones Futures: Will Market Rally On 'Good' Inflation Data? Nvidia AI Chip Peer Works On Base",
      "Tesla Bull Says EV Giant Already Has A 25K Car: 'It's Called A Used Model Y'",
      "Tesla Deliveries Set To Plunge As Bulls Pin Hopes On FSD; BYD Leads Price War",
      "Can Tesla (NASDAQ:TSLA) Compete with BYD, LI, NIO, XPEV on Value?",
      "From Six Figures to Seven: 3 EV Stocks Set to Make Millionaires"
    ],
    "OVERALL_RESULT": "Overall Positive",
    "IDEA": "RISE",
    "DECISION": "BUY"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Stock Price Prediction',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Search By",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.38,
                    height: MediaQuery.of(context).size.height * 0.05,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: DropdownButton(
                      value: dropDownValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: [
                        DropdownMenuItem(
                          child: Text('Ticker Symbol'),
                          value: 'Ticker Symbol',
                        ),
                        DropdownMenuItem(
                          child: Text('Stock Name'),
                          value: 'Stock Name',
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          dropDownValue = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFBE9E7),
                    hintText: 'Enter $dropDownValue',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      onPressed: () async {
                        Map<String, dynamic> requiredResult = {};
                        print(56);
                        if (dropDownValue == 'Stock Name') {
                          var response = await http.get(Uri.parse(
                              'https://finnhub.io/api/v1/search?q=${searchController.text}&token=cnd01f1r01qr85dt36h0cnd01f1r01qr85dt36hg'));
                          print(response.body);
                          print(178);
                          Map<String, dynamic> result =
                              jsonDecode(response.body);
                          print(result['result'][0]['displaySymbol']);
                          print(179);
                          requiredResult = await searchFunctionBackend(
                              searchController.text);
                          searchController.clear();
                          Focus.of(context).unfocus();
                          requiredResult['ticker']=searchController.text;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchResultsPage(
                                searchResultMap: requiredResult,
                              ),
                            ),
                          );

                          print(requiredResult);
                        } else {

                          requiredResult =
                              await searchFunctionBackend(searchController.text);
                          requiredResult['ticker']=searchController.text;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchResultsPage(
                                searchResultMap: requiredResult,
                              ),
                            ),
                          );

                          print(requiredResult);
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MarketNewsResults(
                              marketNewsData: marketNewsData,
                            )),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Market News",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: marketNewsData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                IndividualNews(news: marketNewsData[index]),
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
                              marketNewsData[index]['image'],
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.black38,
                                    Colors.black12,
                                  ]),
                                ),
                                child: Text(
                                  marketNewsData[index]['headline'],
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
                    // return Container(
                    //   width: MediaQuery.of(context).size.width * 0.7,
                    //   height: MediaQuery.of(context).size.height * 0.3,
                    //   margin: EdgeInsets.only(bottom: 8),
                    //   padding: EdgeInsets.all(8),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20),
                    //     boxShadow: const [
                    //       BoxShadow(
                    //         color: Colors.grey,
                    //         blurStyle: BlurStyle.outer,
                    //         blurRadius: 3,
                    //       ),
                    //     ],
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       Text(
                    //         marketNewsData[index]['headline'].toString(),
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 15,
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         height: 5,
                    //       ),
                    //       Row(
                    //         children: [
                    //           Image.network(
                    //             marketNewsData[index]['image'],
                    //             width: MediaQuery.of(context).size.width * 0.4,
                    //             height:
                    //                 MediaQuery.of(context).size.height * 0.16,
                    //             errorBuilder: (context, error, stackTrace) {
                    //               return SizedBox.shrink();
                    //             },
                    //           )
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
