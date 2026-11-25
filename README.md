# Beauty Skincare — E-Commerce Web Application

Aplikasi web toko online (*e-commerce*) produk perawatan kulit (*skincare*) berbasis PHP Native dan MySQL. Sistem ini menyediakan pengalaman belanja lengkap bagi pelanggan—mulai dari pencarian produk secara real-time, filter kategori, wishlist, keranjang belanja, hingga proses checkout—serta panel dashboard khusus admin untuk mengelola produk, kategori, dan status pesanan pelanggan.

* **Live Website:** <http://nayanadia.42web.io/Beauty-Skincare/index.php>
* **Repository:** <https://github.com/nyndaa/Beauty-Skincare>

---

## Fitur Utama

### Halaman Pelanggan (Storefront)
* **Katalog Produk & Flash Sale:** Menampilkan daftar produk terlaris lengkap dengan harga, stok, rating, dan penghitung waktu mundur (*countdown*) promo.
* **Filter Kategori & Pencarian Real-Time (AJAX):** Pencarian produk berdasarkan nama maupun deskripsi secara langsung tanpa memuat ulang halaman (`search.php`), serta penyaringan berdasarkan kategori skincare.
* **Wishlist & Keranjang Belanja:** Menambah, menghapus, dan memperbarui jumlah kuantitas produk di keranjang (`cart.php`) dengan kalkulasi subtotal otomatis.
* **Checkout & Pembaruan Stok Otomatis:** Formulir pemesanan pelanggan (`checkout.php`) yang otomatis mencatat rincian transaksi ke database dan mengurangi stok produk yang dibeli.

### Halaman Admin (Back-Office)
* **Autentikasi Admin:** Sistem login berbasis sesi (`login.php` & `logout.php`) untuk mengamankan akses pengelolaan toko.
* **Dashboard Ringkasan:** Menampilkan statistik total produk, total kategori, total pesanan masuk, dan daftar pesanan terbaru (`admin/dashboard.php`).
* **Manajemen Produk & Kategori (CRUD):** Tambah, ubah, dan hapus data produk beserta unggahan gambarnya (`admin/produk.php`, `admin/kategori.php`).
* **Manajemen Pesanan:** Melihat detail item yang dibeli pelanggan dan memperbarui status pengiriman pesanan (`admin/pesanan.php`, `admin/update_status.php`).

---

## Akun Demo Admin

Untuk mengakses halaman administrator melalui menu **Admin** atau langsung ke `/login.php`:

* **URL Login:** <http://nayanadia.42web.io/Beauty-Skincare/login.php>
* **Username:** `admin`
* **Password:** `admin123`

---

## Teknologi yang Digunakan

* **Backend:** PHP Native (MySQLi)
* **Frontend:** HTML5, CSS3 (`assets/style.css`), Vanilla JavaScript (Fetch API / AJAX)
* **Database:** MySQL / MariaDB
* **Ikon & Aset:** Font Awesome 6
* **Hosting & Deployment:** InfinityFree (Apache + MySQL)

---

## Struktur Proyek

```text
Beauty-Skincare/
├── admin/                      # Halaman panel administrator
│   ├── dashboard.php           # Ringkasan statistik & pesanan terbaru
│   ├── detail_pesanan.php      # Rincian item per transaksi
│   ├── edit_kategori.php       # Form ubah kategori
│   ├── edit_produk.php         # Form ubah produk
│   ├── kategori.php            # Daftar & kelola kategori
│   ├── pesanan.php             # Daftar pesanan masuk
│   ├── produk.php              # Daftar & kelola produk
│   ├── tambah_kategori.php     # Form tambah kategori baru
│   ├── tambah_produk.php       # Form tambah produk baru
│   └── update_status.php       # Pembaruan status pesanan
├── assets/
│   └── style.css               # Stylesheet utama aplikasi
├── images/                     # Aset gambar produk (green, pink, purple) & logo
├── procces/                    # Skrip pemrosesan form backend
│   ├── process_category.php
│   ├── process_order.php
│   └── process_product.php
├── beautyskincare.sql          # File dump struktur & data database MySQL
├── cart.php                    # Halaman keranjang belanja
├── checkout.php                # Halaman proses checkout pesanan
├── connect.php                 # Konfigurasi koneksi database MySQL (diabaikan oleh Git)
├── index.php                   # Halaman utama toko (Storefront)
├── login.php                   # Halaman login admin
├── logout.php                  # Skrip keluar sesi admin
├── search.php                  # Endpoint pencarian produk AJAX
└── wishlist.php                # Pengelolaan daftar keinginan (wishlist)
```

---

## Cara Menjalankan di Lokal

1. **Clone repositori ini:**
   ```bash
   git clone https://github.com/nyndaa/Beauty-Skincare.git
   cd Beauty-Skincare
   ```

2. **Siapkan Database MySQL:**
   * Jalankan layanan **MySQL** melalui XAMPP Control Panel.
   * Buka `http://localhost/phpmyadmin`, buat database baru bernama `beautyskincare`, lalu **Import** file `beautyskincare.sql`.

3. **Buat File Konfigurasi Koneksi (`connect.php`):**
   Karena `connect.php` dikecualikan melalui `.gitignore` demi keamanan kredensial, buat file `connect.php` di folder utama proyek dengan isi berikut:
   ```php
   <?php
   $connect = mysqli_connect(
       "localhost",
       "root",
       "",
       "beautyskincare"
   );

   if (!$connect) {
       die("Koneksi gagal : " . mysqli_connect_error());
   }
   ?>
   ```

4. **Jalankan Server Lokal:**
   * Jika folder proyek berada di dalam `C:\xampp\htdocs\Beauty-Skincare`, nyalakan **Apache** di XAMPP lalu buka `http://localhost/Beauty-Skincare`.
   * Jika folder proyek berada di direktori lain, jalankan server PHP bawaan melalui terminal:
     ```bash
     php -S localhost:8000
     ```
     Kemudian buka `http://localhost:8000` di browser.

---

## Pengembang

* **Raharjian Sustanadia Wijayanti** ([@nyndaa](https://github.com/nyndaa))