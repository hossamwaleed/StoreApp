import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/cubits/storastate.dart';
import 'package:storeapp/cubits/storecubit.dart';

import '../models/productmodel.dart';
import '../services/get_all_product_service.dart';
import '../widgets/customcart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'HomePAge';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => storeCubit()..getallproduct(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.cartPlus,
                  color: Colors.black,
                ))
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'New Trend',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
          child: BlocBuilder<storeCubit, storestate>(
            builder: (context, state) {
              if(state is storeloadingstate){
                return Center(child: CircularProgressIndicator());
              }
              else if(state is storesucessstate){
                return GridView.builder(
                    itemCount: BlocProvider.of<storeCubit>(context).productlist.length,
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100,
                    ),
                    itemBuilder: (context, index) {
                      return CustomCard(product: BlocProvider.of<storeCubit>(context).productlist[index]);
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
         
            
              
                
            /*    return GridView.builder(
                    itemCount: products.length,
                    clipBehavior: Clip.none,z
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100,
                    ),
                    itemBuilder: (context, index) {
                      return CustomCard(product: products[index]);
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );*/
              
            
          
              ),
      ),
    );
  }
}
