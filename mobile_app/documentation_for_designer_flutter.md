# 🎨 Guía de Diseño y Desarrollo: MediCitas App

¡Bienvenido al equipo de diseño y desarrollo de **MediCitas**! Esta guía te ayudará a entender cómo hemos estructurado el proyecto y cómo implementar los diseños premium que ves en los prototipos.

## 📁 Estructura del Proyecto

Para mantener el código limpio y escalable (especialmente cuando trabajamos con muchos componentes visuales), hemos organizado las pantallas en su propia carpeta:

```text
lib/
├── screens/
│   ├── splash_screen.dart   # Pantalla de carga inicial
│   └── login_screen.dart    # Pantalla de inicio de sesión
└── main.dart                # Punto de entrada y configuración global
```

---

## 💎 Sistema de Diseño (Design System)

Nuestra aplicación utiliza una estética **Premium Healthcare**. Aquí te explico los elementos clave:

### 1. Paleta de Colores
- **Azul Primario (`0xFF004AAD`):** Representa confianza y profesionalismo médico.
- **Azul Oscuro (`0xFF00388D`):** Usado para estados de interacción (hover/press).
- **Fondo con Gradiente:** No usamos colores planos. Las pantallas inician con un leve azul pastel (`0xFFE8F2FD`) que se desvanece a blanco puro para dar sensación de pulcritud.

### 2. Tipografía y Espaciado
- **Contraste:** Los títulos principales son en **Bold** con tamaños grandes (28-36pt).
- **Subtítulos:** Usamos un espaciado entre letras (letter-spacing) mayor en subtítulos como "EMPATHETIC PRECISION" para un look más moderno.
- **Micro-espaciado:** Los campos de texto tienen un `contentPadding` generoso para que el usuario no se sienta abrumado.

### 3. Componentes Visuales: "The Card Look"
- **Bordes Redondeados:** Usamos `BorderRadius.circular(40)` (o hasta `60` en botones) para suavizar la interfaz. Evitamos las esquinas afiladas.
- **Elevación y Sombras:** Las sombras son muy sutiles (`BlurRadius: 30`, `Opacity: 0.05`). Deben sentirse como si los elementos flotaran, no como si estuvieran pegados con pegamento.

---

## 🛠️ Detalles de Implementación (Para el nuevo diseñador Flutter)

### SplashScreen.dart
- **Animación:** Simulamos una carga de 3 segundos antes de pasar al Login.
- **Logo:** Construido con un `Container` estilizado en lugar de solo una imagen, permitiéndonos controlar las sombras y el color dinámicamente.

### LoginScreen.dart
- **Inputs Modernos:** Hemos personalizado el `InputDecoration` para eliminar la línea inferior clásica de Android y usar un borde redondeado completo (`OutlineInputBorder`).
- **Interactividad:** El campo de contraseña incluye un `suffixIcon` que alterna la visibilidad (`obscureText`), mejorando la UX.
- **Social Buttons:** Implementados como `OutlinedButton` con iconos de sistema para una integración nativa.

---

## 🚀 Próximos Pasos recomendados
1. **Tematización Global:** Mover los colores a un `Color Palette` separado.
2. **Assets:** Reemplazar los iconos de Flutter por los archivos SVG finales del equipo de diseño.
3. **Responsive:** Asegurar que los espaciados (`Spacer`) se adapten a diferentes tamaños de pantalla (iOS vs Android).

---
*Proyectado para la excelencia en el cuidado de la salud.*
