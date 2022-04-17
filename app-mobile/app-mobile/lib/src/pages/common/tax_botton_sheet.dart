import 'package:flutter/material.dart';
import 'package:ilunch/src/utils/app_colors.dart';
import 'package:ilunch/src/utils/styles.dart';


class TaxBottomSheet extends StatefulWidget {


  @override
  _TaxBottomSheetState createState() =>
      _TaxBottomSheetState();
}

class _TaxBottomSheetState extends State<TaxBottomSheet> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15, top: 10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Center(
                      child: Icon(
                        Icons.clear,
                        color: AppColors.greenColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0,top: 10),
            child: Text(
              'Détail de la TVA',
              style:
              tsBoldTextBlack18,
            ),
          ), Padding(
            padding: const EdgeInsets.only(left: 18.0,top: 10),
            child: Text(
              'TVA 10%   0,51€',
              style:
              tsMediumTextBlack50Primary14,
            ),
          ),Padding(
            padding: const EdgeInsets.only(left: 18.0,top: 5),
            child: Text(
              'Blabla lorem ipsum',
              style:
              tsMediumTextGrey12,
            ),
          ),Padding(
            padding: const EdgeInsets.only(left: 18.0,top: 20),
            child: Text(
              'TVA 20%   0,8€',
              style:
              tsMediumTextBlack50Primary14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0,top: 5),
            child: Text(
              'Couverts (jetables / réutilisables)',
              style:
              tsMediumTextGrey12,
            ),
          ),
        ],
      ),
    );
  }


}
