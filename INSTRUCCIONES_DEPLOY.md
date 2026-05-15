# Guía de Despliegue – Dashboard Control MO
### Solo GitHub, sin servicios externos

Los datos se guardan directamente como un archivo JSON en este repositorio.
La URL pública es servida por GitHub Pages (gratis).

---

## PASO 1 – Crear un Token de GitHub (PAT)

1. Ve a **https://github.com/settings/tokens?type=beta** (Fine-grained tokens)
2. Clic en **"Generate new token"**
3. Completa:
   - **Token name**: `dashboard-mo-bc`
   - **Expiration**: 1 year (o la que prefieras)
   - **Repository access**: Selecciona "Only select repositories" → elige `DB_MO_BC`
4. En **"Permissions"** → busca **"Contents"** → selecciona **"Read and write"**
5. Clic en **"Generate token"**
6. **COPIA el token** (empieza con `github_pat_...`) — solo se muestra una vez

---

## PASO 2 – Activar GitHub Pages y compartir la URL

No necesitas pegar el token en el código. Cada usuario lo ingresa directamente en el navegador (se guarda ahí, nunca en el código).

---

## PASO 4 – Activar GitHub Pages

1. Ve a **https://github.com/davargas18-afk/DB_MO_BC**
2. Clic en **Settings** (pestaña superior)
3. En el menú izquierdo → **Pages**
4. En **"Source"** selecciona → **"GitHub Actions"**
5. Espera ~2 minutos

---

## PASO 5 – Compartir la URL

```
https://davargas18-afk.github.io/DB_MO_BC/Dashboard_MO_Interactivo.html
```

Cualquier persona con ese enlace puede:
- Ver todos los datos del proyecto
- Ingresar horas en "Registro Semanal"
- Los datos se guardan automáticamente en el archivo `data/registros.json` del repo

---

## ¿Cómo funciona?

```
Usuario ingresa datos
        ↓
Dashboard llama a la API de GitHub
        ↓
GitHub actualiza data/registros.json en el repo
        ↓
Próxima vez que alguien abre el dashboard, carga ese archivo
```

---

## Solución de problemas

| Problema | Solución |
|----------|----------|
| "❌ Error al guardar" | Verifica que el token esté bien pegado en el HTML |
| Datos no se muestran | Verifica que `data/registros.json` existe en el repo |
| Página 404 | Espera 2-3 min después del primer push |
| Token vencido | Crea un nuevo token y actualiza el HTML |

---

## Estructura del repositorio

```
DB_MO_BC/
├── Dashboard_MO_Interactivo.html   ← El dashboard (frontend)
├── data/
│   └── registros.json              ← Aquí se guardan las horas ingresadas
├── INSTRUCCIONES_DEPLOY.md         ← Esta guía
└── .github/
    └── workflows/
        └── pages.yml               ← Automatiza el deploy a GitHub Pages
```
