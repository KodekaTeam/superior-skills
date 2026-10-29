# Tutorial Per Skill

Indeks ini mencakup seluruh skill kanonis di `skills/`. Pilih skill yang paling langsung memiliki pekerjaan; tambahkan skill lain hanya ketika tugas memang melintasi batas tanggung jawab.

| Skill | Gunakan untuk | Panduan |
| --- | --- | --- |
| `superior-accessibility` | Semantik, keyboard, fokus, kontras, status, dan zoom | [Buka](superior-accessibility/README.md) |
| `superior-api-security` | Hardening REST API, boundary otorisasi, rate limiting, abuse control, dan verifikasi keamanan | [Buka](superior-api-security/README.md) |
| `superior-code-review` | Review berbasis evidence untuk diff, commit, branch, pull request, dan working tree | [Buka](superior-code-review/README.md) |
| `superior-comments` | Audit atau perapian komentar tanpa mengubah perilaku kode | [Buka](superior-comments/README.md) |
| `superior-copy` | Teks produk dan pemasaran yang terlihat pengguna | [Buka](superior-copy/README.md) |
| `superior-database` | Schema, query, index, transaction, migration, dan backfill | [Buka](superior-database/README.md) |
| `superior-debugging` | Diagnosis berbasis evidence untuk kegagalan reproducible, intermittent, dan runtime | [Buka](superior-debugging/README.md) |
| `superior-delivery` | CI/CD, artifact, release, promotion environment, rollout, dan rollback | [Buka](superior-delivery/README.md) |
| `superior-docs` | Pencatatan, curated implementation memory, sinkronisasi, rekonstruksi, dan handoff dokumentasi | [Buka](superior-docs/README.md) |
| `superior-lean` | Solusi paling kecil yang tetap lengkap dan benar | [Buka](superior-lean/README.md) |
| `superior-architecture` | Struktur proyek, tanggung jawab modul, dan batas dependensi | [Buka](superior-architecture/README.md) |
| `superior-logic` | API, state, data, validasi, dan aturan bisnis | [Buka](superior-logic/README.md) |
| `superior-performance` | Pengukuran, profiling, latency, throughput, resource, loading, dan capacity | [Buka](superior-performance/README.md) |
| `superior-responsive` | Reflow, overflow, navigasi adaptif, dan target sentuh | [Buka](superior-responsive/README.md) |
| `superior-reliability` | Service objective, resilience, degradation, recovery, dan kesiapan incident | [Buka](superior-reliability/README.md) |
| `superior-testing` | Strategi test, regresi, level test, fixture, dan flaky failure | [Buka](superior-testing/README.md) |
| `superior-ui` | Membangun atau memperbaiki antarmuka produk | [Buka](superior-ui/README.md) |
| `superior-ui-audit` | Audit visual read-only dengan temuan terprioritas | [Buka](superior-ui-audit/README.md) |
| `superior-ux` | Journey pengguna, arsitektur informasi, task flow, feedback, dan recovery | [Buka](superior-ux/README.md) |

## Cara memanggil

Pemanggilan eksplisit cocok ketika skill tertentu wajib dipakai:

```text
$superior-responsive Perbaiki layout halaman katalog pada viewport sempit.
```

Untuk routing implisit, jelaskan tujuan dan batas tugas secara konkret. Codex memilih skill berdasarkan deskripsinya. Jangan memanggil seluruh skill sekaligus; lihat [panduan kombinasi](../07-combine-skills.md).

Tutorial adalah panduan untuk pengguna. Perilaku runtime tetap ditentukan oleh `AGENTS.md` dan masing-masing `SKILL.md`.
