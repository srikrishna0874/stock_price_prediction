String apiBaseUrl = 'http://10.0.2.2:5000/';

String endPointForCompletePrediction = 'search';
String endPointForTodayResults = 'get_today_stock_results';
String endPointForTomorrowResults = 'get_tomorrow_stock_results';
String endPointForNextSevenDaysResults = 'get_seven_days_prediction';

String apiForCompletePrediction = apiBaseUrl + endPointForCompletePrediction;
String apiForTodayResults = apiBaseUrl + endPointForTodayResults;
String apiForTomorrowResults = apiBaseUrl + endPointForTomorrowResults;
String apiForNextSevenDays = apiBaseUrl + endPointForNextSevenDaysResults;
