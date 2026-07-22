import pandas as pd
from datetime import date, timedelta
import random

import unicodedata



random.seed(29)

IVA = 0.15
TOTAL_FACTURAS = 50
PRODUCTOS_POR_FACTURA = 4

# 50 facturas x 4 productos = 200 registros brutos

provincias = [
    "Pichincha", "Guayas", "Azuay", "Manabí", "Tungurahua",
    "Loja", "Imbabura", "El Oro", "Cotopaxi", "Chimborazo"
]

nombres = [
    "Juan", "María", "Carlos", "Ana", "Luis", "Andrea", "Pedro", "Camila",
    "José", "Daniela", "Miguel", "Sofía", "Jorge", "Valeria", "Diego",
    "Gabriela", "Ricardo", "Paula", "Mateo", "Diana", "Sebastián", "Lucía",
    "Andrés", "Natalia", "Fernando", "Carolina", "David", "Mónica",
    "Cristian", "Alejandra"
]

apellidos = [
    "Pérez", "López", "Andrade", "Torres", "Zambrano", "Salazar",
    "Mena", "Vera", "Cedeño", "Paredes", "Gómez", "Castro",
    "Morales", "Herrera", "Jiménez", "Guerrero", "Ortega", "Reyes",
    "Toapanta", "Núñez", "Flores", "Molina", "Ramos", "Vargas",
    "Sánchez", "Chávez", "Romero", "Cruz", "Espinoza", "Aguilar"
]

clientes = []

for i in range(30):
    clientes.append({
        "cedula_cliente": f"{17 + (i % 7):02d}{10000000 + i:08d}"[:10],
        "nombres_cliente": nombres[i],
        "apellidos_cliente": apellidos[i],
        "telefono_cliente": f"09{30000000 + i:08d}"[:10],
        "correo_cliente": f"{nombres[i].lower()}.{apellidos[i].lower()}@gmail.com",
        "provincia_cliente": provincias[i % len(provincias)],
        "fecha_nacimiento_cliente": date(1985 + (i % 18), (i % 12) + 1, (i % 27) + 1)
    })

empleados = [
    ("1710000001", "Carlos", "Mena", "Vendedor", "Vendedor", "0991000001"),
    ("1710000002", "Ana", "Torres", "Cajera", "Cajero", "0991000002"),
    ("1710000003", "Andrea", "Salazar", "Gerente Comercial", "Gerente", "0991000003"),
    ("1710000004", "Luis", "Vera", "Vendedor", "Vendedor", "0991000004"),
    ("1710000005", "Mateo", "Paredes", "Vendedor", "Vendedor", "0991000005"),
    ("1710000006", "Gabriela", "Guerrero", "Cajera", "Cajero", "0991000006"),
    ("1710000007", "Ricardo", "Castro", "Administrador", "Administrador", "0991000007"),
    ("1710000008", "Paula", "Reyes", "Auditor Interno", "Auditor", "0991000008"),
    ("1710000009", "Diego", "Herrera", "Encargado de Inventario", "Administrador", "0991000009"),
    ("1710000010", "Lucía", "Morales", "Vendedora", "Vendedor", "0991000010")
]

empleados = [
    {
        "cedula_empleado": e[0],
        "nombres_empleado": e[1],
        "apellidos_empleado": e[2],
        "cargo_empleado": e[3],
        "rol_empleado": e[4],
        "telefono_empleado": e[5],
        "correo_empleado": f"{e[1].lower()}.{e[2].lower()}@calzadotoapanta.com"
    }
    for e in empleados
]

proveedores = [
    ("Calzado Andino S.A.", "Ecuador", "Nacional", "022345001", "ventas@calzadoandino.com"),
    ("Importadora Oriental Shoes", "China", "Internacional", "022345002", "contacto@orientalshoes.com"),
    ("Cuero Ecuador Cía. Ltda.", "Ecuador", "Nacional", "022345003", "info@cueroecuador.com"),
    ("Distribuidora Guayaquil Shoes", "Ecuador", "Nacional", "022345004", "ventas@guayaquilshoes.com"),
    ("Seguridad Total Shoes", "Ecuador", "Nacional", "022345005", "contacto@seguridadtotal.com"),
    ("Moda Latina Calzado", "Colombia", "Internacional", "022345006", "ventas@modalatina.com"),
    ("Botas Sierra Norte", "Ecuador", "Nacional", "022345007", "info@botassierranorte.com"),
    ("SportStep Import", "Perú", "Internacional", "022345008", "contacto@sportstep.com"),
    ("Formal Shoes Premium", "Brasil", "Internacional", "022345009", "ventas@formalpremium.com"),
    ("Sandalias Costa Ecuador", "Ecuador", "Nacional", "022345010", "info@sandaliascosta.com")
]

proveedores = [
    {
        "nombre_proveedor": p[0],
        "pais_proveedor": p[1],
        "tipo_proveedor": p[2],
        "telefono_proveedor": p[3],
        "correo_proveedor": p[4]
    }
    for p in proveedores
]

