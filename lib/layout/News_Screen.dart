import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/Cubit.dart';
import 'package:news/layout/cubit/State.dart';
import 'package:news/main_cubit/main_cubit.dart';
import 'package:news/screens/search.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      NewsCubit()
        ..getBusinessData(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
                items: cubit.items,
              ),
              appBar: AppBar(
                title: Text('News App'),
                actions: [
                  IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 30.0,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.brightness_4,
                        size: 30.0,
                      ),
                      onPressed: () {
                        MainCubit.get(context).changeAppTheme();
                      })
                ],
              ),
              body: cubit.pages[cubit.currentIndex]);
        },
      ),
    );
  }
}
