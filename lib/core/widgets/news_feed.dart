import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Sheet(
      child: Column(
        children: [
          const SizedBox(height: 16),
          Container(
            width: 100,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.grey,
            ),
          ),
          const Text(
            'News Feed',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
