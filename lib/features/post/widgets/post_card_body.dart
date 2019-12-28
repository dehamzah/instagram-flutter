import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/features/post/models/media.dart';

class PostCardBody extends StatelessWidget {
  final List<Media> medias;

  const PostCardBody({
    Key key,
    this.medias,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: PageView.builder(
        itemCount: medias.length,
        itemBuilder: (BuildContext context, int index) {
          if (medias[index].mediaType == MediaType.image) {
            return CachedNetworkImage(
              imageUrl: medias[index].mediaUrl,
              imageBuilder: (context, imageProvider) => Image(
                width: double.infinity,
                height: 300,
                image: imageProvider,
                fit: BoxFit.cover,
              ),
              placeholder: (context, url) => CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            );
          } else {
            // TODO: create video component
            return Container();
          }
        },
      ),
    );
  }
}
