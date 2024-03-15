import 'package:flutter/material.dart';
import 'package:my_nutri_app/presentation/screens/progress_circle.dart';
import 'package:my_nutri_app/utils/resources/app_colors.dart';

class CircleAndTexts extends StatelessWidget {
  const CircleAndTexts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Column(
              children: [
                Icon(
                  Icons.local_fire_department_sharp,
                  color: AppColors.nutriRed,
                  size: 32,
                ),
                Text('690',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -3)),
                Text('burn',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1,
                        color: Colors.grey)),
              ],
            ),
            SizedBox(
              width: 30,
            ),
            CustomCircularIndicator(
              caloriesBurned: 0.3, // 30% of the circle
              caloriesConsumed: 0.5, // 50% of the circle
              caloriesRemaining: 0.2, // 20% of the circle
            ),
            SizedBox(
              width: 30,
            ),
            const Column(
              children: [
                Icon(
                  Icons.food_bank_outlined,
                  color: AppColors.nutriGreen,
                  size: 32,
                ),
                Text('536',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -3)),
                Text('eaten',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1,
                        color: Colors.grey)),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 55),
          child: const Column(
            children: [
              Text('2181',style: TextStyle(fontSize:35,fontWeight: FontWeight.w600,letterSpacing: -3)),
              Text('Kcal Goal',style: TextStyle(fontSize:16,fontWeight: FontWeight.w500,letterSpacing: -1,color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }
}
