# START HERE — ការងារសម្រាប់ Antigravity

អ្នកកំពុងធ្វើការលើ Clean Attendance Web App Template ថ្មី។ ត្រូវបង្កើតប្រព័ន្ធឯករាជ្យសម្រាប់ក្រុមហ៊ុនដែលកាន់កាប់ Folder នេះ។ មិនត្រូវភ្ជាប់ទៅ GitHub, Vercel, Database, Telegram Bot, Group, IP, DDNS ឬ Domain របស់គម្រោងដើមឡើយ។

## 1. អ្វីដែលត្រូវធ្វើមុនគេ

អានឯកសារទាំងនេះទាំងមូល៖

1. `README.md`
2. `01-វិធីដំឡើងពីដំបូងរហូតដល់ជោគជ័យ.md`
3. `02-COMPANY-SETUP-FORM.md`
4. `03-FINAL-TEST-CHECKLIST.md`

ពិនិត្យថាមិនមាន `.env`, `attendance.db`, `*.db-wal`, `*.db-shm`, `node_modules`, Token, Chat ID ពិត, Admin PIN ពិត ឬទិន្នន័យបុគ្គលិកក្នុង Folder។ កុំបង្ហាញ Secret ក្នុង Chat ឬ Log។

## 2. សួរអ្នកប្រើជាមុន

សួរជា Checklist ខ្លីមួយ៖

- ឈ្មោះក្រុមហ៊ុនជាភាសាខ្មែរ និងអង់គ្លេស
- Logo ក្រុមហ៊ុន (PNG ការ៉េ 512×512 ឬធំជាងនេះ)
- Timezone និងម៉ោងធ្វើការ 4 វគ្គ
- GPS Latitude, Longitude និង Radius Office
- Public IP របស់ Wi‑Fi Office ឬ DDNS Host
- ប្រើ Telegram Group មួយ ឬពីរ
- ឈ្មោះ GitHub Repository និង Vercel Project
- Domain ដែលចង់ប្រើ

សម្រាប់ Secret សូមឱ្យអ្នកប្រើបញ្ចូលផ្ទាល់ទៅ `.env`, Vercel Environment Variables ឬ Dashboard ដែលមានសុវត្ថិភាព។ កុំសរសេរ Admin PIN, Bot Token, Session Secret, Turso Token ឬ Cron Secret ក្នុង Source Code និងឯកសារ Markdown។

## 3. រៀបចំ Local Project

1. ពិនិត្យ Node.js៖ `node --version` ត្រូវជា 22 ឬថ្មីជាងនេះ។
2. ដំឡើង Package៖ `npm install`។
3. Copy `.env.example` ទៅ `.env`។
4. ឱ្យអ្នកប្រើបញ្ចូល Secret ថ្មីក្នុង `.env`៖
   - `ADMIN_PIN`
   - `TELEGRAM_BOT_TOKEN`
   - `SESSION_SECRET` យ៉ាងតិច 32 តួអក្សរ
   - `CRON_SECRET`
5. សម្រាប់ Local SQLite ទុក `TURSO_DATABASE_URL` និង `TURSO_AUTH_TOKEN` ទទេ។
6. កុំបង្កើត ឬ Copy Database ចាស់។ Server នឹងបង្កើត `attendance.db` ទទេដោយខ្លួនឯង។

## 4. ប្ដូរ Branding

1. ប្ដូរ Placeholder `YOUR COMPANY` និង `YOUR COMPANY CO., LTD` ទៅឈ្មោះថ្មីនៅកន្លែងដែលមើលឃើញក្នុង `index.html` និង `manifest.webmanifest`។
2. ជំនួស `public/logo.svg` ដោយ Logo ថ្មី។ ប្រសិនបើប្រើ `logo.png` ត្រូវកែ reference `/logo.svg` ទាំងអស់ក្នុង `index.html`, `manifest.webmanifest` និង `service-worker.js` ហើយអាចឱ្យ PDF ប្រើ PNG នោះបាន។
3. ប្ដូរ `CACHE_NAME` ក្នុង `service-worker.js` ម្តង ដើម្បីឱ្យទូរសព្ទទទួល UI ថ្មី។
4. កុំដាក់ឈ្មោះ/Logo របស់គម្រោងដើមត្រឡប់មកវិញ។

