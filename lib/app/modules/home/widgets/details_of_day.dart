import 'package:flutter/material.dart';
import 'package:restaurant_app/app/modules/home/widgets/details_of_days_widgets/details_card.dart';
import 'package:restaurant_app/app/utils/restaurant_colors.dart';

import '../../models/confirmed_food_current_user.dart';
import '../../models/food.dart';

class DetailsOfDay extends StatefulWidget {
  final Food? food;
  final ConfirmedFoodCurrentUser? confirmationFood;
  const DetailsOfDay({
    Key? key,
    required this.food,
    this.confirmationFood,
  }) : super(key: key);

  @override
  _DetailsOfDayState createState() => _DetailsOfDayState();
}

class _DetailsOfDayState extends State<DetailsOfDay> {
  ValueNotifier<int> personsNumber = ValueNotifier(1);
  ValueNotifier<bool> confirm = ValueNotifier(false);

  fillItens() {
    for (var element in widget.confirmationFood!.confirmations!) {
      if (element!.foodId == widget.food!.foodDetailsClass!.id) {
        personsNumber.value = element.foodMembers!;
        confirm.value = true;
      }
    }
  }

  @override
  void initState() {
    fillItens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroud,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              DetailsDayCard(
                food: widget.food,
              ),
              Text(
                widget.food!.foodDetailsClass!.title!,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: size.width / 1.2,
                child: Card(
                  elevation: 1,
                  color: AppColors.backgroud,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(width: 1, color: Colors.grey.shade400)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.food!.foodDetailsClass!.description!),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  const Text('Número de Pessoas',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(
                    '(com mais de 4 anos)',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (personsNumber.value > 1 && !confirm.value) {
                              personsNumber.value--;
                            }
                          },
                          icon: const Icon(Icons.remove)),
                      ValueListenableBuilder(
                          valueListenable: personsNumber,
                          builder: (context, int value, child) =>
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.person_outline_rounded,
                                  size: 40,
                                ),
                                label: Text(
                                  value.toString(),
                                  style: const TextStyle(fontSize: 30),
                                ),
                              )),
                      IconButton(
                          onPressed: () {
                            if (!confirm.value) {
                              personsNumber.value++;
                            }
                          },
                          icon: const Icon(Icons.add))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ValueListenableBuilder(
                    valueListenable: confirm,
                    builder: (context, bool value, child) {
                      if (value) {
                        return Column(
                          children: [
                            const Text(
                              'Almoço Confirmado Clique para Editar',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primarySwatch),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                confirm.value = !value;
                              },
                              icon: const Icon(Icons.edit),
                              label: const Text('Editar'),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.green.shade600)),
                            ),
                          ],
                        );
                      }
                      return ElevatedButton.icon(
                        onPressed: () {
                          confirm.value = !value;
                        },
                        icon: const Icon(Icons.check),
                        label: const Text('Confirmar'),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
