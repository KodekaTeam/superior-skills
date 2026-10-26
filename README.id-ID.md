<p align="center">
  <img src="assets/profile.png" alt="Superior" width="240">
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/github/license/KodekaTeam/superior-skills.svg" alt="License: MIT"></a>
  <a href="https://github.com/KodekaTeam/superior-skills/releases"><img src="https://img.shields.io/github/v/release/KodekaTeam/superior-skills?label=version&color=1f6feb" alt="Version"></a>
  <a href="https://skills.sh/kodekateam/superior-skills"><img src="https://skills.sh/b/kodekateam/superior-skills" alt="Skills.sh"></a>
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
- Satu struktur kanonis `skills/` digunakan untuk instalasi plugin native maupun standalone pada coding agent yang didukung.
- Baseline umum berada di `AGENTS.md`; detail spesialis hanya dimuat ketika relevan.
- Pekerjaan implementasi material yang telah diverifikasi dicatat otomatis dalam `docs/implementation-timeline/` yang terindeks, dengan intent yang diterima dan pengetahuan maintenance dikurasi ke guide atau decision yang sudah ada ketika berguna, kecuali pengguna menolaknya.

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
|-- plugin.json                # Agent Plugin portable dan marker Antigravity
|-- gemini-extension.json      # Extension Gemini CLI
|-- kimi.plugin.json           # Plugin Kimi Code
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

Superior dapat dipasang sebagai Agent Skills standalone melalui Skills CLI atau sebagai plugin portable melalui host yang didukung. Mulai sesi agent baru setelah instalasi.

### Skills CLI

Instal dari [skills.sh](https://skills.sh/kodekateam/superior-skills) menggunakan `npx`:

```shell
npx skills add KodekaTeam/superior-skills
```

Installer interaktif memungkinkan pemilihan skill, target agent, serta scope proyek atau global. Gunakan pilihan khusus host di bawah jika ingin memasang paket plugin.

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

### Gemini CLI

Instal repository sebagai extension native Gemini, kemudian mulai sesi baru:

```shell
gemini extensions install https://github.com/KodekaTeam/superior-skills
```

### Google Antigravity

Antigravity CLI dapat memasang repository sebagai paket skill:

```shell
agy plugin install https://github.com/KodekaTeam/superior-skills
```

Untuk Antigravity IDE, salin paket lengkap ke `.agents/plugins/superior-skills/` untuk scope workspace atau `~/.gemini/config/plugins/superior-skills/` untuk scope global.

### Kimi Code

Instal repository melalui plugin manager Kimi Code, kemudian jalankan `/reload` atau mulai sesi baru:

```text
/plugins install https://github.com/KodekaTeam/superior-skills
```

### Cline, Muse Code, dan Hermes Agent

- **Cline:** gunakan Skills CLI dan pilih Cline, atau salin folder skill yang dipilih ke `.cline/skills/` atau `~/.cline/skills/`.
- **Muse Code:** salin skill ke `.agents/skills/`, atau impor instalasi Codex yang sudah ada dengan `muse skills import --from codex`.
- **Hermes Agent:** cari dan instal skill Superior secara individual melalui sumber `skills-sh` menggunakan `hermes skills search superior --source skills-sh`.

### Agent Skills standalone

Untuk agent yang belum mendukung plugin, salin folder-folder di dalam `skills/` ke direktori skills tingkat proyek atau pengguna milik agent tersebut. Pada layout proyek yang kompatibel dengan Codex, direktori yang umum digunakan adalah `.agents/skills/`.

Jika target sudah memiliki `AGENTS.md` atau `CLAUDE.md`, gabungkan bagian yang relevan tanpa mengganti perintah dan aturan khusus proyek.

Lihat [`INSTALL.md`](INSTALL.md) untuk instalasi pengembangan lokal, update, penghapusan, dan troubleshooting. Panduan langkah demi langkah juga tersedia di [`tutorial/indonesian/`](tutorial/indonesian/README.md).

## Update

Gunakan metode update yang sesuai dengan instalasinya. Instalasi plugin menyimpan salinan tersendiri di cache host, jadi refresh marketplace dan mulai sesi baru setelahnya.

### Skills CLI

```shell
npx skills update
```

### Codex

```shell
codex plugin marketplace upgrade superior-skills
```

### Claude Code

```shell
claude plugin marketplace update superior-skills
claude plugin update superior-skills@superior-skills
```

### Gemini CLI

```shell
gemini extensions update superior-skills
```

Mulai ulang Gemini CLI setelah extension diperbarui.

### Google Antigravity

Perbarui plugin melalui plugin manager Antigravity. Untuk paket IDE yang disalin manual, ganti direktori plugin `superior-skills` dengan isi repository terbaru.

### Kimi Code

Buka `/plugins`, pilih **Superior Skills**, lalu gunakan aksi update yang tersedia. Jalankan `/reload` setelahnya.

### Cursor

Buka **Cursor Settings → Plugins**, cari **Superior Skills**, lalu gunakan aksi update atau reinstall yang tersedia. Setelah itu jalankan **Developer: Reload Window**.

Salinan standalone tidak diperbarui secara otomatis; ganti folder skill `superior-*` yang terinstal dengan folder terbaru dari repository ini.

## Cara menggunakan

Skills dipilih otomatis berdasarkan konteks tugas atau dapat dipanggil secara eksplisit, misalnya `$superior-ux`, `$superior-code-review`, `$superior-delivery`, atau `$superior-docs`. Entry point portable berada di [`plugin.json`](plugin.json), sedangkan definisi skill kanonis berada di [`skills/`](skills/).

## FAQ

### Apakah Superior memasang MCP server atau membutuhkan credential?

Tidak. Superior saat ini merupakan plugin skills-only. Paket ini tidak memasang MCP server, lifecycle hook, credential, maupun layanan eksternal.

### Di mana skills diinstal?

Host plugin biasanya memasang paket ke cache lalu membaca direktori `skills/` di root paket tersebut. Host standalone membaca skill yang disalin ke direktori proyek atau pengguna masing-masing, seperti `.agents/skills/`, `.cline/skills/`, atau `~/.hermes/skills/`.

### Mengapa skill yang baru diperbarui belum aktif?

Refresh atau update marketplace, kemudian mulai percakapan atau sesi agent baru. Sesi yang sedang berjalan mungkin masih memakai versi skill yang dimuat saat sesi dimulai.

### Apakah Superior otomatis menulis dokumentasi implementasi?

Untuk pekerjaan implementasi material yang telah diverifikasi, `superior-docs` mencatat entri terfokus di `docs/implementation-timeline/<fitur>/` ketika sesuai. Skill ini juga dapat memperbarui implementation guide atau decision ketika contract fitur, criteria, invariant, atau jalur maintenance yang aman berubah. Prompt mentah, transkrip chat, dan hidden reasoning tidak disimpan. Permintaan eksplisit untuk tidak membuat dokumentasi selalu diprioritaskan.

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
