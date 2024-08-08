import 'package:flutter/material.dart';
import 'package:movie_search/domain/entity/genre/genre.dart';

class MovieTile extends StatefulWidget {
  final String title;
  final String overview;
  final String poster;
  final List<Genre>? genres;
  final double rating;

  const MovieTile({
    Key? key,
    required this.title,
    required this.overview,
    required this.poster,
    this.genres,
    required this.rating,
  }) : super(key: key);

  @override
  _MovieTileState createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600; // Define your breakpoint here

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with error handling
            widget.poster.isNotEmpty
                ? Expanded(
              flex: isWideScreen ? 1 : 2,
              child: GestureDetector(
                onTap: (){
                },
                child: Image.network(
                  widget.poster,
                  width: isWideScreen ? 150 : 100,
                  height: isWideScreen ? 225 : 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: isWideScreen ? 150 : 100,
                      height: isWideScreen ? 225 : 150,
                      color: Colors.grey,
                      child: Icon(Icons.error, color: Colors.red),
                    );
                  },
                ),
              ),
            )
                : Container(
              width: isWideScreen ? 150 : 100,
              height: isWideScreen ? 225 : 150,
              color: Colors.grey,
              child: Icon(Icons.image, color: Colors.white),
            ),
            SizedBox(width: 8.0),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.overview,
                    maxLines: isExpanded ? null : 3,
                    overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.0),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Text(
                      isExpanded ? 'See Less' : 'See More',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  if (widget.genres != null)
                    Text('Genres: ${widget.genres!.map((genre) => genre.name).join(', ')}'),
                  Text('Rating: ${widget.rating}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
