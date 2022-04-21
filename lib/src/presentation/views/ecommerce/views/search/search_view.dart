import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: SizedBox(
          height: 45,
          child: TextField(
            autofocus: true,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 0,
              ),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search, color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              hintText: "Search e.g Sweatshirt",
              hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Opacity(
            opacity: .7,
            child: SizedBox(
              width: double.infinity,
              height: 250,
              child: Image(
                image: AssetImage("assets/ecommerce/images/search.png"),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Type to search ...",
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
