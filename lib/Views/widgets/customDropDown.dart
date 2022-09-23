import 'package:concard/Constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
 const CustomDropDownButton(
      {Key? key,
      required this.hint,
      required this.listItems,
      required this.onChanged,
      required this.selectedValue})
      : super(key: key);
  final String? hint;
  final List<String> listItems;
  final String? selectedValue;
  final Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: primarygreen,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
          ),
          child: DropdownButtonHideUnderline(
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: primarygreen,
              ),
              child: DropdownButton(
               
                // decoration:
                //     InputDecoration.collapsed(
                //         hintText: ''),
                // validator: (value) {
                //   if (value == null) {
                //     setState(() {
                //       dropDownValidator = true;
                //     });
                //   }
                // },
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 25,
                ),
                value: selectedValue,
                hint: Text(
                  hint!,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                onChanged: onChanged,

                items: listItems.map((String? item) {
                  return DropdownMenuItem<String>(
                    value: listItems.indexOf(item!).toString(),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: Row(
                        children: [
                          // Icon(
                          //   statusImage,
                          //   color: statusColor,
                          //   size: 15,
                          // ),
                          // SizedBox(width: 10,),
                          Text(
                            item.trim(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
