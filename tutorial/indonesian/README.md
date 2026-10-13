# Tutorial Superior

Folder ini berisi panduan penggunaan paket Superior untuk manusia. Tutorial tidak dimuat otomatis oleh Codex dan tidak menggantikan aturan di `AGENTS.md` atau instruksi dalam `SKILL.md`.

## Mulai cepat

1. [Instal Superior ke proyek](01-install-superior.md)
2. [Panggil skill secara eksplisit atau implisit](02-use-skills.md)
3. [Pahami prioritas instruksi](03-instruction-priority.md)
4. [Buat dokumentasi proyek pertama kali](04-bootstrap-project-docs.md)
5. [Mulai sesi baru dengan konteks lama](05-start-a-new-session.md)
6. [Sinkronkan docs setelah perubahan](06-maintain-project-docs.md)
7. [Gabungkan skill tanpa memuat semuanya](07-combine-skills.md)
8. [Diagnosis discovery dan routing](08-troubleshooting.md)

## Tutorial setiap skill

Gunakan [indeks tutorial per skill](skills/README.md) untuk memilih panduan berdasarkan pekerjaan yang sedang dilakukan. Setiap skill memiliki subfolder mandiri yang menjelaskan cakupan, alur kerja, contoh prompt, kombinasi, dan pemeriksaan hasil.

## Jalur belajar

### Pengguna baru

Baca tutorial 01-03, kemudian coba `$superior-ui` atau `$superior-logic` pada perubahan kecil.

### Dokumentasi dan maintenance lintas sesi

Baca tutorial 04-06. Ini menjelaskan pembagian tugas antara `superior-docs`, `docs/README.md`, dan session bootstrap di `AGENTS.md`.

### Maintainer paket Superior

Baca seluruh tutorial, lalu lihat `../principles/` untuk rationale paket dan `.agents/skills/` untuk instruksi runtime.

## Aturan praktis

- Gunakan pemanggilan eksplisit ketika hasil harus deterministik.
- Biarkan implicit routing bekerja untuk tugas biasa dengan tujuan yang jelas.
- Jangan memanggil semua skill sekaligus.
- Dokumentasi tutorial menjelaskan cara kerja; `AGENTS.md` dan `SKILL.md` yang mengatur perilaku agent.

## Referensi resmi

- [Build skills](https://learn.chatgpt.com/docs/build-skills) - struktur skill, discovery, dan explicit/implicit invocation.
- [Custom instructions with AGENTS.md](https://learn.chatgpt.com/docs/agent-configuration/agents-md) - urutan dan cakupan instruksi proyek.
