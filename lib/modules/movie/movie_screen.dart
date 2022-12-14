import 'package:flutter/material.dart';

import '../../cubit/cubit.dart';
import '../../models/movies_model.dart';
import '../../models/search_model.dart';
import '../../shared/components/constants.dart';
class MovieScreen extends StatelessWidget {
  MovieScreen({Key? key, this.movie, this.searchMovie}) : super(key: key);
  Results? movie;
  SearchResults? searchMovie;
  List<String> categories = [];
  @override
  Widget build(BuildContext context) {
    if (movie != null) {
      for (var element in AppCubit.get(context).genresModel!.genres) {
        for (var movieElement in movie!.genreIds) {
          if (movieElement == element.id) {
            categories.add(element.name.toString());
          }
        }
      }
    } else {
      for (var element in AppCubit.get(context).genresModel!.genres) {
        for (var movieElement in searchMovie!.genreIds) {
          if (movieElement == element.id) {
            categories.add(element.name.toString());
          }
        }
      }
    }
    // print(categories);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie != null
              ? movie!.title.toString()
              : searchMovie!.title.toString(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          MediaQuery.of(context).size.height / 30.0,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 20.0,
                  child: Image(
                    image: NetworkImage(
                      movie != null
                          ? '$imageLink${movie!.backdropPath.toString()}'
                          : '$imageLink${searchMovie!.backdropPath.toString()}',
                    ),
                    width: double.infinity,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: const Color(0xb51c262f),
                  child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height / 100.0),
                    child: Column(
                      children: [
                        Text(
                          movie != null
                              ? movie!.originalTitle.toString()
                              : searchMovie!.originalTitle.toString(),
                          maxLines: 2,
                          style:
                          Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.grey[200],
                            height: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80.0,
                        ),
                        Text(
                          movie != null
                              ? movie!.releaseDate.toString()
                              : searchMovie!.releaseDate.toString(),
                          maxLines: 2,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.grey[300],
                            height: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80.0,
                        ),
                        Text(
                          categories
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', ''),
                          maxLines: 2,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.grey[300],
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: const Color(0xb51c262f),
                  child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height / 100.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: MediaQuery.of(context).size.height / 25.0,
                              ),
                              Text(
                                movie != null
                                    ? '${movie!.voteAverage.toString()}/10'
                                    : '${searchMovie!.voteAverage.toString()}/10',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                  color: Colors.grey[200],
                                  fontSize:
                                  MediaQuery.of(context).size.height /
                                      40.0,
                                ),
                              ),
                              Text(
                                movie != null
                                    ? '${movie!.voteCount.toString()} vote'
                                    : '${searchMovie!.voteCount.toString()} vote',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                  color: Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.white,
                          thickness: 2.0,
                          width: 10.0,
                          endIndent: 10.0,
                          indent: 10.0,
                        ),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width / 80.0,
                        // ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Language',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                  color: Colors.grey[200],
                                  fontSize:
                                  MediaQuery.of(context).size.height /
                                      40.0,
                                ),
                              ),
                              Text(
                                movie != null
                                    ? '${movie!.originalLanguage}'
                                    : '${searchMovie!.originalLanguage}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                  color: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.white,
                          thickness: 2.0,
                          width: 10.0,
                          endIndent: 10.0,
                          indent: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Popularity',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                  color: Colors.grey[200],
                                  fontSize:
                                  MediaQuery.of(context).size.height /
                                      40.0,
                                ),
                              ),
                              Text(
                                movie != null
                                    ? '${movie!.popularity}'
                                    : '${searchMovie!.popularity}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                  color: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: const Color(0xb51c262f),
                  child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height / 100.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Overview : ',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                            color: Colors.grey[200],
                            fontSize:
                            MediaQuery.of(context).size.height / 40.0,
                          ),
                        ),
                        Text(
                          movie != null
                              ? movie!.overview.toString()
                              : searchMovie!.overview.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                            color: Colors.grey[200],
                            fontSize:
                            MediaQuery.of(context).size.height / 45.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}