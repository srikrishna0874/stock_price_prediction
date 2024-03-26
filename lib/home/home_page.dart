import 'package:flutter/material.dart';
import 'package:stock_price_prediction/backend/functions.dart';
import 'package:stock_price_prediction/results/searchResults.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();

  final tempResult = {
    "ticker": "AAPL",
    "LSTM_ERROR": 5.383476501435288,
    "LSTM_PREDICTION": 172.86448669433594,
    "ARIMA_ERROR": 2.2056145817978328,
    "ARIMA PREDICTION": 178.62143785040578,
    "LINEAR_REGRESSION_ERROR": 8.169035338400056,
    "LINEAR_REGRESSION_PREDICTION": 178.74316032416706,
    "NEXT_SEVEN_DAYS_RESULTS": [
      178.74316032416706,
      178.38248024448967,
      179.42654653680992,
      181.6665314598466,
      184.12481588661666,
      177.19604785904266,
      178.0597741115242
    ],
    "today_stock_results": {
      "today_open": 171.76,
      "today_close": 172.28,
      "today_high": 173.05,
      "today_low": 170.06,
      "today_vol": 71106600.0,
      "today_adj_close": 172.28
    },
    "PREDICTED_IMAGES": {
      "LSTM":
          "https://storage.googleapis.com/stock-price-prediction-74e2b.appspot.com/LSTM/24-03-2024/AAPL?Expires=1719909965&GoogleAccessId=firebase-adminsdk-7vgor%40stock-price-prediction-74e2b.iam.gserviceaccount.com&Signature=AL3xkk2WwmUwgwKtLTFCY%2FJThx8uDaccaXkcLIOJg0ZMN2qqXYgAvQksBcFkKIrez3k3e0nmHQsv%2FXJpjkQrMg26rpIHTglT2Dcdm1wlHPKYL5DdB9I5LI2wetfi9aihj22ie%2BcnZltHr24AT8tCkXOVgsKFNfGftcrnHCZIksMpjoi22LuIbJNqqXqKzTOjuGwh0ZW9%2BaWpPp8tPho8nwOJ3sc7ca1pIhVS%2Bb2u4PTZNVAS1wE0a7luP4HcEcwvfK58c486DfMQSDCfYlsJoY%2BVMM5ewNSSSSBeOQkAQeX41BGCarV9u5ntV23%2BchrtgqBAftp6Jl1KdmBgSfB%2Bvw%3D%3D",
      "ARIMA":
          "https://storage.googleapis.com/stock-price-prediction-74e2b.appspot.com/ARIMA/24-03-2024/AAPL?Expires=1719909965&GoogleAccessId=firebase-adminsdk-7vgor%40stock-price-prediction-74e2b.iam.gserviceaccount.com&Signature=iuXhUQJtVNVUolfPq1eno9LuHfjRuvHfekqGdQFKXm5rKjX%2FCX7yXt7gYLNH88j%2Fmly3rNnQCcA2g%2Bb8X5eCu5zbyffGRoX2RA6fgQ0mFdBeSvoPs1XZHbTcyDoczD49Oh7MroZfU0rrEBPx7OWeUBP51fLo05d88TkpVTT68ax1KKUgSqbu7133ZJTkTPofG66l0CO3WbmbGR4iQu6SiBhNFn%2F07G2NF%2BG44pEjEUaHNeiLUT7Pw3uFW%2FuPitDd5JcTbcpHPVEn1JEt3vEtUCKXl7sqvk6B7wXbQMDj6wQVjHPGdAq5zQ3g1N6nN35niXinQTEV%2F5vTqkadKVPS3w%3D%3D",
      "LINEAR REGRESSION":
          "https://storage.googleapis.com/stock-price-prediction-74e2b.appspot.com/LINEAR%20REGRESSION/24-03-2024/AAPL?Expires=1719909965&GoogleAccessId=firebase-adminsdk-7vgor%40stock-price-prediction-74e2b.iam.gserviceaccount.com&Signature=H8cTD3CgRoJLO0xuWwgPEi%2BqMM3I00ED7fAqGWmVg%2FoaUvoVOeiVd%2Bi9OpLBrsubn7k1SSCPOy%2FmNNRvbKTF%2BUOZeod6%2F7kNYoENBGGgG4voECXoLildKrwk3eHO3LBQWSQxZrk9JRwopttp5Yyfqyf1SowxDGkdahm%2BQcMxj0YaPd6D1V%2BDiPC%2BKIL89qO49w2tz%2FapN%2F7SZ%2Fz3%2BnbmPtZZI3uRkG14p%2BlLGzrTYJm6%2F9QEvASlES3HWXf3xKt0IhvY2xPGoBcE%2BteH5Af3bTwRdtTNoA7pr4shGPInA08XAEh9hSStiV%2Fy9m9FA6NRyqc8RV9F0hojUWg%2Bi60jpw%3D%3D",
      "TREND":
          "https://storage.googleapis.com/stock-price-prediction-74e2b.appspot.com/TRENDS/25-03-2024/AAPL?Expires=1720009221&GoogleAccessId=firebase-adminsdk-7vgor%40stock-price-prediction-74e2b.iam.gserviceaccount.com&Signature=XiV9U%2B58vy0dzRjpDQL9QpK2jglv6ZohZu%2B5yAY51pOWXF%2Fg28vIhccw648eXFUr849Fe1aDeGZNs%2Be61MSus56MmInkeSy6hJYTKwSzUX7ITVgopE2sgHAJWzGGFWIVJCJLZt8yLrky8tosyPLvkrLBFAmNSho%2BsNVphzB9RLv%2BrBTs%2FK3FhbSR8GnyP%2FzpQzi4pg8rkENS0onbiAX7iDdG4nP96MdM%2FJkQ1%2BTxRjHf2FWpuZH%2BjDFqUfZN8TMLuA4EawM3vjohGAbFnbBzZbMD%2FxcwNfxssbOByWvjlml1AXDznjBxCQnKnt1Ojq76OqGy87Kozy9Z%2FIOESEnU1Q%3D%3D"
    }
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {},
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFFBE9E7),
                  hintText: 'Enter name or ticker of stock',
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
                      requiredResult =
                          // await searchFunctionBackend(searchController.text);
                          tempResult;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchResultsPage(
                            searchResultMap: requiredResult,
                          ),
                        ),
                      );

                      print(requiredResult);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
