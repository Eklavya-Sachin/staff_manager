import 'package:flutter/material.dart';

class CircularProfileImage extends StatelessWidget {
  const CircularProfileImage({
    super.key,
    required this.imageUrl,
    this.imageSize = 60,
    this.personIconColor = Colors.lightBlue,
  });

  final String imageUrl;
  final double imageSize;
  final Color personIconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(120),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(120),
        child: Image.network(
          imageUrl,
          height: imageSize,
          width: imageSize,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (_, __, ___) => Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade100,
              ),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(1.5),
            child: Icon(
              Icons.person_sharp,
              size: imageSize - 5,
              color: personIconColor,
            ),
          ),
        ),
      ),
    );
  }
}
