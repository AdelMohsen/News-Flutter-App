import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:news/layout/cubit/Cubit.dart';
import 'package:news/layout/cubit/State.dart';
import 'package:news/reuseable_components/CustomText.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        List? business = NewsCubit.get(context).business;
        return Conditional.single(
          context: context,
          conditionBuilder: (context) => business!.length != 0,
          widgetBuilder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  listBuilder(business![index], context: context),
              separatorBuilder: (context, index) => customDivider(),
              itemCount: business!.length),
          fallbackBuilder: (context) =>
              Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
