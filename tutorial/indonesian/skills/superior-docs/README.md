# Menggunakan `superior-docs`

Skill ini memelihara memori proyek yang tahan lintas sesi. Lima mode utamanya adalah Bootstrap, Record, Synchronize, Reconstruct, dan Handoff.

## Pilih mode yang tepat

- **Bootstrap**: membuat fondasi docs untuk proyek yang belum memilikinya.
- **Record**: mencatat otomatis outcome implementasi material yang telah diverifikasi kecuali pengguna menolaknya.
- **Synchronize**: menyelaraskan docs setelah perubahan implementasi.
- **Reconstruct**: membangun kembali konteks dari kode dan bukti yang tersebar.
- **Handoff**: mencatat status kerja, keputusan, risiko, dan langkah berikutnya.

Pisahkan fakta saat ini, keputusan yang diterima, riwayat, rencana, dan hal yang belum diketahui. Jangan menyajikan rencana sebagai keadaan implementasi.

## Alur kerja

1. Nyatakan mode dan cakupan proyek.
2. Baca kode, konfigurasi, tes, docs, status repository, dan diff final tugas sebagai bukti.
3. Untuk pekerjaan implementasi, buat atau perbarui catatan outcome di `docs/implementation-timeline/<feature-domain>/` dengan nama file bertanggal yang spesifik, lalu pelihara indeks root dan domainnya.
4. Perbarui dokumen inti di `docs/structure-of-app/` hanya ketika klaim current-state berubah.
5. Buat folder khusus lain hanya jika ada bukti dan kebutuhan nyata.
6. Validasi tautan, istilah, status implementasi, atribusi tugas, dan kebocoran secret.

## Contoh prompt

```text
$superior-docs Bootstrap dokumentasi proyek ini dari kode yang ada. Tandai ketidakpastian dan jangan mengarang keputusan.
```

```text
$superior-docs Synchronize docs setelah perubahan alur autentikasi pada branch ini.
```

## Kombinasi yang sesuai

Gunakan secara otomatis setelah `superior-ui`, `superior-logic`, atau skill lain menghasilkan perubahan implementasi material yang telah diverifikasi. Pengguna dapat menolak dokumentasi secara eksplisit untuk tugas tersebut. Untuk prosedur lengkap, lanjutkan ke [bootstrap docs](../../04-bootstrap-project-docs.md), [sesi baru](../../05-start-a-new-session.md), dan [maintenance](../../06-maintain-project-docs.md).

## Hasil yang perlu diperiksa

Dokumentasi harus dapat ditelusuri ke bukti, mudah dinavigasi dari indeks, dan jujur mengenai unknown. Pada dirty worktree, jangan mengatribusikan perubahan lama atau concurrent milik pengguna kepada tugas saat ini. Jangan menyalin seluruh kode ke docs atau membuat folder kosong sebagai hiasan struktur.
