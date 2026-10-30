# Clean Package Report

Folder នេះត្រូវបានបង្កើតពីកំណែ Web App ដែលមានការកែម៉ោងកម្ពុជា និងកែល្បឿន Attendance រួច។ ការសម្អាតរួមមាន៖

- មិនដាក់ Local Database ឬ Cloud Database Credential
- លុប Default employee seed ទាំងអស់
- លុបឈ្មោះ លេខទូរសព្ទ និងប្រវត្តិបុគ្គលិកគំរូដែលពាក់ព័ន្ធម្ចាស់ដើម
- លុប Telegram Chat ID និង Webhook Domain ដើម
- លុប Office GPS, Public IP និង DDNS ដើម
- លុប Company name និង Logo ដើម; ប្រើ `YOUR COMPANY` និង Placeholder Logo
- Telegram និង Wi‑Fi enforcement បិទជាមុនរហូត Setup រួច
- Admin PIN ត្រូវកំណត់តាម Environment Variable; គ្មាន Default PIN
- QR Office Token ត្រូវបង្កើត Random ពេល Database ថ្មីចាប់ផ្ដើម

កុំ Copy `.env` ឬ `attendance.db` ពីគម្រោងផ្សេងចូល Folder នេះ។

