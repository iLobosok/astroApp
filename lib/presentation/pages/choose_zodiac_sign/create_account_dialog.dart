import 'package:astro/presentation/pages/choose_profile/choose_profile_page.dart';
import 'package:astro/presentation/providers/get_prefs_provider.dart';
import 'package:astro/utils/enums/horoscope_signs.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class CustomDialogWidget extends StatefulWidget {
  final ZodiacSigns zodiacSign;

  const CustomDialogWidget({super.key, required this.zodiacSign});

  @override
  State<CustomDialogWidget> createState() => _CustomDialogWidgetState();
}

final rxPrefs = RxSharedPreferences.getInstance();

String calculateAge(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  if (currentDate.month < birthDate.month ||
      (currentDate.month == birthDate.month &&
          currentDate.day < birthDate.day)) {
    age--;
  }
  return age.toString();
}

class _CustomDialogWidgetState extends State<CustomDialogWidget> {
  late TextEditingController _nameText;
  late TextEditingController _birthDayText;
  late TextEditingController _locationBirthText;
  String userage = '';
  @override
  void initState() {
    super.initState();
    _nameText = TextEditingController();
    _birthDayText = TextEditingController();
    _locationBirthText = TextEditingController();
  }

  @override
  void dispose() {
    _nameText.dispose();
    _birthDayText.dispose();
    _locationBirthText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);
    return Stack(
      children: [
        const ChooseProfilePage(),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          left: 30.0,
          right: 30.0,
          child: Container(
            height: MediaQuery.of(context).size.height * .5,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: Card(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFD69CFF),
                      Color(0xFFB78AF6),
                      Color(0xFF685BDE)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Create your new profile',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * .6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: const Color(0xFF2A2731),
                        border: Border.all(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, top: 10),
                          child: TextField(
                            cursorColor: Colors.white,
                            controller: _nameText,
                            style: const TextStyle(color: Colors.white),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[a-zA-Z]')),
                            ],
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Name",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(147, 178, 177, 177)),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * .6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: const Color(0xFF2A2731),
                        border: Border.all(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, top: 10),
                          child: TextField(
                            cursorColor: Colors.white,
                            controller: _birthDayText,
                            readOnly: true,
                            style: const TextStyle(color: Colors.white),
                            onTap: () async {
                              final DateTime? dateOfBirth =
                                  await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1910),
                                lastDate: DateTime.now(),
                              );
                              print(dateOfBirth.toString());
                              if (dateOfBirth != null) {
                                setState(() {
                                  final formattedDate = DateFormat.yMd()
                                      .format(dateOfBirth)
                                      .toString();

                                  userage = calculateAge(dateOfBirth);
                                  print(userage);
                                  _birthDayText.text = formattedDate;
                                });
                              }
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Date of birth",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(147, 178, 177, 177)),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * .6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: const Color(0xFF2A2731),
                        border: Border.all(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, top: 10),
                          child: TextFormField(
                            readOnly: true,
                            cursorColor: Colors.white,
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                onSelect: (Country country) {
                                  print(
                                      'Select country: ${country.displayName}');
                                  setState(() {
                                    _locationBirthText.text =
                                        country.name.toString();
                                  });
                                },
                              );
                            },
                            controller: _locationBirthText,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Your country",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(147, 178, 177, 177)),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () async {
                        final bool isPro =
                            await subscriptionProvider.checkSubscription();
                        final int countOfProfiles =
                            await subscriptionProvider.getUserAccount();

                        if (isPro == true) {
                        } else {
                          if (countOfProfiles != 1) {
                            List<String> userData = [
                              '${_nameText.text},${_birthDayText.text},${_locationBirthText.text},${widget.zodiacSign.name},$userage',
                            ];
                            await rxPrefs.setStringList('userData', userData);
                            await rxPrefs.setInt('countOfUserAccounts', 1);

                            Navigator.of(context).pushReplacementNamed("/");
                          } else {
                            // show subscription dialog
                          }
                        }
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * .65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF685BDE),
                              Color.fromARGB(255, 92, 65, 129),
                              Color.fromARGB(255, 137, 89, 172),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