productos = [
    ("Zapato escolar negro", "Nacional", "Escolar", "36", "Negro", 35.00, 0),
    ("Zapato escolar café", "Nacional", "Escolar", "37", "Café", 36.50, 0),
    ("Zapatilla deportiva blanca", "Importado", "Deportivo", "38", "Blanco", 48.50, 7),
    ("Zapatilla running azul", "Importado", "Deportivo", "40", "Azul", 55.00, 7),
    ("Sandalia casual mujer", "Nacional", "Sandalias", "36", "Beige", 28.00, 9),
    ("Sandalia playera hombre", "Nacional", "Sandalias", "41", "Negro", 25.00, 9),
    ("Zapato formal hombre", "Nacional", "Formal", "40", "Negro", 60.00, 2),
    ("Zapato formal mujer", "Importado", "Formal", "37", "Rojo", 62.00, 8),
    ("Botín cuero café", "Nacional", "Botas", "41", "Café", 75.00, 6),
    ("Bota industrial punta acero", "Nacional", "Industrial", "42", "Negro", 85.00, 4),
    ("Mocasín hombre", "Importado", "Formal", "40", "Azul", 58.00, 8),
    ("Tacón negro", "Importado", "Formal", "36", "Negro", 65.00, 5),
    ("Botín mujer beige", "Importado", "Botas", "37", "Beige", 72.00, 5),
    ("Zapato casual urbano", "Nacional", "Casual", "39", "Gris", 45.00, 3),
    ("Tenis juvenil rojo", "Importado", "Deportivo", "38", "Rojo", 50.00, 1),
    ("Zapato infantil luces", "Importado", "Infantil", "30", "Azul", 42.00, 1),
    ("Bota lluvia niño", "Nacional", "Infantil", "31", "Amarillo", 32.00, 6),
    ("Alpargata tradicional", "Nacional", "Casual", "39", "Blanco", 26.00, 3),
    ("Zapato ejecutivo cuero", "Nacional", "Formal", "42", "Café", 90.00, 2),
    ("Zapatilla training negra", "Importado", "Deportivo", "41", "Negro", 59.00, 7)
]

promociones = [
    ("Sin promoción", 0),
    ("Escolar 10%", 10),
    ("Black Friday 15%", 15),
    ("Cliente frecuente 8%", 8),
    ("Promoción deportiva 12%", 12),
    ("Liquidación 20%", 20),
    ("Cyber Monday 18%", 18),
    ("Descuento mayorista 10%", 10),
    ("Promoción sandalias 7%", 7),
    ("Temporada formal 5%", 5)
]

motivos_devolucion = [
    "Talla incorrecta",
    "Defecto de fábrica",
    "Cambio de color",
    "Producto equivocado",
    "No cumple expectativa"
]

tipos_queja = ["Reclamo", "Sugerencia", "Otro"]

descripciones_queja = [
    "El cliente solicita mejorar los tiempos de atención.",
    "El cliente indica demora en la entrega.",
    "El cliente solicita más variedad de tallas.",
    "El cliente reporta inconveniente con el producto.",
    "El cliente sugiere nuevas promociones."
]

registros = []
stock_actual = {}

for producto in productos:
    stock_actual[producto[0]] = 120

id_registro = 1
fecha_inicio = date(2026, 6, 1)

registros_con_devolucion = set(range(1, 21))
registros_con_queja = set(range(10, 21))

