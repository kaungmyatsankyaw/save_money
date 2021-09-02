import 'package:app/controllers/transaction_controller.dart';
import 'package:app/data_model/financial_category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchSection extends StatelessWidget {
  final TransactionController controller = Get.find();
  final TextEditingController searchController = TextEditingController();

  final List<FinancialCategory> cate = [
    ...FinancialCategory.incomeCategoryList,
    ...FinancialCategory.outcomeCategoryList
  ];

  static String _displayStringForOption(FinancialCategory option) =>
      option.title;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment(0.35, 0.15),
        //     colors: <Color>[Colors.grey, Colors.black45],
        //     tileMode: TileMode.mirror,
        //   ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2.3,
              blurRadius: 3.3,
            ),
          ],
        ),
        height: 80,
        child: Form(
          key: Key('searchList'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Autocomplete<FinancialCategory>(
                  displayStringForOption: _displayStringForOption,
                  optionsBuilder: (TextEditingValue value) {
                    if (value.text.isEmpty) {
                      searchController.text = '';
                      return Iterable<FinancialCategory>.empty();
                    }
                    return cate.where((FinancialCategory option) {
                      return option.title
                          .toString()
                          .toLowerCase()
                          .contains(value.text.toLowerCase());
                    });
                  },
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController searchController,
                      FocusNode fieldFocusNode,
                      VoidCallback onFieldSubmitted) {
                    return TextField(
                      decoration: InputDecoration(
                           hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
                          hintText: 'Search Record By Category'),
                      controller: searchController,
                      focusNode: fieldFocusNode,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black),
                    );
                  },
                  onSelected: (FinancialCategory cate) {
                    FocusScope.of(context).unfocus();
                    searchController.text = cate.id;
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 30,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    onPressed: () {
                      controller.searchString.value = searchController.text;
                    },
                    child: Text('Search'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
