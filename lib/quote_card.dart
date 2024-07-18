import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final void Function()? delete; // Updated type to void Function()?

  QuoteCard({required this.quote, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Color.fromARGB(255, 231, 103, 124),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'IndieFlower',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              '- ${quote.author}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Caveat',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            IconButton(
              onPressed: delete,
              icon: Icon(Icons.delete, color: Colors.white, size: 20,),
            )
          ],
        ),
      ),
    );
  }
}
