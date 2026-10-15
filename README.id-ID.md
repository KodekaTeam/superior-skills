<p align="center">
  <img src="assets/profile.png" alt="Superior" width="240">
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/github/license/KodekaTeam/superior-skills.svg" alt="License: MIT"></a>
  <a href="https://github.com/KodekaTeam/superior-skills/releases"><img src="https://img.shields.io/github/v/release/KodekaTeam/superior-skills?label=version&color=1f6feb" alt="Version"></a>
</p>

<h1 align="center">Superior Skills</h1>

<p align="center">
`superior-skills` adalah paket instruksi reusable untuk menghasilkan perubahan software yang kontekstual, dapat dibuktikan, dan tidak terasa seperti keluaran template. Paket ini bukan kumpulan larangan gaya. Prinsip utamanya adalah membuat keputusan dari bukti proyek, menjaga fungsi nyata, lalu memverifikasi hasil yang berubah.
</p>


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

## Instalasi

Superior didistribusikan sebagai plugin portable yang hanya berisi skills. Pilih host yang digunakan, lalu mulai sesi agent baru setelah instalasi.

### Codex

```shell
codex plugin marketplace add KodekaTeam/superior-skills
codex plugin add superior-skills@superior-skills
```

Repository juga dapat ditambahkan melalui UI marketplace plugin Codex, kemudian pilih **Superior Skills**.

### Cursor

Buka **Cursor Settings → Plugins**, masukkan URL repository berikut pada kotak pencarian plugin, lalu instal **Superior Skills**:

```text
https://github.com/KodekaTeam/superior-skills
```

### Claude Code

Jalankan perintah berikut di dalam Claude Code:

```text
/plugin marketplace add KodekaTeam/superior-skills
/plugin install superior-skills@superior-skills
```

### Agent Skills standalone

Untuk agent yang belum mendukung plugin, salin folder-folder di dalam `skills/` ke direktori skills tingkat proyek atau pengguna milik agent tersebut. Pada layout proyek yang kompatibel dengan Codex, direktori yang umum digunakan adalah `.agents/skills/`.

Jika target sudah memiliki `AGENTS.md` atau `CLAUDE.md`, gabungkan bagian yang relevan tanpa mengganti perintah dan aturan khusus proyek.

Lihat [`INSTALL.md`](INSTALL.md) untuk instalasi pengembangan lokal, update, penghapusan, dan troubleshooting. Panduan langkah demi langkah juga tersedia di [`tutorial/indonesian/`](tutorial/indonesian/README.md).

## Update

Instalasi plugin menyimpan salinan tersendiri di cache host. Refresh marketplace, update plugin jika host menyediakan perintah terpisah, lalu mulai sesi baru.

### Codex

```shell
codex plugin marketplace upgrade superior-skills
```

### Claude Code

```shell
claude plugin marketplace update superior-skills
claude plugin update superior-skills@superior-skills
```

### Cursor

Buka **Cursor Settings → Plugins**, cari **Superior Skills**, lalu gunakan aksi update atau reinstall yang tersedia. Setelah itu jalankan **Developer: Reload Window**.

Salinan standalone tidak diperbarui secara otomatis; ganti folder skill `superior-*` yang terinstal dengan folder terbaru dari repository ini.

## Cara menggunakan

Skills dipilih otomatis berdasarkan konteks tugas atau dapat dipanggil secara eksplisit, misalnya `$superior-code-review`, `$superior-delivery`, `$superior-reliability`, atau `$superior-docs`. Entry point portable berada di [`plugin.json`](plugin.json), sedangkan definisi skill kanonis berada di [`skills/`](skills/).

## FAQ

### Apakah Superior memasang MCP server atau membutuhkan credential?

Tidak. Superior saat ini merupakan plugin skills-only. Paket ini tidak memasang MCP server, lifecycle hook, credential, maupun layanan eksternal.

### Di mana skills diinstal?

Host plugin biasanya memasang paket plugin ke cache lalu membaca direktori `skills/` di root paket tersebut. Host tidak harus membuat `.agents/skills/` pada setiap proyek target. Path `.agents/skills/` hanya digunakan sebagai fallback standalone.

### Mengapa skill yang baru diperbarui belum aktif?

Refresh atau update marketplace, kemudian mulai percakapan atau sesi agent baru. Sesi yang sedang berjalan mungkin masih memakai versi skill yang dimuat saat sesi dimulai.

### Apakah Superior otomatis menulis dokumentasi implementasi?

Untuk pekerjaan implementasi material yang telah diverifikasi, `superior-docs` mencatat entri terfokus di `docs/implementation-timeline/<fitur>/` ketika sesuai. Permintaan eksplisit untuk tidak membuat dokumentasi selalu diprioritaskan.

### Bisakah hanya satu skill yang diinstal?

Instalasi plugin memasang seluruh paket agar routing dan referensi bersama tetap konsisten. Untuk pemasangan standalone, folder `superior-*` tertentu dapat disalin secara terpisah, tetapi seluruh file yang dirujuk skill tersebut juga harus ikut disalin.

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

Ketika `superior-docs` mencatat pekerjaan implementasi, skill tersebut membuat dan memelihara struktur `docs/implementation-timeline/` yang terindeks di repository target. Catatan internal maintainer dalam paket ini memang tidak dipublikasikan.

Instruksi eksplisit pengguna dan aturan proyek yang lebih dekat selalu mengalahkan preferensi umum paket ini.
