import 'package:flutter/material.dart';

class InSearchResults {
  Widget buildTodaysResults(
      Color backGroundColor, String value, String key, BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.only(right: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            key,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
