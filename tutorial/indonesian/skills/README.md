# Tutorial Per Skill

Indeks ini mencakup seluruh skill yang tersedia di `.agents/skills/`. Pilih skill yang paling langsung memiliki pekerjaan; tambahkan skill lain hanya ketika tugas memang melintasi batas tanggung jawab.

| Skill | Gunakan untuk | Panduan |
| --- | --- | --- |
| `superior-accessibility` | Semantik, keyboard, fokus, kontras, status, dan zoom | [Buka](superior-accessibility/README.md) |
| `superior-comments` | Audit atau perapian komentar tanpa mengubah perilaku kode | [Buka](superior-comments/README.md) |
| `superior-copy` | Teks produk dan pemasaran yang terlihat pengguna | [Buka](superior-copy/README.md) |
| `superior-docs` | Bootstrap, sinkronisasi, rekonstruksi, dan handoff dokumentasi | [Buka](superior-docs/README.md) |
| `superior-lean` | Solusi paling kecil yang tetap lengkap dan benar | [Buka](superior-lean/README.md) |
| `superior-logic` | API, state, data, validasi, dan aturan bisnis | [Buka](superior-logic/README.md) |
| `superior-responsive` | Reflow, overflow, navigasi adaptif, dan target sentuh | [Buka](superior-responsive/README.md) |
| `superior-ui` | Membangun atau memperbaiki antarmuka produk | [Buka](superior-ui/README.md) |
| `superior-ui-audit` | Audit visual read-only dengan temuan terprioritas | [Buka](superior-ui-audit/README.md) |

## Cara memanggil

Pemanggilan eksplisit cocok ketika skill tertentu wajib dipakai:

```text
$superior-responsive Perbaiki layout halaman katalog pada viewport sempit.
```

Untuk routing implisit, jelaskan tujuan dan batas tugas secara konkret. Codex memilih skill berdasarkan deskripsinya. Jangan memanggil seluruh skill sekaligus; lihat [panduan kombinasi](../07-combine-skills.md).

Tutorial adalah panduan untuk pengguna. Perilaku runtime tetap ditentukan oleh `AGENTS.md` dan masing-masing `SKILL.md`.
