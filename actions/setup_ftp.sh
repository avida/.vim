ftp_folder=/home/dima/share

config="

anonymous_enable=YES
local_enable=YES
anon_root=$ftp_folder
write_enable=YES
anon_upload_enable=YES
anon_mkdir_write_enable=YES
anon_other_write_enable=YES
allow_writeable_chroot=YES
local_root=/home/$USER
chown_username=dima
anon_umask=000
"
function setup_ftp {
   sudo apt install vsftpd
   echo "$config"  >> /etc/vsfrpd.conf
}
setup_ftp
