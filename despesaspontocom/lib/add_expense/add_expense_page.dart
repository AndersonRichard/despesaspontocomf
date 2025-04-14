import 'package:flutter/material.dart';
import 'package:despesaspontocom/commom/app_colors.dart';
import 'package:despesaspontocom/commom/app_text_styles.dart';
import 'package:despesaspontocom/components/gradient_background.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  _AddExpensePageState createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Adicionar Despesa',
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ),
        backgroundColor: AppColors.darkBlue,
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
      ),
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Campo de descrição
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Descrição',
                  labelStyle: AppTextStyles.mediumText18.copyWith(color: AppColors.whiteColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.whiteColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.whiteColor),
                  ),
                ),
                style: AppTextStyles.mediumText18.copyWith(color: AppColors.whiteColor),
              ),
              const SizedBox(height: 16),

              // Campo de valor
              TextField(
                controller: _valueController,
                decoration: InputDecoration(
                  labelText: 'Valor',
                  labelStyle: AppTextStyles.mediumText18.copyWith(color: AppColors.whiteColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.whiteColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.whiteColor),
                  ),
                ),
                keyboardType: TextInputType.number,
                style: AppTextStyles.mediumText18.copyWith(color: AppColors.whiteColor),
              ),
              const SizedBox(height: 16),

              // Campo de data de vencimento
              TextField(
                controller: _dueDateController,
                decoration: InputDecoration(
                  labelText: 'Data de Vencimento',
                  labelStyle: AppTextStyles.mediumText18.copyWith(color: AppColors.whiteColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.whiteColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.whiteColor),
                  ),
                ),
                readOnly: true, // Impede a edição manual
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    _dueDateController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  }
                },
                style: AppTextStyles.mediumText18.copyWith(color: AppColors.whiteColor),
              ),
              const SizedBox(height: 24),

              // Botão para adicionar despesa
              ElevatedButton(
                onPressed: () {
                  final String description = _descriptionController.text.trim();
                  final String valueText = _valueController.text.trim();
                  final String dueDate = _dueDateController.text.trim();

                  // Validação dos campos
                  if (description.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, insira uma descrição.'),
                      ),
                    );
                    return;
                  }

                  if (valueText.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, insira um valor.'),
                      ),
                    );
                    return;
                  }

                  final double? value = double.tryParse(valueText);
                  if (value == null || value <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, insira um valor válido.'),
                      ),
                    );
                    return;
                  }

                  if (dueDate.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, selecione uma data de vencimento.'),
                      ),
                    );
                    return;
                  }

                  // Se todos os campos estiverem válidos, retorna os dados
                  Navigator.pop(context, {
                    'description': description,
                    'value': value,
                    'dueDate': dueDate,
                  });
                },
                child: const Text('Adicionar Despesa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}