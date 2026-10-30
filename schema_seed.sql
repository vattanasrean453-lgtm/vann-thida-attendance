-- VANN SITHA TRADING Attendance Database Schema & Seed Data

-- Table: members
CREATE TABLE members (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      code TEXT UNIQUE NOT NULL,
      name TEXT NOT NULL,
      name_km TEXT,
      name_latin TEXT,
      role TEXT,
      phone TEXT,
      password TEXT DEFAULT '',
      gender TEXT,
      dob TEXT,
      national_id TEXT,
      email TEXT,
      address TEXT,
      join_date TEXT,
      emergency_contact TEXT,
      salary_type TEXT DEFAULT 'monthly',
      notes TEXT,
      avatar TEXT,
      status TEXT DEFAULT 'active',
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    , device_id TEXT, session_version INTEGER DEFAULT 0);

INSERT OR REPLACE INTO members (id, code, name, name_km, name_latin, role, phone, password, gender, dob, national_id, email, address, join_date, emergency_contact, salary_type, notes, avatar, status, created_at, device_id, session_version) VALUES (1, 'VST-001', 'សុខ សាន (Sok San)', NULL, NULL, 'ផ្នែកលក់ (Sales)', '012345678', 'scrypt$v1$b00ecd15e79164a8906e29ad0050603f$0e344c0fbf322e0c85fa152cff8abba5464e6953d00dd845139becd6751a6b612d72e87f611492c8e4aa20a5601ee5b30e44982fc5bd72a78f702dbc8a748dc3', 'male', '1998-05-15', '', '', '', '2026-01-01', '', 'monthly', '', '', 'active', '2026-10-29 17:32:12', 'dev-e6babce0-1f51-43b7-9b4e-8b06ab6f162c', 0);

-- Table: attendance
CREATE TABLE attendance (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      member_id INTEGER,
      member_name TEXT,
      member_code TEXT,
      member_role TEXT,
      type TEXT NOT NULL,
      timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
      latitude REAL,
      longitude REAL,
      distance_meters REAL,
      is_within_range INTEGER DEFAULT 1,
      verification_method TEXT DEFAULT 'office_wifi',
      gps_accuracy REAL,
      note TEXT
    );

-- Table: settings
CREATE TABLE settings (
      key TEXT PRIMARY KEY,
      value TEXT
    );

INSERT OR REPLACE INTO settings (key, value) VALUES ('telegram_token', '');
INSERT OR REPLACE INTO settings (key, value) VALUES ('office_qr_token', 'eb2070ce7e8060fc3b8030e9c0b4ea0a4e16668eff9ec2d9');
INSERT OR REPLACE INTO settings (key, value) VALUES ('admin_pin', '');
INSERT OR REPLACE INTO settings (key, value) VALUES ('session_secret', '8898e2d690e02748ac342640c4f4dc9aedb2f9471e45a0c4b2597cf061189a78');
INSERT OR REPLACE INTO settings (key, value) VALUES ('attendance_mode', 'wifi');
INSERT OR REPLACE INTO settings (key, value) VALUES ('emergency_mode_expires_at', '');
INSERT OR REPLACE INTO settings (key, value) VALUES ('emergency_gps_accuracy_limit', '50');
INSERT OR REPLACE INTO settings (key, value) VALUES ('office_lat', '11.537030');
INSERT OR REPLACE INTO settings (key, value) VALUES ('office_lng', '104.886657');
INSERT OR REPLACE INTO settings (key, value) VALUES ('company_name', 'VANN SITHA TRADING CO., LTD');
INSERT OR REPLACE INTO settings (key, value) VALUES ('wifi_check_enabled', 'false');
INSERT OR REPLACE INTO settings (key, value) VALUES ('company_wifi_ips', '');
INSERT OR REPLACE INTO settings (key, value) VALUES ('company_wifi_ddns_hosts', '');
INSERT OR REPLACE INTO settings (key, value) VALUES ('telegram_chat_id', '-5185574387');
INSERT OR REPLACE INTO settings (key, value) VALUES ('telegram_enabled', 'true');
INSERT OR REPLACE INTO settings (key, value) VALUES ('telegram_group_link', 'https://t.me/+CRyfgShH_FxmOTZl');
INSERT OR REPLACE INTO settings (key, value) VALUES ('telegram_bot_username', 'checkin_vannthida_bot');
INSERT OR REPLACE INTO settings (key, value) VALUES ('telegram_leave_chat_id', '489319172');
INSERT OR REPLACE INTO settings (key, value) VALUES ('telegram_leave_enabled', 'true');
INSERT OR REPLACE INTO settings (key, value) VALUES ('allowed_radius', '50');

-- Table: leave_requests
CREATE TABLE leave_requests (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      member_id INTEGER,
      member_name TEXT NOT NULL,
      member_code TEXT NOT NULL,
      member_role TEXT,
      request_type TEXT NOT NULL,
      sub_type TEXT,
      date_start TEXT NOT NULL,
      date_end TEXT,
      time_expected TEXT,
      duration_text TEXT,
      reason TEXT NOT NULL,
      status TEXT DEFAULT 'pending',
      admin_response TEXT,
      reviewed_by TEXT,
      reviewed_at DATETIME,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    , tg_message_id INTEGER, tg_chat_id TEXT);

