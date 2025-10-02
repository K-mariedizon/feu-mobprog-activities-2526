import 'package:expense_app/expense/expense_list.dart';
import 'package:expense_app/expense/new_expense.dart';
import 'package:expense_app/gradient_container.dart';
import 'package:expense_app/model/expense.dart';
import 'package:expense_app/styled_text.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() {
    return _ExpenseScreenState();
  }
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final List<Expense> registeredExpenses = [
    Expense(
      title: 'Lunch sa Jollibee',
      amount: 300.49,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Team Building',
      amount: 1000.49,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Demon Slayer Movie',
      amount: 450.49,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void openExpenseModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(
        addExpense: addExpense,
        ),
    );
  }

  void addExpense(Expense expense) {
   setState(() {
     registeredExpenses.add(expense);
   });
  }

void removeExpense(Expense expense) {
  final expenseIndex = registeredExpenses.indexOf(expense);

  setState(() {
    registeredExpenses.remove(expense);
  });

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 3),
      content: Text('Expense Deleted'),
      action: SnackBarAction(
        label: 'Undo', 
        onPressed: () {
          setState(() {
            registeredExpenses.insert(expenseIndex, expense);
          });
        },
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text('No expenses found. Try adding one!'),
    );

    if (registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
              expenses: registeredExpenses, 
              removeExpense: removeExpense,
              );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 201, 235),
        title: StyledText('Expense Tracker', 35, const Color.fromARGB(255, 153, 2, 138)),
        actions: [
          IconButton(
            onPressed: openExpenseModal,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: GradientContainer(const Color(0xFFF79EDC), const Color.fromARGB(255, 162, 116, 236),
      Column(
        children: [
          StyledText('Chart Area', 20, const Color.fromARGB(255, 169, 17, 154)),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    ),
    );
  }
}
