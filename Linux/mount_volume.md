## How to mount a volume in Linux?

### Step-1: List block volumes
```sh
sudo lsblk -e7
```

Let's assume our block name is `/dev/xvdf` from the list

### Step-2: Create a filesystem

Note: 
- File system is useful for Linux OS to structure the files/directories
- Without file system, the OS will consider the disk as raw
- Raw disk is just a stream of bytes without any proper structure

```sh
sudo mkfs -t ext4 /dev/xvdf
```

### Step-3: Create mount point & mount the volume to the mount point
Note: 
- You can create mount points wherever you want; but mounting inside `/mnt` directory is recommended
```sh
sudo mkdir /mnt/data
sudo mount /dev/xvdf /mnt/data
```

### Step-4: Make the volume persistent (Optional)
Note: 
- Persistent volume will make the volume available even after server restart
```sh
sudo vi /etc/fstab
```

Add below
```sh
/dev/xvdf /mnt/data ext4 defaults,nofail 0 2
```

```txt
Note:
/dev/xvdf      /mnt/data      ext4                    defaults,nofail                                              0                         2
device name    mount point    file system type        defaults = standard mount options (read/write, etc.)         back up file system       file system check order
                              (common for linux)      nofail = system won't fail to boot if this mount fails       (0: No)                   1 = root filesystem
                                                                                                                                             2 = others
                                                                                                                                             0 = don't check
```
