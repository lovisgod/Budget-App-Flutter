import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;
  BarChart(this.expenses);
  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            'Weekly Spending',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                iconSize: 30.0,
                onPressed: () {},
              ),
              Text(
                'Nov 10, 2020 - Nov 16, 2020',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                ),
                iconSize: 30.0,
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Bar(
                label: 'Sun',
                amountSpent: expenses[0],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Mon',
                amountSpent: expenses[1],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Tue',
                amountSpent: expenses[2],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Wed',
                amountSpent: expenses[3],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Thur',
                amountSpent: expenses[4],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Fri',
                amountSpent: expenses[5],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Sat',
                amountSpent: expenses[6],
                mostExpensive: mostExpensive,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double maxBarHeight = 150.0;
  Bar({this.label, this.amountSpent, this.mostExpensive});
  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * maxBarHeight;
    return Column(
      children: <Widget>[
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(
          height: 6.0,
        ),
        Container(
          height: barHeight,
          width: 10.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          '$label',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
