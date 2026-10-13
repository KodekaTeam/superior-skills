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
- Baseline umum berada di `AGENTS.md`; detail spesialis hanya dimuat ketika relevan.

## Struktur

```text
superior-skills/
|-- AGENTS.md
|-- INSTALL.md
|-- principles/
    |-- README.md
    |-- documentation-continuity.md
`-- .agents/
    `-- skills/
        |-- superior-ui/
        |-- superior-ui-audit/
        |-- superior-responsive/
        |-- superior-accessibility/
        |-- superior-copy/
        |-- superior-comments/
        |-- superior-logic/
        |-- superior-lean/
        `-- superior-docs/
```

## Cara menggunakan

Salin `AGENTS.md` dan `.agents/` ke root repository target. Jika repository sudah memiliki `AGENTS.md`, gabungkan bagian yang relevan tanpa menghapus perintah proyek, aturan domain, atau instruksi validasi yang sudah ada.

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

Brief dan rationale yang digunakan untuk mengembangkan workflow dokumentasi berada di `principles/`. Folder tersebut ditujukan untuk maintainer paket; instruksi runtime yang portable tetap berada di `.agents/skills/superior-docs/`.

Instruksi eksplisit pengguna dan aturan proyek yang lebih dekat selalu mengalahkan preferensi umum paket ini.
