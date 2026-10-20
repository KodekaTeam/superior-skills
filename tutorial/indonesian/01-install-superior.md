# 01 — Instal Superior ke Proyek

## Tujuan

Membuat `AGENTS.md` dan seluruh skill Superior tersedia di repository target tanpa instalasi plugin.

## Struktur tujuan

```text
project/
|-- AGENTS.md
`-- .agents/
    `-- skills/
        |-- superior-ui/
        |-- superior-ux/
        |-- superior-code-review/
        |-- superior-database/
        |-- superior-debugging/
        |-- superior-delivery/
        |-- superior-performance/
        |-- superior-reliability/
        |-- superior-testing/
        |-- superior-docs/
        `-- ...
```

## Langkah

1. Buat `.agents/skills/` pada repository target, lalu salin seluruh folder dari directory root `skills/` milik paket Superior ke dalamnya.
2. Jika proyek belum memiliki `AGENTS.md`, salin `AGENTS.md` dari paket.
3. Jika proyek sudah memiliki `AGENTS.md`, gabungkan baseline Superior tanpa menghapus command, aturan domain, atau struktur proyek yang sudah ada.
4. Buka Codex dari root repository atau salah satu subfolder di dalam repository tersebut.
5. Periksa daftar skills atau coba pemanggilan eksplisit:

```text
$superior-docs Jelaskan mode yang tersedia tanpa mengubah file.
```

## Jangan lakukan

- Jangan menaruh `.agents/skills` di child directory yang tidak berada pada jalur dari working directory ke repository root.
- Jangan mengganti `AGENTS.md` proyek secara buta.
- Jangan mengubah `SKILL.md` menjadi `skill.md`; entrypoint menggunakan huruf kapital.

## Hasil yang diharapkan

Codex dapat menemukan skill bernama `superior-*`, dan baseline proyek dibaca sebelum agent mulai bekerja.

Untuk instalasi user-level, lihat [`../../INSTALL.md`](../../INSTALL.md).
