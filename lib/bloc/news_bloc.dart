import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/repositry/modelclass/Newsmodel.dart';

import '../repositry/api/news-api.dart';

part 'news_event.dart';
part 'news_state.dart';

class Newsbloc extends Bloc<NewsEvent, NewsState> {
  late Newsmodel newsmodel;
  Newsapi newsaApi=Newsapi();
  Newsbloc() : super(NewsInitial()) {

    on<NewsEvent>((event, emit)async {
      emit(NewsLoading());
      try{

        newsmodel = await newsaApi.getnewsmodel();
        emit(NewsLoaded());
      } catch(e){
        print(e);
        emit(NewsError());}
    });

  }
}