for i in range(TOTAL_FACTURAS):
    nro_factura = 1001 + i
    fecha_venta = fecha_inicio + timedelta(days=i % 30)

    cliente = clientes[i % len(clientes)]
    empleado = empleados[i % len(empleados)]
    promocion = promociones[i % len(promociones)]

    tipo_venta = "Mayorista" if i % 5 == 0 else "Minorista"

    inicio_producto = (i * PRODUCTOS_POR_FACTURA) % len(productos)
    productos_factura = [
        productos[(inicio_producto + j) % len(productos)]
        for j in range(PRODUCTOS_POR_FACTURA)
    ]

    for producto in productos_factura:
        nombre_producto = producto[0]
        tipo_producto = producto[1]
        categoria_producto = producto[2]
        talla = producto[3]
        color = producto[4]
        precio_unitario = producto[5]
        proveedor = proveedores[producto[6]]

        cantidad = random.randint(3, 8) if tipo_venta == "Mayorista" else random.randint(1, 3)

        subtotal_linea = round(cantidad * precio_unitario, 2)
        descuento_linea = round(subtotal_linea * (promocion[1] / 100), 2)
        base_iva = subtotal_linea - descuento_linea
        iva_linea = round(base_iva * IVA, 2)
        total_linea = round(base_iva + iva_linea, 2)

        stock_antes = stock_actual[nombre_producto]
        stock_despues = stock_antes - cantidad
        stock_actual[nombre_producto] = stock_despues

        if id_registro in registros_con_devolucion:
            tiene_devolucion = "Sí"
            fecha_devolucion = fecha_venta + timedelta(days=random.randint(1, 7))
            cantidad_devolucion = 1
            motivo_devolucion = random.choice(motivos_devolucion)
        else:
            tiene_devolucion = "No"
            fecha_devolucion = ""
            cantidad_devolucion = ""
            motivo_devolucion = ""

        if id_registro in registros_con_queja:
            tiene_queja = "Sí"
            tipo_queja = random.choice(tipos_queja)
            descripcion_queja = random.choice(descripciones_queja)
            estado_queja = random.choice(["Pendiente", "En proceso", "Resuelta"])
        else:
            tiene_queja = "No"
            tipo_queja = ""
            descripcion_queja = ""
            estado_queja = ""

        registros.append({
            "id_registro": id_registro,
            "nro_factura": nro_factura,
            "fecha_venta": fecha_venta,
            "tipo_venta": tipo_venta,

            "cedula_cliente": cliente["cedula_cliente"],
            "nombres_cliente": cliente["nombres_cliente"],
            "apellidos_cliente": cliente["apellidos_cliente"],
            "telefono_cliente": cliente["telefono_cliente"],
            "correo_cliente": cliente["correo_cliente"],
            "provincia_cliente": cliente["provincia_cliente"],
            "fecha_nacimiento_cliente": cliente["fecha_nacimiento_cliente"],

            "cedula_empleado": empleado["cedula_empleado"],
            "nombres_empleado": empleado["nombres_empleado"],
            "apellidos_empleado": empleado["apellidos_empleado"],
            "cargo_empleado": empleado["cargo_empleado"],
            "rol_empleado": empleado["rol_empleado"],
            "telefono_empleado": empleado["telefono_empleado"],
            "correo_empleado": empleado["correo_empleado"],

            "nombre_producto": nombre_producto,
            "tipo_producto": tipo_producto,
            "categoria_producto": categoria_producto,
            "talla": talla,
            "color": color,
            "precio_unitario": precio_unitario,

            "nombre_proveedor": proveedor["nombre_proveedor"],
            "pais_proveedor": proveedor["pais_proveedor"],
            "tipo_proveedor": proveedor["tipo_proveedor"],
            "telefono_proveedor": proveedor["telefono_proveedor"],
            "correo_proveedor": proveedor["correo_proveedor"],

            "cantidad": cantidad,
            "subtotal_linea": subtotal_linea,

            "nombre_promocion": promocion[0],
            "porcentaje_descuento": promocion[1],
            "descuento_linea": descuento_linea,
            "iva_linea": iva_linea,
            "total_linea": total_linea,

            "stock_antes": stock_antes,
            "stock_despues": stock_despues,
            "tipo_movimiento": "Salida",
            "motivo_movimiento": f"Venta factura {nro_factura}",

            "tiene_devolucion": tiene_devolucion,
            "fecha_devolucion": fecha_devolucion,
            "cantidad_devolucion": cantidad_devolucion,
            "motivo_devolucion": motivo_devolucion,

            "tiene_queja": tiene_queja,
            "tipo_queja": tipo_queja,
            "descripcion_queja": descripcion_queja,
            "estado_queja": estado_queja
        })

        id_registro += 1

df_bruto = pd.DataFrame(registros)

resumen = pd.DataFrame({
    "Elemento": [
        "Registros brutos",
        "Facturas / ventas",
        "Clientes únicos",
        "Productos únicos",
        "Proveedores únicos",
        "Empleados únicos",
        "Promociones únicas",
        "Registros con devolución",
        "Registros con queja",
        "Movimientos de inventario"
    ],
    "Cantidad": [
        len(df_bruto),
        df_bruto["nro_factura"].nunique(),
        df_bruto["cedula_cliente"].nunique(),
        df_bruto["nombre_producto"].nunique(),
        df_bruto["nombre_proveedor"].nunique(),
        df_bruto["cedula_empleado"].nunique(),
        df_bruto["nombre_promocion"].nunique(),
        (df_bruto["tiene_devolucion"] == "Sí").sum(),
        (df_bruto["tiene_queja"] == "Sí").sum(),
        len(df_bruto)
    ]
})


def quitar_tildes(valor):
    if isinstance(valor, str):
        return "".join(
            caracter
            for caracter in unicodedata.normalize("NFD", valor)
            if unicodedata.category(caracter) != "Mn"
        )
    return valor


for columna in df_bruto.select_dtypes(include="object").columns:
    df_bruto[columna] = df_bruto[columna].apply(quitar_tildes)

for columna in resumen.select_dtypes(include="object").columns:
    resumen[columna] = resumen[columna].apply(quitar_tildes)
    

df_bruto.to_csv("ventas_historicas_bruto.csv", index=False, encoding="utf-8")
resumen.to_csv("resumen_datos_brutos.csv", index=False, encoding="utf-8")

print("CSV generado: ventas_historicas_bruto.csv")
print("CSV generado: resumen_datos_brutos.csv")
print(resumen)