.MODEL SMALL
.CODE
ORG 100h
JMP Mulai
;Variabel
nama    DB 0dh, 0ah, 0dh, 0ah, "Masukan Nama Anda : ", '$'
id      DB 0dh, 0ah, "Masukan ID Anda : ", '$'
van1       DB "PROGRAM Registrasi Member Gym", 0dh, 0ah, "----------------------------", '$' 
van2   DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Selamat Datang Di Menu Utama ...", '$' 
van3   DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Menu Yang tersedia : ", 0dh, 0ah 
        DB "=====================", 0dh, 0ah
        DB "=   1. Pendaftaran Member Baru     =", 0dh, 0ah
        DB "=   2. Cek Status Member           =", 0dh, 0ah
        DB "=   3. Pemesanan Personal Trainer  =", 0dh, 0ah
        DB "=   4. Cek Jadwal Kelas            =", 0dh, 0ah 
        DB 0dh, 0ah, "Menu yang ingin dipilih ? ", '$'                                                                                                                                           
van4    DB 0dh, 0ah, "Menu Ditemukan", '$'
van5    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "========================= PENCARIAN SELESAI =====================", 0dh, 0ah,
        DB "Silahkan keluar dari pencarian", '$'
        
van6    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Ingin Menuju menu lain ? (Y, N)", '$'
van7    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Terimakasih Telah Login....", '$'
error   DB 0dh, 0ah, "Masukan Kode Dengan Benar", '$'
mii1    DB 0dh, 0ah, 0dh, 0ah, "====== Pendaftaran Member Baru ======", 0dh, 0ah, "Silahkan Masukkan Data Baru :", 0dh, 0ah, '$' 
mii2    DB 0dh, 0ah, 0dh, 0ah, "====== Cek Status Member ======", 0dh, 0ah, "Status Anda : Aktif", 0dh, 0ah, '$'
mii3    DB 0dh, 0ah, 0dh, 0ah, "====== Pemesanan Personal Trainer ======", 0dh, 0ah, "Silahkan Masukkan Jadwal :", 0dh, 0ah, '$' 
mii4    DB 0dh, 0ah, 0dh, 0ah, "====== Cek Jadwal Kelas ======", 0dh, 0ah, "Silahkan Masukkan Waktu Kelas :",0dh, 0ah, '$'
mii5    DB 0dh, 0ah, 0dh, 0ah, "Ketik 'E' Untuk Mencetak Bukti dan Keluar dari program.... ", '$'

tampung_nama DB 30, ?, 30 dup(?)
tampung_id DB 30, ?, 30 dup(?)
                
Mulai:
    MOV ah, 09
    LEA dx, van1
    INT 21h
    
    MOV ah, 09
    LEA dx, nama
    INT 21h
    
    MOV ah, 0ah
    LEA dx, tampung_nama
    INT 21h
    PUSH dx
    
    MOV ah, 09
    LEA dx, id
    INT 21h
    
    MOV ah, 0ah
    LEA dx, tampung_id
    INT 21h
    PUSH dx
    
    MOV ah, 09
    LEA dx, van2
    INT 21h
    
Mulai2:
    MOV ah, 09
    LEA dx, van3
    INT 21h
    
Proses:
    MOV ah, 01
    INT 21h
    
    CMP al, '1'
    JE merk_1
    
    CMP al, '2'
    JE merk_2
    
    CMP al, '3'
    JE merk_3
    
    CMP al, '4'
    JE merk_4
 
    
    JNE psn_error
    
Proses2:
    MOV ah, 09
    LEA dx, van6
    INT 21h
    MOV ah, 01
    INT 21h
    
    CMP al, 'Y'
    JE cari_lagi
    
    CMP al, 'y'
    JE cari_lagi
    
    CMP al, 'N'
    JE cari_selesai
    
    CMP al, 'n'
    JE cari_selesai
    
    JNE psn_error2

merk_1:
     MOV ah, 09
     LEA dx, van4
     INT 21h
     
     MOV ah, 09
     LEA dx, mii1
     INT 21h   
     
     JMP Proses2
     
merk_2:
     MOV ah, 09
     LEA dx, van4
     INT 21h
     
     MOV ah, 09
     LEA dx, mii2
     INT 21h   
     
     JMP Proses2

merk_3:
     MOV ah, 09
     LEA dx, van4
     INT 21h
     
     MOV ah, 09
     LEA dx, mii3
     INT 21h   
     
     JMP Proses2 
     
merk_4:
     MOV ah, 09
     LEA dx, van4
     INT 21h
     
     MOV ah, 09
     LEA dx, mii4
     INT 21h   
     
     JMP Proses2    
     
merk_5:
     MOV ah, 09
     LEA dx, van4
     INT 21h
     
     MOV ah, 09
     LEA dx, mii5
     INT 21h   
     
     JMP Proses2
                 

cari_lagi:
    JMP Mulai2

cari_selesai:
    MOV ah, 09
    LEA dx, van5
    INT 21h
    JMP Konfirmasi

psn_error:
    MOV ah, 09
    LEA dx, error
    INT 21h
    
    JMP Mulai2

psn_error2:
    MOV ah, 09
    LEA dx, error
    INT 21h
    
    JMP Proses2

Konfirmasi:
    MOV ah, 09
    LEA dx, mii4
    INT 21h
    MOV ah, 01
    INT 21h
    
    CMP al, 'E'
    JE Exit
    
    CMP al, 'e'
    JE Exit
    
    JNE psn_error
    

 
JMP Exit

Exit:
    MOV ah, 09
    LEA dx, van7
    INT 21h 
    
    INT 20h
     
RET
