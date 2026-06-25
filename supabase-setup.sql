-- Ejecuta esto UNA VEZ en Supabase > SQL Editor
-- https://xgpyuqseueknpxfsasdc.supabase.co

CREATE TABLE IF NOT EXISTS match_results (
  id          TEXT        PRIMARY KEY,
  home_score  TEXT,
  away_score  TEXT,
  finished    BOOLEAN     DEFAULT FALSE,
  source      TEXT        DEFAULT 'manual',
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

-- Habilitar Row Level Security
ALTER TABLE match_results ENABLE ROW LEVEL SECURITY;

-- Permitir lectura y escritura pública (app de fixture)
CREATE POLICY "allow_all" ON match_results
  FOR ALL USING (true) WITH CHECK (true);
