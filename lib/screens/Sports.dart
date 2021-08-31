import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:news/layout/cubit/Cubit.dart';
import 'package:news/layout/cubit/State.dart';
import 'package:news/reuseable_components/CustomText.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var sports = NewsCubit.get(context).sports;
        return Conditional.single(
          context: context,
          conditionBuilder: (context) => sports!.length != 0,
          widgetBuilder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  listBuilder(sports![index], context: context),
              separatorBuilder: (context, index) => customDivider(),
              itemCount: sports!.length),
          fallbackBuilder: (context) =>
              Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
