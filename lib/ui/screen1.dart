import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/news_bloc.dart';

import '../repositry/modelclass/Newsmodel.dart';

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

late Newsmodel news;

class _screen1State extends State<screen1> {
  @override
  void initState() {
    BlocProvider.of<Newsbloc>(context).add(FetchNews());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<Newsbloc, NewsState>(builder: (context, state) {
      if (state is NewsLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is NewsError) {
        return RefreshIndicator(
          onRefresh: () async {
            return BlocProvider.of<Newsbloc>(context).add(FetchNews());
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * .9,
                // color: Colors.red,
                child: const Center(child: Text('Oops something went wrong'))),
          ),
        );
      }
      if (state is NewsLoaded) {
        news = BlocProvider.of<Newsbloc>(context).newsmodel;

      return ListView.builder(
          itemCount: news.items!.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: 500,
                width:375,decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 2),color: Colors.black),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 200,
                        width: 120,
                        child: Image.network(news.items![index].images==null?'':
                          news.items![index].images!.thumbnail.toString(),
                          fit: BoxFit.fill,
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Container(width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Title:${news.items![index].title.toString()}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            Text(
                              "snippet:${news.items![index].snippet.toString()}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            Text(
                              "publisher:${news.items![index].publisher.toString()}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            Text(
                              "timestamp:${news.items![index].timestamp.toString()}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            Text(
                              "newsUrl:${news.items![index].newsUrl.toString()}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ));
          }
          );}else{return SizedBox();}
    }));
  }
}
