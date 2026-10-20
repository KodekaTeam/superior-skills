# Menggunakan `superior-ux`

Skill ini merancang atau meninjau cara pengguna memahami dan menyelesaikan tujuan lintas langkah maupun surface. Tanggung jawabnya mencakup journey, arsitektur informasi, task flow, feedback, recovery, dan kesinambungan lintas layar.

## Kapan dipakai

Gunakan ketika pertanyaan utamanya adalah bagaimana pengalaman produk seharusnya berjalan dari entry hingga outcome: onboarding, checkout, authentication, form bertahap, struktur navigasi, approval flow, journey dari empty state hingga aktif, atau recovery setelah interupsi. Gunakan `superior-ui` bila implementasi visual menjadi concern utama dan `superior-logic` bila tugas hanya membahas behavior aplikasi.

## Alur kerja

1. Identifikasi pengguna, pekerjaan, konteks, entry point, outcome sukses, dan evidence yang tersedia.
2. Petakan keputusan wajib, langkah, jalur alternatif, interupsi, dan re-entry.
3. Susun informasi berdasarkan keputusan pengguna, bukan tim internal atau struktur data.
4. Tentukan behavior pending, success, failure, cancellation, dan recovery yang dapat diamati bila relevan.
5. Jalankan walkthrough skenario representatif lalu laporkan evidence, asumsi, risiko yang belum terjawab, dan validasi.

Skill tidak mengarang persona, temuan riset, atau klaim usability. Bila evidence terbatas, rancangan experience dinyatakan sebagai hipotesis beserta cara memvalidasinya.

## Contoh prompt

```text
$superior-ux Tinjau journey pemulihan akun dari kegagalan sign-in hingga akses pulih. Temukan dead end, keputusan yang tidak jelas, dan recovery state yang hilang tanpa mengubah kode.
```

```text
$superior-ux $superior-ui Redesign onboarding agar workspace baru dapat mencapai import pertama yang sukses dengan lebih sedikit keputusan ambigu. Pertahankan langkah consent dan keamanan yang wajib.
```

## Kombinasi yang sesuai

- Tambahkan `superior-ui` untuk hierarki visual, komponen, dan implementasi interface.
- Tambahkan `superior-logic` bila state transition, API, atau persistence berubah.
- Tambahkan `superior-responsive` bila journey berubah pada ukuran viewport berbeda.
- Tambahkan `superior-accessibility` untuk keyboard, fokus, semantik, dan assistive technology.
- Tambahkan `superior-copy` bila label, instruksi, dan pesan error memerlukan pekerjaan khusus.
- Tambahkan `superior-testing` untuk desain journey test atau regression test yang substansial.

## Hasil yang perlu diperiksa

Hasil harus memperjelas entry, orientation, decision, progress, completion, interruption, dan recovery. Setiap rekomendasi harus terhubung pada evidence atau asumsi yang diberi label dengan jelas, sedangkan kepemilikan implementasi tetap berada pada skill UI, logic, responsive, accessibility, copy, atau testing yang relevan.
