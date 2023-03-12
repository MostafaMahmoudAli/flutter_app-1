import 'package:flutter/material.dart';
import 'package:flutter_application_1/lay%20out/newsapp/newscubit/cubit.dart';
import 'package:flutter_application_1/lay%20out/newsapp/newscubit/states.dart';
import 'package:flutter_application_1/shared/components/component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {

  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){},
      builder:(context,state)
      {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body:Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defultFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  validator:(String?value)
                  {
                    if(value!.isEmpty)
                    {
                      return "value must not be empty";
                    }
                    return null;
                  },
                  onChanged: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  prefix: Icons.search,
                  text: "Search",
                ),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context,index)=>buildArticleItem(list[index], context),
                    separatorBuilder: (context,index)=>myDivider(),
                    itemCount: list.length,
                ),
              ),
            ],
          ),
        ) ;
      },

    );
  }
}
