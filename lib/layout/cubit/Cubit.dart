import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Network/dio_helper.dart';
import 'package:news/screens/business.dart';
import 'package:news/layout/cubit/State.dart';
import 'package:news/screens/science.dart';
import 'package:news/screens/Sports.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
  ];

  List<Widget> pages = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    if (currentIndex == 1) getSportsData();
    if (currentIndex == 2) getScienceData();
    emit(NewBottomNavState());
  }

  List<dynamic>? business = [];

  getBusinessData() {
    emit(GetLoadingBusinessData());
    DioHelper.getData(url: 'v2/top-headlines', quires: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '6e700acf29524964b0d35bec023bbd82'
    }).then((value) {
      business = value.data['articles'];
      emit(GetSuccessBusinessData());
    }).catchError((error) {
      print(error.toString());
      emit(GetErrorBusinessData(error.toString()));
    });
  }

  List<dynamic>? sports = [];

  getSportsData() {
    emit(GetLoadingSportsData());
    if (sports!.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', quires: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '6e700acf29524964b0d35bec023bbd82'
      }).then((value) {
        sports = value.data['articles'];
        emit(GetSuccessSportsData());
      }).catchError((error) {
        print(error.toString());
        emit(GetErrorSportsData(error.toString()));
      });
    } else {
      emit(GetSuccessSportsData());
    }
  }

  List<dynamic>? science = [];

  getScienceData() {
    emit(GetLoadingScienceData());
    if (science!.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', quires: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '6e700acf29524964b0d35bec023bbd82'
      }).then((value) {
        science = value.data['articles'];
        emit(GetSuccessScienceData());
      }).catchError((error) {
        print(error.toString());
        emit(GetErrorScienceData(error.toString()));
      });
    } else {
      emit(GetSuccessScienceData());
    }
  }

  List<dynamic>? search = [];

  void getSearch(String value) {
    emit(GetLoadingSearchData());
    search = [];
    if (search!.length == 0) {
      DioHelper.getData(url: 'v2/everything', quires: {
        'q': '$value',
        'apiKey': '6e700acf29524964b0d35bec023bbd82'
      }).then((value) =>
      {
        search = value.data['articles'],
        emit(GetSuccessSearchData())
      }).catchError((error)
      {
        print(error.toString());
        emit(GetErrorSearchData(error));
      });
    }
  }
}
