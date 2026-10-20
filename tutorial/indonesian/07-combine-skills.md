# 07 — Menggabungkan Skills

Gabungkan skills berdasarkan concern yang benar-benar ada, bukan berdasarkan jumlah file yang disentuh.

## Kombinasi umum

| Tugas | Skill utama | Tambahan bila relevan |
|---|---|---|
| Membuat halaman baru | `superior-ui` | `superior-responsive`, `superior-accessibility`, `superior-copy` |
| Journey pengguna, arsitektur informasi, atau task flow | `superior-ux` | `superior-ui` untuk implementasi visual; `superior-logic` untuk behavior; `superior-copy` untuk bahasa |
| Audit visual read-only | `superior-ui-audit` | `superior-accessibility` jika diminta |
| Fitur full-stack | `superior-logic` + `superior-ui` | `superior-docs` jika pengetahuan durable berubah |
| Review umum terhadap change set | `superior-code-review` | Skill domain khusus hanya ketika concern tersebut memerlukan kedalaman substansial |
| Bug yang belum pasti atau insiden runtime | `superior-debugging` | `superior-logic` untuk perbaikan behavior terkonfirmasi; `superior-testing` untuk desain regresi khusus |
| Perubahan schema, transaction, atau migration | `superior-database` | `superior-logic` untuk behavior aplikasi; `superior-testing` untuk desain test compatibility atau concurrency yang substansial |
| Pekerjaan performa atau capacity terukur | `superior-performance` | Skill database, UI, atau logic hanya ketika kontrak miliknya juga berubah |
| Pekerjaan pipeline, release, atau deployment | `superior-delivery` | `superior-database` untuk migration; `superior-reliability` untuk objective availability atau recovery |
| Resilience atau recovery operasional | `superior-reliability` | `superior-debugging` untuk penyebab belum diketahui; `superior-performance` untuk evidence capacity; `superior-delivery` untuk eksekusi rollout |
| REST API sensitif keamanan | `superior-api-security` | `superior-logic` untuk invariant domain, transaksi, atau idempotency |
| Perbaikan layout mobile | `superior-responsive` | `superior-accessibility` untuk keyboard/touch/focus |
| Penyederhanaan implementasi | `superior-lean` | `superior-logic` bila behavior ikut dianalisis |
| Pekerjaan regresi atau test suite | `superior-testing` | Skill domain bila behavior production juga termasuk scope |
| Cleanup komentar | `superior-comments` | Tidak perlu skill UI atau logic |
| Dokumentasi maintenance | `superior-docs` | Skill domain hanya jika perlu memahami perubahan terkait |

## Contoh prompt gabungan

```text
$superior-ui $superior-responsive

Implementasikan ulang header checkout agar hierarchy lebih jelas dan
navigation tetap dapat digunakan pada layar sempit. Pertahankan routes,
design tokens, dan checkout behavior yang ada.
```

```text
$superior-logic $superior-docs

Tambahkan idempotency pada webhook pembayaran dengan test yang relevan.
Setelah terverifikasi, perbarui hanya dokumentasi arsitektur dan keputusan
yang berubah karena mekanisme tersebut.
```

## Hindari konflik mode

Jangan menggabungkan `superior-ui-audit` yang read-only dengan prompt yang meminta implementasi langsung. Pilih audit terlebih dahulu atau gunakan `superior-ui` untuk perubahan yang sudah diputuskan.
