import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/lay%20out/newsapp/newscubit/cubit.dart';
import 'package:flutter_application_1/lay%20out/newsapp/newscubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/component.dart';

class Business_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var list = NewsCubit.get(context).business;
        return state is NewsGetBusinessLoadingState? const Center(child: CircularProgressIndicator()): ListView.separated(
          physics:const BouncingScrollPhysics(),
          itemBuilder: (context,index)=> buildArticleItem(list[index],context),
          separatorBuilder: (context,index)=>myDivider(),
          itemCount:list.length,
        );
      },
    );
  }
}
