# Menggunakan `superior-docs`

Skill ini memelihara memori proyek yang tahan lintas sesi. Empat mode utamanya adalah Bootstrap, Synchronize, Reconstruct, dan Handoff.

## Pilih mode yang tepat

- **Bootstrap**: membuat fondasi docs untuk proyek yang belum memilikinya.
- **Synchronize**: menyelaraskan docs setelah perubahan implementasi.
- **Reconstruct**: membangun kembali konteks dari kode dan bukti yang tersebar.
- **Handoff**: mencatat status kerja, keputusan, risiko, dan langkah berikutnya.

Pisahkan fakta saat ini, keputusan yang diterima, riwayat, rencana, dan hal yang belum diketahui. Jangan menyajikan rencana sebagai keadaan implementasi.

## Alur kerja

1. Nyatakan mode dan cakupan proyek.
2. Baca kode, konfigurasi, tes, dan docs yang relevan sebagai bukti.
3. Perbarui indeks `docs/README.md` dan dokumen inti di `docs/structure-of-app/` sesuai kebutuhan.
4. Buat folder khusus hanya jika ada bukti dan kebutuhan nyata.
5. Validasi tautan, istilah, status implementasi, dan kebocoran secret.

## Contoh prompt

```text
$superior-docs Bootstrap dokumentasi proyek ini dari kode yang ada. Tandai ketidakpastian dan jangan mengarang keputusan.
```

```text
$superior-docs Synchronize docs setelah perubahan alur autentikasi pada branch ini.
```

## Kombinasi yang sesuai

Gunakan setelah `superior-ui`, `superior-logic`, atau perubahan durable lain jika arsitektur, keputusan, kontrak, atau cara kerja proyek ikut berubah. Untuk prosedur lengkap, lanjutkan ke [bootstrap docs](../../04-bootstrap-project-docs.md), [sesi baru](../../05-start-a-new-session.md), dan [maintenance](../../06-maintain-project-docs.md).

## Hasil yang perlu diperiksa

Dokumentasi harus dapat ditelusuri ke bukti, mudah dinavigasi dari indeks, dan jujur mengenai unknown. Jangan menyalin seluruh kode ke docs atau membuat folder kosong sebagai hiasan struktur.
