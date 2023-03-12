import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../lay out/newsapp/newscubit/cubit.dart';
import '../../lay out/newsapp/newscubit/states.dart';
import '../../shared/components/component.dart';

class Science_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var list = NewsCubit.get(context).science;
        return  state is NewsGetScienceLoadingState?const Center(child:CircularProgressIndicator()) : ListView.separated(
          physics:const BouncingScrollPhysics(),
          itemBuilder: (context,index)=> buildArticleItem(list[index],context),
          separatorBuilder: (context,index)=>myDivider(),
          itemCount:list.length,
        );
      },
    );
  }
}