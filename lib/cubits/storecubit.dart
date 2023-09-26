import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/cubits/storastate.dart';
import 'package:storeapp/models/productmodel.dart';
import 'package:storeapp/services/get_all_product_service.dart';
class storeCubit extends Cubit<storestate> {
  storeCubit() : super(storeinitialstate());
  AllProductsService allproductsservice=AllProductsService();
 ProductModel? productmodel;
List<ProductModel> productlist=[];
List<ProductModel> productlist2=[];
  void getallproduct()async{
    emit(storeloadingstate());
   
try{
   productlist= await allproductsservice.getAllProducts() ;
   print(productlist);
 emit(storesucessstate());
}
on Exception catch(e){
  emit(storefailingstate());
}
    }
  }
