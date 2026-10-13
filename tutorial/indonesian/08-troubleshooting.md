# 08 — Troubleshooting Discovery dan Routing

## Skill tidak muncul

Periksa:

1. Folder skill berada di `.agents/skills/<nama-skill>/`.
2. Entry point bernama persis `SKILL.md`.
3. Frontmatter memiliki `name` dan `description`.
4. Nilai `name` sama dengan nama folder.
5. Codex dibuka dari directory yang jalurnya berada di bawah `.agents/skills` tersebut.
6. Tidak ada konfigurasi yang menonaktifkan skill.

Restart Codex jika perubahan baru belum terdeteksi.

## Skill yang salah dipilih

- Gunakan pemanggilan eksplisit `$superior-...`.
- Pastikan prompt menyebut outcome dan mode: build, audit, bootstrap, synchronize, atau review.
- Jangan menulis prompt terlalu umum seperti “rapikan semuanya.”
- Periksa apakah beberapa skill lokal memiliki `name` yang sama.

## Docs tidak dibaca pada sesi baru

Periksa:

- `AGENTS.md` berada di root repository atau parent directory yang dipindai;
- session bootstrap masih ada dan tidak ditimpa `AGENTS.override.md`;
- `docs/README.md` serta tiga dokumen inti menggunakan path yang benar;
- Codex dibuka pada repository yang tepat;
- ukuran gabungan instruksi proyek tidak melampaui konfigurasi yang berlaku.

Gunakan prompt diagnosis read-only:

```text
Ringkas AGENTS.md yang aktif, skills Superior yang terdeteksi, dan dokumen
session-bootstrap yang berhasil ditemukan. Jangan mengubah file.
```

## Dokumentasi terlalu besar atau stale

- Jadikan `docs/README.md` sebagai router, bukan ringkasan seluruh isi.
- Pindahkan detail kondisional ke topic guide.
- Hapus placeholder yang tidak mempunyai owner.
- Tandai dokumen historical atau proposed secara eksplisit.
- Jalankan `$superior-docs` dalam mode synchronize untuk scope yang terpengaruh saja.
