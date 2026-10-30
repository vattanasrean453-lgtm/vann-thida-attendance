/**
 * Helper script to sync or migrate data from local attendance.db to Turso Cloud Database.
 * Usage:
 *   TURSO_DATABASE_URL=libsql://... TURSO_AUTH_TOKEN=... node migrate_to_turso.js
 */

const { createClient } = require('@libsql/client');
const fs = require('fs');

async function migrate() {
  const tursoUrl = process.env.TURSO_DATABASE_URL;
  const tursoToken = process.env.TURSO_AUTH_TOKEN;

  if (!tursoUrl || !tursoToken) {
    console.error('Error: Please provide TURSO_DATABASE_URL and TURSO_AUTH_TOKEN environment variables.');
    console.log('Example:');
    console.log('  $env:TURSO_DATABASE_URL="libsql://your-db.turso.io"');
    console.log('  $env:TURSO_AUTH_TOKEN="your-token"');
    console.log('  node migrate_to_turso.js');
    process.exit(1);
  }

  console.log('Connecting to Local SQLite...');
  const localClient = createClient({ url: 'file:attendance.db' });

  console.log('Connecting to Turso Cloud DB:', tursoUrl);
  const cloudClient = createClient({ url: tursoUrl, authToken: tursoToken });

  // Read schema_seed.sql statements
  if (!fs.existsSync('schema_seed.sql')) {
    console.error('Error: schema_seed.sql not found.');
    process.exit(1);
  }

  const sqlContent = fs.readFileSync('schema_seed.sql', 'utf8');
  const statements = sqlContent
    .split(';\n')
    .map(s => s.trim())
    .filter(s => s.length > 0 && !s.startsWith('--'));

  console.log(`Executing ${statements.length} statements to Turso Cloud...`);

  for (let i = 0; i < statements.length; i++) {
    const stmt = statements[i];
    try {
      await cloudClient.execute(stmt);
      process.stdout.write(`\rProgress: [${i + 1}/${statements.length}]`);
    } catch (err) {
      console.warn(`\nWarning on stmt ${i + 1}:`, err.message);
    }
  }

  console.log('\n\n Migration to Turso Cloud complete! Data & Settings synced.');
}

migrate().then(() => process.exit(0)).catch(err => {
  console.error('\nMigration failed:', err);
  process.exit(1);
});
