# Final Test Checklist

## Clean & Security

- [ ] គ្មាន `.env` ក្នុង GitHub
- [ ] គ្មាន `attendance.db`, `*.db-wal`, `*.db-shm` ក្នុង GitHub
- [ ] គ្មាន Bot Token, Admin PIN, Session Secret ឬ Turso Token ក្នុង Source Code
- [ ] Database ថ្មីមិនមានបុគ្គលិក/Attendance របស់ក្រុមហ៊ុនផ្សេង
- [ ] GitHub Repository ជា Private

## Branding

- [ ] ឈ្មោះក្រុមហ៊ុនត្រឹមត្រូវលើ Login, Header, Menu, Report និង Telegram
- [ ] Logo ត្រឹមត្រូវលើ Web App និង Add to Home Screen
- [ ] Manifest និង Browser title ត្រឹមត្រូវ

## Admin & Staff

- [ ] Admin PIN ថ្មីអាច Login បាន
- [ ] Self Registration បង្កើត Pending Request
- [ ] Admin Approve ភ្ជាប់ Device ដើម Auto
- [ ] Device ផ្សេងត្រូវបានបដិសេធរហូត Admin Reset Device
- [ ] Password បុគ្គលិកត្រូវបាន Hash ក្នុង Database

## Attendance

- [ ] Check-in/out 4 ដងក្នុងមួយថ្ងៃត្រឹមត្រូវ
- [ ] ម៉ោងបង្ហាញជា Timezone ក្រុមហ៊ុន
- [ ] ក្រោយ 11:00 បើខកវគ្គទី១ នឹងចូលវគ្គទី២ និងគិតកន្លះថ្ងៃ
- [ ] មិនអាចចុចស្ទួនពេល Request កំពុងដំណើរការ
- [ ] Office Wi‑Fi/IP/DDNS ត្រឹមត្រូវ
- [ ] ក្រៅ Office ត្រូវបានបដិសេធតាម Policy
- [ ] Emergency GPS Mode អាចបើក/បិទដោយ Admin

## Telegram

- [ ] Test Attendance Group ជោគជ័យ
- [ ] Test Leave/Late Group ជោគជ័យ
- [ ] Approve/Reject Button ដំណើរការ
- [ ] Daily Report មកម៉ោងដែលបានកំណត់
- [ ] Monthly Report មកចុងខែ

## Reports & Production

- [ ] PDF Export អានងាយ និងមាន Summary បុគ្គលិក
- [ ] Word Export ដំណើរការ
- [ ] CSV/Excel Export ដំណើរការ
- [ ] Vercel Production Deployment ជោគជ័យ
- [ ] Turso Database ថ្មីភ្ជាប់ជោគជ័យ
- [ ] Refresh និង Add to Home Screen បាន
- [ ] Test លើ Android និង iPhone យ៉ាងហោចណាស់មួយគ្រឿង

