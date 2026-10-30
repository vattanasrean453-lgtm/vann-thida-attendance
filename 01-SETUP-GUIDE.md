# វិធីដំឡើងពីដំបូងរហូតដល់ជោគជ័យ

## ផ្នែក A — រៀបចំកុំព្យូទ័រ

1. Copy Folder នេះទៅកុំព្យូទ័រដែលត្រូវដំឡើង។
2. ដំឡើង Antigravity, Node.js 22+ និង Git។
3. បើក Antigravity ហើយជ្រើស `Open Folder` → Folder នេះ។
4. ផ្ញើសារខាងក្រោមទៅ Antigravity៖

> សូមអាន `00-START-HERE-ANTIGRAVITY.md` ទាំងមូល ហើយដំឡើង Attendance Web App នេះសម្រាប់ក្រុមហ៊ុនខ្ញុំចាប់ពី Local រហូតដល់ Production។ សូមសួរខ្ញុំតែព័ត៌មានដែលខ្វះក្នុង Checklist។ ត្រូវប្រើ GitHub, Vercel, Turso Database, Telegram Bot និង Group ថ្មីដាច់ដោយឡែក។ កុំដាក់ Secret ក្នុង Source Code ឬ Public Repository។ សាកល្បងមុខងារទាំងអស់ក្នុង `03-FINAL-TEST-CHECKLIST.md` មុនប្រគល់ Link។

## ផ្នែក B — រៀបចំព័ត៌មានក្រុមហ៊ុន

បំពេញ `02-COMPANY-SETUP-FORM.md` តែព័ត៌មានមិនសម្ងាត់។ រៀបចំ Secret ទុកដាច់ដោយឡែក៖

- Admin PIN ថ្មី
- Telegram Bot Token ថ្មី
- Session Secret ថ្មី
- Turso Database URL/Token ថ្មី
- Cron Secret ថ្មី

កុំផ្ញើ Secret ក្នុង Telegram Group, GitHub Issue ឬឯកសារ Markdown។

## ផ្នែក C — បង្កើត Telegram Bot និង Group

1. បើក Telegram → ស្វែងរក `@BotFather`។
2. ផ្ញើ `/newbot` → ដាក់ឈ្មោះ និង Username → រក្សាទុក Token នៅកន្លែងសុវត្ថិភាព។
3. បង្កើត Group សម្រាប់ Attendance។
4. បង្កើត Group សម្រាប់ Leave/Late ឬសម្រេចប្រើ Group ដូចគ្នា។
5. Add Bot ចូល Group និងផ្ដល់សិទ្ធិ Admin ដែលអាចផ្ញើសារ។
6. យក Chat ID របស់ Group នីមួយៗដោយវិធីដែល Antigravity ណែនាំ។
7. កុំដាក់ Token ក្នុង Source Code។

## ផ្នែក D — ដំណើរការ Local

Antigravity ត្រូវរត់៖

```powershell
npm install
Copy-Item .env.example .env
node --check server.js
node --check app.js
npm start
```

អ្នកត្រូវបញ្ចូល Secret ក្នុង `.env` មុន `npm start`។ បន្ទាប់មកបើក `http://localhost:3000`។ File `attendance.db` ថ្មីនឹងកើតឡើងដោយស្វ័យប្រវត្តិ និងគ្មានបុគ្គលិក។

## ផ្នែក E — កំណត់ Admin លើកដំបូង

1. ចូល Admin ដោយ `ADMIN_PIN` ដែលអ្នកបានកំណត់។
2. ចូលផ្ទាំង Telegram & GPS។
3. បញ្ចូលឈ្មោះក្រុមហ៊ុន, GPS, Radius និង Wi‑Fi IP/DDNS។
4. បញ្ចូល Telegram Chat ID ទាំងពីរ។
5. ចុច Test Telegram ទាំងពីរ។
6. ក្រោយ Test ជោគជ័យ ទើបបើក Telegram Alert។
7. ក្រោយ Network Status បង្ហាញថា Office Wi‑Fi ត្រឹមត្រូវ ទើបបើក Wi‑Fi Check។

ចំណាំ៖ Template បិទ Telegram និង Wi‑Fi Check ជាមុន ដើម្បីកុំឱ្យអ្នកត្រូវ Lock នៅក្រៅ Admin កំឡុង Setup។

## ផ្នែក F — បង្កើត Cloud Database

1. ចូល Turso និងបង្កើត Database ថ្មី។
2. បង្កើត Token ថ្មីសម្រាប់ Database នេះ។
3. កុំប្រើ Database របស់ក្រុមហ៊ុនផ្សេង។
4. ដាក់ URL និង Token ក្នុង Vercel Environment Variables មិនដាក់ក្នុង GitHub។

## ផ្នែក G — GitHub និង Vercel

1. បង្កើត GitHub Repository ថ្មីជា Private។
2. ពិនិត្យ `.gitignore` និងអះអាងថា `.env` និង `attendance.db` មិនចូល Commit។
3. Push Source Code ទៅ Repository ថ្មី។
4. ចូល Vercel → Add New Project → Import Repository។
5. បន្ថែម Environment Variables៖
   - `APP_TIMEZONE`
   - `ADMIN_PIN`
   - `TELEGRAM_BOT_TOKEN`
   - `SESSION_SECRET`
   - `TURSO_DATABASE_URL`
   - `TURSO_AUTH_TOKEN`
   - `CRON_SECRET`
6. Deploy ម្តងដើម្បីទទួល Domain។
7. បន្ថែម `TELEGRAM_WEBHOOK_URL=https://DOMAIN/api/telegram-webhook` ហើយ Redeploy។

## ផ្នែក H — Wi‑Fi និង DDNS

- បើ Office មាន Static Public IP ដាក់ IP នោះក្នុង Admin Settings។
- បើ Public IP ប្ដូរញឹកញាប់ ប្រើ DDNS Host របស់ Router ឬ DDNS Client លើកុំព្យូទ័រដែលបើកជាប្រចាំ។
- បើក Wi‑Fi Check ក្រោយសាកល្បងថា Web App មើលឃើញ IP/DDNS ត្រឹមត្រូវ។
- គួរប្រើ Approved Device + Office Wi‑Fi/DDNS។ GPS Emergency Mode បើកតែពេល Internet Office មានបញ្ហា។

## ផ្នែក I — Test ជោគជ័យ

1. ចុះឈ្មោះបុគ្គលិក Test មួយតាមទូរសព្ទ។
2. Admin Approve ហើយផ្ទៀងផ្ទាត់ថា Device ដើមភ្ជាប់ Auto។
3. Test Check-in/out 4 ដង។
4. Test ករណីមិន Check-in វគ្គទី១ ហើយចុចក្រោយម៉ោង 11:00 → ត្រូវចូលវគ្គទី២ និង Report កន្លះថ្ងៃ។
5. Test Telegram Attendance និង Leave/Late approval។
6. Test PDF, Word និង CSV Export។
7. Test Add to Home Screen និង Logo។
8. Test ទូរសព្ទទីពីរមិនអាចប្រើគណនីដែលចាក់សោ Device បាន។
9. Test Office Wi‑Fi និងក្រៅ Office។
10. បំពេញ `03-FINAL-TEST-CHECKLIST.md` ទាំងអស់។

ក្រោយគ្រប់ចំណុចជោគជ័យ អាចដាក់ឱ្យបុគ្គលិកប្រើបាន។

