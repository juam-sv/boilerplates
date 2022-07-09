# Annotations

### 1 - Download Oracle Database 19c from [HERE](https://www.oracle.com/database/technologies/oracle19c-linux-downloads.html)
<br>

```sh

╭─    ~/Downloads ▓▒░·····························································································································░▒▓ ✔  09:32:28 ─╮
╰─ ls *19c*                                                                                                                                                             ─╯
.rw-r--r-- 2,7G juamsv  8 jul 16:13  oracle-database-ee-19c-1.0-1.x86_64.rpm

╭─    ~/Downloads ▓▒░·····························································································································░▒▓ ✔  09:32:31 ─╮
╰─                                                                                                                                                                      ─╯
```
<br>

### 02 - Install the pre-install package from repository on your oracle linux. 
<br>

```sh
sudo dnf install -y oracle-database-preinstall-19c.x86_64
```

### 03 - Install the downloaded package
<br>

```sh
dnf -y localinstall oracle-database-ee-19c-1.0-1.x86_64.rpm
```

### 04 - Run the script configuration
<br>

```sh
sudo /etc/init.d/oracle-xe-21c configure
```

Links:
https://docs.oracle.com/en/database/oracle/oracle-database/21/xeinl/installing-oracle-database-xe.html

https://docs.oracle.com/en/database/oracle/oracle-database/21/xeinl/connecting-oracle-database-xeinl.html

https://docs.oracle.com/en/database/oracle/oracle-database/21/xeinl/starting-and-stopping-oracle-database.html

https://oracle-base.com/articles/19c/oracle-db-19c-installation-on-oracle-linux-8
