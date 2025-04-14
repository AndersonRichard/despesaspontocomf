import 'package:flutter/material.dart';
import 'package:despesaspontocom/common/app_colors.dart';
import 'package:despesaspontocom/common/app_text_styles.dart';

class HomeBody extends StatelessWidget {
  final List<Map<String, dynamic>> expenses;
  final Function(int) onMarkAsPaid;
  final double accountBalance;

  const HomeBody({
    super.key,
    required this.expenses,
    required this.onMarkAsPaid,
    required this.accountBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Saldo da conta
          Center(
            child: Column(
              children: [
                Text(
                  'Saldo da Conta',
                  style: AppTextStyles.mediumText18.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'R\$ $accountBalance',
                  style: AppTextStyles.bigText.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Saldo total a pagar
          Center(
            child: Column(
              children: [
                Text(
                  'Total a Pagar',
                  style: AppTextStyles.mediumText18.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'R\$ ${expenses.where((expense) => !expense['isPaid']).fold(0.0, (sum, expense) => sum + (expense['value'] as num))}',
                  style: AppTextStyles.bigText.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Próximas contas a pagar
          if (expenses.isNotEmpty)
            Text(
              'Próximas Contas a Pagar',
              style: AppTextStyles.mediumText18.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          const SizedBox(height: 8),
          if (expenses.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  final expense = expenses[index];
                  return GestureDetector(
                    onTap: () {
                      if (!expense['isPaid']) {
                        onMarkAsPaid(index); 
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: expense['isPaid']
                            ? AppColors.grayishBlue.withOpacity(0.5)
                            : AppColors.whiteColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        title: Text(
                          expense['description'],
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                decoration: expense['isPaid']
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                        ),
                        subtitle: Text(
                          'Vencimento: ${expense['dueDate']}',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                decoration: expense['isPaid']
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                        ),
                        trailing: AnimatedOpacity(
                          opacity: expense['isPaid'] ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}