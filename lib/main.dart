import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scaffold Example',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurant Menu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontFamily: 'Prata',
          ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          // Change image names, info and price to match your own
          buildFoodCard(
            context,
            'Spaghetti Aglio e Olio',
            'assets/aglio.jpg',
            'Spaghetti tossed with garlic, olive oil and chili flakes.',
            'RM 15.00',
          ),
          buildFoodCard(
            context,
            'Spaghetti Bolognese',
            'assets/bolognese.jpg',
            'Spaghetti served with tomato sauce and minced beef.',
            'RM 16.00',
          ),
          buildFoodCard(
            context,
            'Spaghetti Carbonara',
            'assets/carbonara.jpg',
            'Spaghetti with eggs, cheese, black pepper and pancetta.',
            'RM 15.50',
          ),
        ],
      ),
    );
  }

  Widget buildFoodCard(BuildContext context, String foodName, String image,
      String info, String price) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              foodName: foodName,
              image: image,
              info: info,
              price: price,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(image, width: 100, height: 100),
              SizedBox(width: 20),
              Text(
                foodName,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Prata',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String foodName;
  final String image;
  final String info;
  final String price;

  DetailPage({
    required this.foodName,
    required this.image,
    required this.info,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodName, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, width: 200, height: 200),
            SizedBox(height: 20),
            Text(
              foodName,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                info,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 10),
            Text('Price: $price', style: TextStyle(fontSize: 20.0)),
          ],
        ),
      ),
    );
  }
}
