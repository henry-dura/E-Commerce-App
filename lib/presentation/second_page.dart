import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String tag;
  final String imageUrl;
  final String description;
  const SecondPage(
      {super.key,
      required this.tag,
      required this.imageUrl,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details'),),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children:[
          Container(
            width: 100, // Adjust width as needed
            height: 250, // Adjust height as needed
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Hero(
              tag: tag,
              child: CachedNetworkImage(
                imageUrl: imageUrl, // Replace with your image URL
                fit: BoxFit.fitHeight, // BoxFit to resize and crop the image as needed
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Buy now',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          )
        ]
      ),




    );
  }
}
