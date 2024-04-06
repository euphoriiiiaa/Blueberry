import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreditCartReg extends StatefulWidget {
  const CreditCartReg({
    super.key,
  });

  @override
  State<CreditCartReg> createState() => _CreditCartRegState();
}

TextEditingController numberCardController = TextEditingController();
TextEditingController dateController = TextEditingController();
TextEditingController cvvController = TextEditingController();
bool cardValid = false;

class _CreditCartRegState extends State<CreditCartReg> {

  void checkInfoForCard() {
    if (((numberCardController.text.isEmpty &&
                numberCardController.text.length != 16) &&
            dateController.text.isEmpty &&
            cvvController.text.isEmpty) ||
        ((numberCardController.text.isEmpty ||
                numberCardController.text.length != 16) ||
            dateController.text.isEmpty ||
            cvvController.text.isEmpty)) {
      setState(() {
        cardValid = false;
      });
    } else {
      setState(() {
        cardValid = true;
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            errorText: numberCardController.text.isEmpty
                                ? "Данное поле обязательно для заполнения"
                                : null,
                            errorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            icon: const Icon(
                              Icons.add_card_rounded,
                              color: Color(0xff41337A),
                            ),
                            hintText: 'Номер банковской карты',
                          ),
                          controller: numberCardController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  errorText: dateController.text.isEmpty
                                      ? "Данное поле обязательно для заполнения"
                                      : null,
                                  errorBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  icon: const Icon(
                                    Icons.date_range,
                                    color: Color(0xff41337A),
                                  ),
                                  hintText: 'Срок действия',
                                ),
                                controller: dateController,
                                keyboardType: TextInputType.datetime,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(5),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  errorText: cvvController.text.isEmpty
                                      ? "Данное поле обязательно для заполнения"
                                      : null,
                                  errorBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  icon: const Icon(
                                    Icons.password,
                                    color: Color(0xff41337A),
                                  ),
                                  hintText: 'CVV-код',
                                ),
                                controller: cvvController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(3),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: checkInfoForCard,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xff41337A),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Подтвердить',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
              );
            });
      },
      child: Container(
        alignment: Alignment.center,
        width: 250,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            const Text(
              'Привязать банковскую карту',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              cardValid ? "ПРИВЯЗАНА" : "НЕ ПРИВЯЗАНА",
              style: TextStyle(
                  color: cardValid
                      ? Colors.green.withOpacity(0.5)
                      : Colors.red.withOpacity(0.5),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}