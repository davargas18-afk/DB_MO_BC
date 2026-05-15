-- ============================================================
-- SUPABASE SETUP - Dashboard Control MO Balcón Cusqueño
-- Ejecutar este script en el SQL Editor de Supabase
-- ============================================================

-- 1. Crear tabla principal (guarda todos los registros como JSON)
CREATE TABLE IF NOT EXISTS registros_data (
  id INTEGER DEFAULT 1 PRIMARY KEY,
  data JSONB DEFAULT '{}'::jsonb,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Insertar fila inicial
INSERT INTO registros_data (id, data)
VALUES (1, '{}'::jsonb)
ON CONFLICT (id) DO NOTHING;

-- 3. Permitir acceso público de lectura y escritura (anon key)
ALTER TABLE registros_data ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Lectura pública" ON registros_data
  FOR SELECT USING (true);

CREATE POLICY "Escritura pública" ON registros_data
  FOR UPDATE USING (true);

-- 4. Verificar que todo esté correcto
SELECT * FROM registros_data;
