import 'package:flutter/material.dart';

class ImageHelper {
  static Image fromNetwork(String url) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (
        BuildContext context,
        Widget child,
        ImageChunkEvent loadingProgress,
      ) {
        if (loadingProgress == null) {
          return child;
        }

        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).primaryColor,
          ),
        );
      },
    );
  }
}
