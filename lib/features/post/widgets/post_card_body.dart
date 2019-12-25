import 'package:flutter/cupertino.dart';
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
            return Image(
              width: double.infinity,
              height: 300,
              image: NetworkImage(medias[index].mediaUrl),
              fit: BoxFit.cover,
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
