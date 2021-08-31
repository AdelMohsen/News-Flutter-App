import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:news/layout/cubit/Cubit.dart';
import 'package:news/layout/cubit/State.dart';
import 'package:news/reuseable_components/CustomText.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var science = NewsCubit.get(context).science;
        return Conditional.single(
          context: context,
          conditionBuilder: (context) => science!.length != 0,
          widgetBuilder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => listBuilder(
                    science![index],
                    context: context,
                  ),
              separatorBuilder: (context, index) => customDivider(),
              itemCount: science!.length),
          fallbackBuilder: (context) =>
              Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
