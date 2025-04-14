import 'package:despesaspontocom/add_expense/add_expense_page.dart';
import 'package:despesaspontocom/components/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:despesaspontocom/home/home_body.dart';
import 'package:despesaspontocom/home/home_drawer.dart';
import 'package:despesaspontocom/common/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> expenses = [];
  double accountBalance = 5000.0; // Saldo inicial da conta

  // Função para adicionar uma nova despesa
  void _addExpense(Map<String, dynamic> newExpense) {
    setState(() {
      expenses.add({...newExpense, 'isPaid': false}); // Adiciona o campo isPaid
    });
  }

  // Função para marcar uma despesa como paga
  void _markAsPaid(int index) {
    setState(() {
      expenses[index]['isPaid'] = true; // Marca a despesa como paga
      accountBalance -= expenses[index]['value']; // Subtrai o valor do saldo
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Despesas.com',
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ),
        backgroundColor: AppColors.darkBlue,
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
      ),
      drawer: const HomeDrawer(), 
      body: GradientBackground(
        child: HomeBody(
          expenses: expenses,
          onMarkAsPaid: _markAsPaid, 
          accountBalance: accountBalance,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newExpense = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddExpensePage(),
            ),
          );

          if (newExpense != null) {
            _addExpense(newExpense);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}