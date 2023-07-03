import 'package:flutter/material.dart';

class DataTableExampleApp extends StatelessWidget {
  const DataTableExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('DataTable Sample')),
        body:  DataTableExample(),
      ),
    );
  }
}

class DataTableExample extends StatelessWidget {
  const DataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Expanded(
                child: Text(
                  'Department',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Program',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Session',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Section',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Semester',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Subject - Code',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Marked on',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('blue')),
                DataCell(Text('7')),
                DataCell(Text('Java - CS-123')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('blue')),
                DataCell(Text('7')),
                DataCell(Text('Java - CS-123')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('red')),
                DataCell(Text('7')),
                DataCell(Text('Compiler Construction - CS-411')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('blue')),
                DataCell(Text('7')),
                DataCell(Text('Java - CS-123')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('blue')),
                DataCell(Text('7')),
                DataCell(Text('Java - CS-123')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('red')),
                DataCell(Text('7')),
                DataCell(Text('Compiler Construction - CS-411')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('blue')),
                DataCell(Text('7')),
                DataCell(Text('Java - CS-123')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('blue')),
                DataCell(Text('7')),
                DataCell(Text('Java - CS-123')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('red')),
                DataCell(Text('7')),
                DataCell(Text('Compiler Construction - CS-411')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('blue')),
                DataCell(Text('7')),
                DataCell(Text('Java - CS-123')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('blue')),
                DataCell(Text('7')),
                DataCell(Text('Java - CS-123')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('red')),
                DataCell(Text('7')),
                DataCell(Text('Compiler Construction - CS-411')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('blue')),
                DataCell(Text('7')),
                DataCell(Text('Java - CS-123')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('blue')),
                DataCell(Text('7')),
                DataCell(Text('Java - CS-123')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('red')),
                DataCell(Text('7')),
                DataCell(Text('Compiler Construction - CS-411')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('blue')),
                DataCell(Text('7')),
                DataCell(Text('Java - CS-123')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('blue')),
                DataCell(Text('7')),
                DataCell(Text('Java - CS-123')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Computer Science')),
                DataCell(Text('BSCS')),
                DataCell(Text('2K19')),
                DataCell(Text('red')),
                DataCell(Text('7')),
                DataCell(Text('Compiler Construction - CS-411')),
                DataCell(Text('July 3, 2023 5:00 AM')),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
