import 'package:flutter/material.dart';
import '../models/lugar.dart';
import '../widgets/app_drawer.dart';

class LugaresScreen extends StatefulWidget {
  const LugaresScreen({super.key});

  @override
  State<LugaresScreen> createState() => _LugaresScreenState();
}

class _LugaresScreenState extends State<LugaresScreen> {
  // Categorías que se pueden elegir en el selector
  final List<String> categorias = ["Playa", "Naturaleza", "Pueblo", "Mirador"];

  // Lista de lugares (empieza con algunos de ejemplo)
  final List<Lugar> lugares = [
    Lugar(
      nombre: "Playa de Papagayo",
      descripcion: "Aguas tranquilas y arena dorada.",
      categoria: "Playa",
    ),
    Lugar(
      nombre: "Parque Nacional del Teide",
      descripcion: "Paisaje volcánico y el pico más alto de España.",
      categoria: "Naturaleza",
    ),
    Lugar(
      nombre: "Garachico",
      descripcion: "Pueblo con encanto y piscinas naturales.",
      categoria: "Pueblo",
    ),
    Lugar(
      nombre: "Mirador de la Peña",
      descripcion: "Vistas increíbles al mar.",
      categoria: "Mirador",
    ),
  ];

  // Devuelve la imagen que corresponde a cada categoría
  String imagenDeCategoria(String categoria) {
    if (categoria == "Playa") return "assets/images/playa.png";
    if (categoria == "Naturaleza") return "assets/images/naturaleza.png";
    if (categoria == "Pueblo") return "assets/images/pueblo.png";
    return "assets/images/mirador.png";
  }

  // BORRAR: quita el lugar de la lista y redibuja la pantalla
  void borrarLugar(int index) {
    setState(() {
      lugares.removeAt(index);
    });
  }

  // AÑADIR: muestra el modal (Dialog) con el formulario
  void mostrarDialogoAnadir() {
    final nombreController = TextEditingController();
    final descripcionController = TextEditingController();
    String categoriaElegida = categorias[0];

    showDialog(
      context: context,
      builder: (context) {
        // StatefulBuilder hace que el selector se actualice dentro del diálogo
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text("Añadir lugar"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nombreController,
                      decoration: const InputDecoration(labelText: "Nombre"),
                    ),
                    TextField(
                      controller: descripcionController,
                      maxLength: 60,
                      decoration: const InputDecoration(
                        labelText: "Descripción breve",
                      ),
                    ),
                    DropdownButton<String>(
                      value: categoriaElegida,
                      isExpanded: true,
                      items: categorias
                          .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                          .toList(),
                      onChanged: (valor) {
                        setStateDialog(() {
                          categoriaElegida = valor!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Si el nombre está vacío, no se añade nada
                    if (nombreController.text.trim().isEmpty) return;

                    setState(() {
                      lugares.add(
                        Lugar(
                          nombre: nombreController.text.trim(),
                          descripcion: descripcionController.text.trim(),
                          categoria: categoriaElegida,
                        ),
                      );
                    });
                    Navigator.pop(context); // cierra el diálogo
                  },
                  child: const Text("Añadir"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lugares",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF99C7EE),
        foregroundColor: Colors.black,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.5),
          child: Divider(height: 1.5, thickness: 1.5, color: Colors.black),
        ),
      ),
      drawer: const AppDrawer(),

      // BOTÓN para añadir un lugar (abre el modal)
      floatingActionButton: FloatingActionButton.extended(
        onPressed: mostrarDialogoAnadir,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text("Añadir"),
      ),

      body: Column(
        children: [
          // MARCADOR con el número total de lugares
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: Colors.blue[50],
            child: Text(
              "Total de lugares: ${lugares.length}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // LISTA DINÁMICA
          Expanded(
            child: lugares.isEmpty
                ? const Center(child: Text("No hay lugares todavía"))
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 80),
                    itemCount: lugares.length,
                    itemBuilder: (context, index) {
                      final lugar = lugares[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: ListTile(
                          // IMAGEN según la categoría
                          leading: Image.asset(
                            imagenDeCategoria(lugar.categoria),
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            // Si falta la imagen, muestra un icono
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.image, size: 40);
                            },
                          ),
                          title: Text(
                            lugar.nombre,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("${lugar.descripcion}\n${lugar.categoria}"),
                          isThreeLine: true,
                          // BOTÓN de borrar
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => borrarLugar(index),
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