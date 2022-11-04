import 'package:flutter/material.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import '../../Constants/Colors.dart';
import '../../../Controllers/compnayControllers/product_and_services_controller.dart';
import 'package:provider/provider.dart';

void addProductsAndServices(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setStateBuilder) {
        TextEditingController name = TextEditingController();
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          alignment: Alignment.center,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add Product or Services",
                style: TextStyle(
                  fontFamily: 'MBold',
                  fontSize: size.height * 0.015,
                  color: txtcolr,
                ),
              ),
            ],
          ),
          content: Container(
            height: size.height * 0.18,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  cursorColor: txtcolr,
                  controller: name,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: txtcolr),
                      ),
                      filled: true,
                      isDense: true,
                      hintStyle: TextStyle(color: Colors.grey, fontSize: size.width * 0.03),
                      hintText: "Add Product or Services",
                      fillColor: Colors.white70),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        child: Text(
                          "Add",
                          style: TextStyle(
                            color: txtcolr,
                          ),
                        ),
                        onPressed: () async {
                          await ProductAndServicesController().addProductAndServices(name: name.text);
                          var app = Provider.of<AppProvider>(context, listen: false);
                          await app.getProductAndServices();
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: txtcolr,
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
    },
  );
}
