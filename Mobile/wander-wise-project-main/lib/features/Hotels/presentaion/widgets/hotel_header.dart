import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/utils/assets.dart';

class HotelHeader extends StatelessWidget {
  final TextEditingController searchController;

  const HotelHeader({Key? key, required this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          child: Image.asset(
            ImagesPaths.home7,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 16,
          bottom: 16,
          child: Container(
            color: Colors.black.withOpacity(0.5),
            padding: const EdgeInsets.all(8),
            child: const Text(
              "Book Your Hotel Now To Enjoy a\nworry-Free Journey",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 16,
          right: 16,
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search for a hotel or country",
              fillColor: Colors.white.withOpacity(0.9),
              filled: true,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        searchController.clear();
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
