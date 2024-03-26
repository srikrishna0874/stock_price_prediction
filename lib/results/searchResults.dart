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
                      color: Colors.black,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 5,
                    )
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

            ],
          ),
        ),
      ),
    );
  }
}
