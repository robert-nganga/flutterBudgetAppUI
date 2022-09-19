import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;

  const BarChart({Key? key, required this.expenses}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        child: Column(
          children: <Widget>[
            const Text(
              'Weekly Spending',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 25.0,
                  onPressed: () {},
                ),
                const Text(
                  'Nov 10, 2019 - Nov 16, 2019',
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  iconSize: 25.0,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Bar(
                  label: 'Su',
                  amountSpent: expenses[0],
                  mostExpensive: mostExpensive,
                ),
                Bar(
                  label: 'Mo',
                  amountSpent: expenses[1],
                  mostExpensive: mostExpensive,
                ),
                Bar(
                  label: 'Tu',
                  amountSpent: expenses[2],
                  mostExpensive: mostExpensive,
                ),
                Bar(
                  label: 'We',
                  amountSpent: expenses[3],
                  mostExpensive: mostExpensive,
                ),
                Bar(
                  label: 'Th',
                  amountSpent: expenses[4],
                  mostExpensive: mostExpensive,
                ),
                Bar(
                  label: 'Fr',
                  amountSpent: expenses[5],
                  mostExpensive: mostExpensive,
                ),
                Bar(
                  label: 'Sa',
                  amountSpent: expenses[6],
                  mostExpensive: mostExpensive,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 150.0;
  const Bar({Key? key, required this.label, required this.amountSpent, required this.mostExpensive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: <Widget>[
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6.0),
        Container(
          height: barHeight,
          width: 18.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

