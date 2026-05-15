# Guía de Despliegue – Dashboard Control MO

Con esta guía el dashboard estará disponible en una URL pública para que cualquier miembro del equipo pueda ingresar datos desde su celular o PC.

---

## PASO 1 – Crear base de datos gratuita en Supabase

1. Ve a **https://supabase.com** y crea una cuenta gratuita (con tu Gmail).
2. Haz clic en **"New Project"**.
   - **Organization**: el nombre que quieras (ej. `MPC-Cusco`)
   - **Project name**: `db-mo-bc`
   - **Database password**: elige una contraseña segura y guárdala
   - **Region**: South America (São Paulo) – la más cercana a Perú
3. Espera ~2 minutos a que el proyecto se cree.

---

## PASO 2 – Crear la tabla en Supabase

1. En tu proyecto Supabase, ve al menú izquierdo → **SQL Editor**.
2. Haz clic en **"+ New query"**.
3. Copia y pega el contenido del archivo `supabase-setup.sql` de este repositorio.
4. Haz clic en **"Run"** (botón verde).
5. Deberías ver el mensaje: `Success. No rows returned` y luego una fila con `id=1`.

---

## PASO 3 – Obtener las credenciales de Supabase

1. En tu proyecto Supabase, ve al menú izquierdo → **Project Settings** → **API**.
2. Copia estos dos valores:
   - **Project URL**: algo como `https://abcdefghijk.supabase.co`
   - **anon / public key**: una cadena larga que empieza con `eyJ...`

---

## PASO 4 – Pegar las credenciales en el dashboard

1. Abre el archivo `Dashboard_MO_Interactivo.html` en un editor de texto (Notepad, VS Code, etc.).
2. Busca estas líneas (están al inicio del bloque `<script>`):

```javascript
const SUPABASE_URL = 'https://TU_PROYECTO.supabase.co';
const SUPABASE_KEY = 'TU_ANON_KEY_AQUI';
```

3. Reemplaza los valores:

```javascript
const SUPABASE_URL = 'https://abcdefghijk.supabase.co';   // ← tu URL real
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';  // ← tu key real
```

4. Guarda el archivo.

---

## PASO 5 – Publicar en GitHub Pages

1. Sube los cambios a GitHub:

```bash
git add .
git commit -m "Agregar integración Supabase y GitHub Pages"
git push
```

2. Ve a tu repositorio en GitHub: **https://github.com/davargas18-afk/DB_MO_BC**
3. Haz clic en **Settings** (engranaje).
4. En el menú izquierdo → **Pages**.
5. En **"Source"** selecciona → **"GitHub Actions"**.
6. Espera ~2 minutos.
7. Tu dashboard estará disponible en:

```
https://davargas18-afk.github.io/DB_MO_BC/Dashboard_MO_Interactivo.html
```

---

## PASO 6 – Compartir la URL

Comparte este enlace con todo el equipo:

```
https://davargas18-afk.github.io/DB_MO_BC/Dashboard_MO_Interactivo.html
```

Cualquier persona con ese enlace podrá:
- Ver el dashboard
- Ingresar horas en la pestaña "Registro Semanal"
- Los datos se guardan automáticamente en la nube
- Todos ven los mismos datos en tiempo real

---

## Solución de problemas

| Problema | Solución |
|----------|----------|
| "Error al guardar" | Verifica que `SUPABASE_URL` y `SUPABASE_KEY` estén correctos |
| Página no carga | Espera 2-3 min después del primer push, GitHub Pages necesita tiempo |
| Datos no se ven | Verifica que ejecutaste el SQL del Paso 2 correctamente |
| "⚠️ Sin conexión – modo local" | El SUPABASE_URL o KEY está incorrecto en el HTML |

---

## Estructura del repositorio

```
DB_MO_BC/
├── Dashboard_MO_Interactivo.html   ← El dashboard (frontend)
├── supabase-setup.sql              ← SQL para crear la tabla en Supabase
├── INSTRUCCIONES_DEPLOY.md         ← Esta guía
└── .github/
    └── workflows/
        └── pages.yml               ← Automatiza el deploy a GitHub Pages
```
