import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:news/layout/cubit/Cubit.dart';
import 'package:news/layout/cubit/State.dart';
import 'package:news/reuseable_components/CustomText.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 20.0, top: 5.0),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                ),
              ),
              Expanded(
                child: Conditional.single(
                  context: context,
                  conditionBuilder: (context) =>
                      state != GetLoadingSearchData(),
                  widgetBuilder: (context) => ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          listBuilder(list![index], context: context),
                      separatorBuilder: (context, index) => customDivider(),
                      itemCount: list!.length),
                  fallbackBuilder: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
