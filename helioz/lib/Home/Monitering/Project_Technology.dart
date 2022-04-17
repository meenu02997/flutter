
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:helioz/Auth/Registration/Widget/text_style.dart';
import 'package:helioz/Home/Pre_registration/Data/pre_reg_data.dart';
// ignore: unused_import
import 'package:helioz/common/Drawer/widgets/drawer.dart';

class ProjectTechnology  extends StatefulWidget {
  const ProjectTechnology ({ Key? key }) : super(key: key);

  @override
  _ProjectTechnologyState  createState() => _ProjectTechnologyState();
}

class _ProjectTechnologyState extends State<ProjectTechnology > {
  String? genderItem = "";
  String? waterTreatmentRadioDry = "";
  String? waterTreatmentRadioRainy = "";

  String? mainFuelSourceValue;
  String? mainWaterSourceDryValue;
  String? mainWaterSourceRainyValue;
  String? treatmentWaterSourceRainyValue;
  String? treatmentWaterSourceDryValue;

  get mainFuelSource => null;

  get waterSourceDry => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          const Icon(Icons.share),
          SizedBox(
            width: 7.w,
          ),
        ],
      ),
      drawer: const Drawer(),
      body: ListView(
        children: [
          Center(
            child: Text(
              "Project Technology",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Condition of Project Technology:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              // validator: validateEmail(TexEd),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // labelText: 'Full Name',
                hintText: 'Condition of Project Technology',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Condition of Project Technology';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Project Technology in use during visit::",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          SizedBox(
            height: 5.h,
            // margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: RadioListTile(
                    groupValue: genderItem,
                    title: const Text('Yes'),
                    value: 'Yes',
                    onChanged: (val) {
                      setState(() {
                        genderItem = val as String;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    groupValue: genderItem,
                    title: const Text('No'),
                    value: 'No',
                    onChanged: (val) {
                      setState(() {
                        genderItem = val as String;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Demonstration of Technology Use.Were steps properly followed/explained by primary technology user:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              // validator: validateEmail(TexEd),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // labelText: 'Full Name',
                hintText: 'Select Demonstration of Technology',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Select Demonstration of Technology';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Average number of technology is used per week:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              // validator: validateEmail(TexEd),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // labelText: 'Full Name',
                hintText:
                    'Select Average number of technology is used per week',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Select Average number of technology is used per week';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "IF lower than 5 Reason for not daily use:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: const Text(
                    "Select Average number of technology is used per week"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
                items: mainFuelSource.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: mainFuelSourceValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      mainFuelSourceValue = valueSelected as String?;

                      // debugPrint('User selected $mainFuelSourceValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Average number of technology is used per week';
                  }

                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Type of treatment method:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: const Text("Select Type of treatment method"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
                items: waterSourceDry.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: mainWaterSourceDryValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      mainWaterSourceDryValue = valueSelected as String?;

                      // debugPrint('User selected $CountryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Select Type of treatment method';
                  }

                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Average liters of water treated with project technology per day:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Average liters of water treated with project technology per day:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              // validator: validateEmail(TexEd),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // labelText: 'Full Name',
                hintText:
                    'Select Average liters of water treated with project technology per day',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Select Average liters of water treated with project technology per day';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Average liters of water  Per Person per day::",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              // validator: validateEmail(TexEd),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // labelText: 'Full Name',
                hintText: 'Select Average liters of water Per Person per day:',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Select Average liters of water Per Person per day';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Do you Boil drinking water in addition to use of the Project",
              style: heading,
            ),
          ),
          SizedBox(
            height: 5.h,
            // margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: RadioListTile(
                    groupValue: waterTreatmentRadioDry,
                    title: const Text('Yes'),
                    value: 'Yes',
                    onChanged: (val) {
                      setState(() {
                        waterTreatmentRadioDry = val as String;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    groupValue: waterTreatmentRadioDry,
                    title: const Text('No'),
                    value: 'No',
                    onChanged: (val) {
                      setState(() {
                        waterTreatmentRadioDry = val as String;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Availability of safe drinking water:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: const Text("Select Availability of safe drinking water"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
                items: waterTreatmentDry.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: treatmentWaterSourceDryValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      treatmentWaterSourceDryValue = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Select Availability of safe drinking water ';
                  }

                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Reduction of waterborne diseases:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: const Text("Select Reduction of waterborne diseases"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
                items: waterTreatmentDry.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: treatmentWaterSourceDryValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      treatmentWaterSourceDryValue = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Reduction of waterborne diseases ';
                  }

                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Reduction of sick day:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: const Text("Select Reduction of sick day"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
                items: waterTreatmentDry.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: treatmentWaterSourceDryValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      treatmentWaterSourceDryValue = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Reduction of sick day ';
                  }

                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Reduction of medical costs:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: const Text("Select Reduction of medical costs"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
                items: waterTreatmentDry.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: treatmentWaterSourceDryValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      treatmentWaterSourceDryValue = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Reduction of medical costs ';
                  }

                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Reduction of boiling drinking water:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: const Text("Select Reduction of boiling drinking water"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
                items: waterTreatmentDry.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: treatmentWaterSourceDryValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      treatmentWaterSourceDryValue = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Reduction of boiling drinking water ';
                  }

                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Reduction of boiling firewood usage:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: const Text("Select Reduction of boiling firewood usage"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
                items: waterTreatmentDry.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: treatmentWaterSourceDryValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      treatmentWaterSourceDryValue = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Reduction of boiling firewood usage ';
                  }

                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Reduction of time spent on collecting firewood:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: const Text(
                    "Select Reduction of time spent on collecting firewood"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
                items: waterTreatmentDry.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: treatmentWaterSourceDryValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      treatmentWaterSourceDryValue = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Reduction of time spent on collecting firewood';
                  }

                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Do you store water treated with the project technology?:",
              style: heading,
            ),
          ),
          SizedBox(
            height: 5.h,
            // margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: RadioListTile(
                    groupValue: waterTreatmentRadioRainy,
                    title: const Text('Yes'),
                    value: 'Yes',
                    onChanged: (val) {
                      setState(() {
                        waterTreatmentRadioRainy = val as String;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    groupValue: waterTreatmentRadioRainy,
                    title: const Text('No'),
                    value: 'No',
                    onChanged: (val) {
                      setState(() {
                        waterTreatmentRadioRainy = val as String;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "How long do you store the trated water?",
              //"How long do you think that drinking untreated water is bad for your heath?",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: const Text(
                    "Select How long do you store the trated water?"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
                items: waterTreatmentDry.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: treatmentWaterSourceDryValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      treatmentWaterSourceDryValue = valueSelected as String?;

                      // debugPrint('User selected $treatmentWaterSourceDryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select How long do you store the trated water?';
                  }

                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "How long do you think that drinking untreated water is bad for your heath?",
              style: heading,
            ),
          ),
          SizedBox(
            height: 5.h,
            // margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: RadioListTile(
                    groupValue: waterTreatmentRadioRainy,
                    title: const Text('Yes'),
                    value: 'Yes',
                    onChanged: (val) {
                      setState(() {
                        waterTreatmentRadioRainy = val as String;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    groupValue: waterTreatmentRadioRainy,
                    title: const Text('No'),
                    value: 'No',
                    onChanged: (val) {
                      setState(() {
                        waterTreatmentRadioRainy = val as String;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Do you like the Project Technology?",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                focusColor: Colors.white,
                hint: const Text("1to5"),
                isExpanded: true,
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down)),
                items: waterTreatmentRainy.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                value: treatmentWaterSourceRainyValue,
                onChanged: (valueSelected) {
                  setState(
                    () {
                      treatmentWaterSourceRainyValue = valueSelected as String?;

                      // debugPrint('User selected $CountryValue');
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return '1to5';
                  }

                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Do you like the Project Activities:",
              style: heading,
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Container(
            height: 7.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              // validator: validateEmail(TexEd),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // labelText: 'Full Name',
                hintText: '1to5',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return '1to5';
                }
                return null;
              },
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: 20, top: 20),
              height: 6.h,
              width: 15.h,
              // alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.black12,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: const Center(child: Text("Submit")),
            ),
          ),
          SizedBox(
            height: 2.h,
          )
        ],
      ),
    );
  }
}
