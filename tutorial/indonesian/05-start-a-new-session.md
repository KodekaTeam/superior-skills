# 05 — Memulai Sesi Baru dengan Konteks Lama

## Prasyarat

- `AGENTS.md` Superior sudah digabungkan ke root repository.
- `docs/README.md` dan tiga dokumen inti sudah tersedia.
- Codex dibuka dari repository yang benar.

## Perilaku otomatis

Session bootstrap di `AGENTS.md` mengarahkan agent untuk membaca:

1. root `README.md`;
2. `docs/README.md`;
3. `PROJECT_CONTEXT.md`;
4. `ARCHITECTURE.md`;
5. `DECISIONS.md`;
6. dokumen lanjutan yang relevan dengan tugas saat ini.

Anda tidak perlu lagi menempelkan prompt panjang yang sama pada setiap sesi maintenance.

## Prompt pembuka opsional

Jika Anda hanya ingin menguji pemahaman sebelum memberi tugas:

```text
Baca konteks proyek sesuai session bootstrap di AGENTS.md.
Ringkas arsitektur, keputusan aktif, batasan saat ini, dan dokumen
lanjutan yang relevan. Jangan mengubah file; tunggu instruksi berikutnya.
```

## Batas penting

- Agent tidak membaca seluruh `docs/` tanpa alasan.
- Dokumen yang dirujuk harus tetap akurat; session bootstrap bukan jaminan bahwa isi docs benar.
- Jika docs bertentangan dengan kode aktif, agent harus memverifikasi implementasi dan menandai dokumentasi yang stale.
- Chat lama bukan sumber kebenaran kecuali hasilnya sudah dicatat dalam repository.
