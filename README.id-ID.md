<p align="center">
  <img src="assets/profile.png" alt="Superior" width="240">
</p>

# Superior

`superior-skills` adalah paket instruksi reusable untuk menghasilkan perubahan software yang kontekstual, dapat dibuktikan, dan tidak terasa seperti keluaran template. Paket ini bukan kumpulan larangan gaya. Prinsip utamanya adalah membuat keputusan dari bukti proyek, menjaga fungsi nyata, lalu memverifikasi hasil yang berubah.

## Perbedaan utama

- Routing dibagi berdasarkan jenis pekerjaan, bukan daftar anti-pattern yang saling tumpang tindih.
- Pembuatan UI dan audit UI dipisahkan agar permintaan implementasi tidak berubah menjadi audit read-only.
- Panduan visual yang panjang menggunakan progressive disclosure melalui `references/`.
- Nama dan description setiap skill dibuat spesifik agar implicit invocation lebih akurat.
- Satu struktur kanonis `skills/` dipaketkan untuk Codex, Cursor, dan Claude Code.
- Baseline umum berada di `AGENTS.md`; detail spesialis hanya dimuat ketika relevan.
- Pekerjaan implementasi material yang telah diverifikasi dicatat otomatis dalam `docs/implementation-timeline/` yang terindeks, kecuali pengguna menolaknya.

## Struktur

```text
superior-skills/
|-- VERSION
|-- CHANGELOG.md
|-- CODE_OF_CONDUCT.md
|-- CONTRIBUTING.md
|-- SECURITY.md
|-- LICENSE
|-- AGENTS.md
|-- CLAUDE.md
|-- INSTALL.md
|-- plugin.json
|-- skills/                    # Skill portable kanonis
|-- scripts/                   # Validasi paket
|-- .codex-plugin/             # Manifest kompatibilitas Codex
|-- .cursor-plugin/            # Manifest dan marketplace repository Cursor
|-- .claude-plugin/            # Manifest dan marketplace Claude Code
|-- principles/
|   |-- README.md
|   `-- documentation-continuity.md
`-- .agents/
    `-- plugins/               # Marketplace repository Codex
```

## Komunitas dan tata kelola

- [Panduan kontribusi](CONTRIBUTING.md)
- [Kode Etik](CODE_OF_CONDUCT.md)
- [Kebijakan keamanan](SECURITY.md)
- [Lisensi MIT](LICENSE)

## Cara menggunakan

Instal repository ini sebagai plugin di Codex, Cursor, atau Claude Code dengan mengikuti petunjuk per platform di [`INSTALL.md`](INSTALL.md). Entry point portable berada di [`plugin.json`](plugin.json), sedangkan definisi skill kanonis berada di [`skills/`](skills/).

Instalasi standalone tetap didukung: salin folder-folder di dalam `skills/` ke `.agents/skills/` pada repository target. Jika repository sudah memiliki `AGENTS.md`, gabungkan bagian yang relevan tanpa menghapus perintah proyek, aturan domain, atau instruksi validasi yang sudah ada.

Skills dapat dipanggil secara eksplisit, misalnya `$superior-ui`, tetapi description-nya juga dirancang untuk pemilihan otomatis. Detail instalasi tersedia di `INSTALL.md`.

Panduan langkah demi langkah tersedia di [`tutorial/indonesian/`](tutorial/indonesian/README.md), mulai dari instalasi dan routing hingga bootstrap dokumentasi serta kontinuitas sesi.

## Prinsip hasil

Superior mengutamakan:

- bukti lokal sebelum preferensi generik;
- hierarchy dan alur tugas sebelum dekorasi;
- data dan klaim yang jujur;
- kontrol dan state yang benar-benar bekerja;
- aksesibilitas dan responsive behavior sebagai bagian dari kualitas;
- solusi kecil yang tetap menjaga correctness;
- verifikasi yang sesuai dengan risiko perubahan.

Brief dan rationale yang digunakan untuk mengembangkan workflow dokumentasi berada di `principles/`. Folder tersebut ditujukan untuk maintainer paket; instruksi runtime portable berada di `skills/superior-docs/`.

## Validasi paket

Jalankan `pwsh -File scripts/validate-plugin.ps1` sebelum publikasi.

Riwayat implementasi diindeks dalam [`docs/implementation-timeline/`](docs/implementation-timeline/README.md).

Instruksi eksplisit pengguna dan aturan proyek yang lebih dekat selalu mengalahkan preferensi umum paket ini.
