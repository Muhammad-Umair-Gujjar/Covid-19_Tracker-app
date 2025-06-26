import 'package:flutter/material.dart';

class ReusableStatCard extends StatelessWidget {
  final List<Map<String, String>> stats;
  const ReusableStatCard({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.05,
      ),
      child: Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        elevation: 5,
        color: Color(0xFF1E1E2C),
        shadowColor: Colors.black54,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.03,
          ),
          child: Column(
            children: stats.map((stat) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.008),
                child: Column(
                  children: [Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        stat['title']!,
                        // style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        //   color: Colors.grey[300],
                        //   fontWeight: FontWeight.w500,
                        //   fontSize: screenWidth * 0.042,
                        // ),
                      ),
                      Text(
                        stat['value']!,
                        // style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        //   color: Colors.white,
                        //   fontWeight: FontWeight.bold,
                        //   fontSize: screenWidth * 0.045,
                        // ),
                      ),
                    ],
                  ),

                    Divider(),
                  ]
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