## 5. ពិនិត្យ Code និងដំណើរការ Local

រត់៖

```powershell
node --check server.js
node --check app.js
npm start
```

បើក `http://localhost:3000`។ Login Admin ដោយ PIN ក្នុង `.env` រួចកំណត់៖

- Company name
- Office GPS និង Radius
- Telegram Attendance Chat ID
- Telegram Leave/Late Chat ID
- Wi‑Fi Public IP ឬ DDNS Host
- បើក Telegram តែក្រោយ Test Message ជោគជ័យ
- បើក Wi‑Fi Check តែក្រោយ IP/DDNS ត្រឹមត្រូវ

## 6. Telegram

1. ឱ្យអ្នកប្រើបង្កើត Bot ថ្មីតាម `@BotFather` ដោយ `/newbot`។
2. បង្កើត Group ថ្មី ហើយ Add Bot ជា Admin ដែលអាចផ្ញើសារ។
3. ប្រើ Group ថ្មីសម្រាប់ Attendance និង Group ថ្មីមួយទៀតសម្រាប់ Leave/Late ឬប្រើ Group ដូចគ្នាតាមការសម្រេចរបស់ម្ចាស់ក្រុមហ៊ុន។
4. កំណត់ Chat ID ក្នុង Admin Settings។
5. Test Telegram ទាំងពីរ។
6. ក្រោយមាន Production URL កំណត់ `TELEGRAM_WEBHOOK_URL=https://NEW-DOMAIN/api/telegram-webhook` ក្នុង Vercel។

## 7. Database Production

1. បង្កើត Turso Database ថ្មីសម្រាប់ក្រុមហ៊ុននេះតែប៉ុណ្ណោះ។
2. បង្កើត Database Token ថ្មី។
3. ដាក់ `TURSO_DATABASE_URL` និង `TURSO_AUTH_TOKEN` ក្នុង Vercel Environment Variables។
4. មិនត្រូវប្រើ URL/Token ឬ Database របស់ក្រុមហ៊ុនផ្សេង។
5. កុំ Upload `attendance.db` ទៅ GitHub ឬ Vercel។

## 8. GitHub និង Vercel

1. បង្កើត GitHub Repository ថ្មីជា Private។
2. Upload តែឯកសារក្នុង Folder នេះ។ កុំ Upload `.env`, `attendance.db`, `node_modules`, Screenshot ឬ Export Report។
3. Import Repository ទៅ Vercel Project ថ្មី។
4. បន្ថែម Environment Variables ទាំងអស់មុន Deploy Production។
5. Deploy ហើយកំណត់ `TELEGRAM_WEBHOOK_URL` ទៅ Domain ថ្មី រួច Redeploy ម្តង។
6. ពិនិត្យ Vercel Cron៖ `0 13 * * *` ស្មើម៉ោង 8:00 យប់នៅកម្ពុជា។ ប្ដូរបើក្រុមហ៊ុនប្រើ Timezone ផ្សេង។

## 9. លក្ខខណ្ឌទទួលការងារ

មុនប្រគល់ ត្រូវបំពេញ `03-FINAL-TEST-CHECKLIST.md` ទាំងអស់។ ប្រគល់៖

- Production URL
- GitHub Repository URL
- ស្ថានភាព Vercel Deployment
- សេចក្ដីបញ្ជាក់ថា Database ថ្មី និង Telegram ថ្មី
- វិធី Backup/Restore

កុំបង្ហាញ Secret ក្នុងចម្លើយចុងក្រោយ។

