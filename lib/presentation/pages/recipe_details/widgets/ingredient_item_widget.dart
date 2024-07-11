import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class IngredientItemWidget extends StatelessWidget {
  final num quantity;
  final String measure;
  final String food;
  final String image;

  const IngredientItemWidget({
    Key? key,
    required this.quantity,
    required this.measure,
    required this.food,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.only(
              top: height * 0.008,
              bottom: height * 0.008,
              left: height * 0.008,
              right: width * 0.08),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: image,
                  width: width * 0.2,
                  height: height * 0.1,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.local_dining,
                    size: width * 0.2,
                  ),
                ),
              ),
              Text(
                "$food\n$quantity $measure",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              SizedBox(
                width: width * 0.033,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
