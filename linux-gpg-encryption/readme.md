We have confidential data that needs to be transferred to a remote location, so we need to encrypt that data.We also need to decrypt data we received from a remote location in order to understand its content.

On storage server in Stratos Datacenter we have private and public keys stored /home/*_key.asc. Use those keys to perform the following actions.

Encrypt /home/encrypt_me.txt to /home/encrypted_me.asc.

Decrypt /home/decrypt_me.asc to /home/decrypted_me.txt. (Passphrase for decryption and encryption is kodekloud).


## STORAGE SERVER
    1. ssh natasha@ststor01
    2. sudo su -
    3. cd /home/
    4. ll                            # check all the files located in the home directory
    ```
    total 24
    drwx------ 1 ansible ansible 4096 Oct 15  2019 ansible
    -rw-r--r-- 1 root    root     155 Nov 29 16:26 decrypt_me.asc
    -rw-r--r-- 1 root    root      99 Nov 29 16:27 encrypt_me.txt
    drwx------ 1 natasha natasha 4096 Jan 12  2020 natasha
    -rw-r--r-- 1 root    root    3589 Nov 29 16:27 private_key.asc
    -rw-r--r-- 1 root    root    1722 Nov 29 16:27 public_key.asc
    ```
### import the gpg private and public keys
    5.  gpg --import public_key.asc   
    ```
    gpg: directory `/root/.gnupg' created
    gpg: new configuration file `/root/.gnupg/gpg.conf' created
    gpg: WARNING: options in `/root/.gnupg/gpg.conf' are not yet active during this run
    gpg: keyring `/root/.gnupg/secring.gpg' created
    gpg: keyring `/root/.gnupg/pubring.gpg' created
    gpg: /root/.gnupg/trustdb.gpg: trustdb created
    gpg: key CCE3AF51: public key "kodekloud <kodekloud@kodekloud.com>" imported
    gpg: Total number processed: 1
    gpg:               imported: 1  (RSA: 1)
    ```

    6. gpg --import private_key.asc
    ```
    gpg: key CCE3AF51: secret key imported
    gpg: key CCE3AF51: "kodekloud <kodekloud@kodekloud.com>" not changed
    gpg: Total number processed: 1
    gpg:              unchanged: 1
    gpg:       secret keys read: 1
    gpg:   secret keys imported: 1
    ```
### verify the keys are imported successully
    7.  gpg --list-keys
    ```
    /root/.gnupg/pubring.gpg
    ------------------------
    pub   2048R/CCE3AF51 2020-01-19
    uid                  kodekloud <kodekloud@kodekloud.com>
    sub   2048R/865C070D 2020-01-19
    ```
    8. gpg --list-secret-keys
    ```
    /root/.gnupg/secring.gpg
    ------------------------
    sec   2048R/CCE3AF51 2020-01-19
    uid                  kodekloud <kodekloud@kodekloud.com>
    ssb   2048R/865C070D 2020-01-19
    ```
    
### encrypt the file txt into asc
    9. gpg --encrypt -r kodekloud@kodekloud.com --armor < encrypt_me.txt  -o encrypted_me.asc
    ```
    gpg: 865C070D: There is no assurance this key belongs to the named user

    pub  2048R/865C070D 2020-01-19 kodekloud <kodekloud@kodekloud.com>
    Primary key fingerprint: FEA8 5011 C456 B5E9 AE5A  516F 8F17 F26E CCE3 AF51
    Subkey fingerprint: 7B4B 5CFC 5E4F B4B6 EEC0  83E5 DD6B 8506 865C 070D

    It is NOT certain that the key belongs to the person named
    in the user ID.  If you *really* know what you are doing,
    you may answer the next question with yes.

    Use this key anyway? (y/N) y
    ```
### decrypt the asc into txt
    10. gpg --decrypt decrypt_me.asc > decrypted_me.txt
    ```
    gpg: AES encrypted data
    gpg: encrypted with 1 passphrase
    ```

### check for the encrypted and decrypted files 
    11. ll
    ```
    total 32
    drwx------ 1 ansible ansible 4096 Oct 15  2019 ansible
    -rw-r--r-- 1 root    root      80 Nov 29 16:35 decrypted_me.txt
    -rw-r--r-- 1 root    root     155 Nov 29 16:26 decrypt_me.asc
    -rw-r--r-- 1 root    root     669 Nov 29 16:34 encrypted_me.asc
    -rw-r--r-- 1 root    root      99 Nov 29 16:27 encrypt_me.txt
    drwx------ 1 natasha natasha 4096 Jan 12  2020 natasha
    -rw-r--r-- 1 root    root    3589 Nov 29 16:27 private_key.asc
    -rw-r--r-- 1 root    root    1722 Nov 29 16:27 public_key.asc
    ```
### Check the output of the files
    12. cat decrypted_me.txt
    `Welcome to xFusionCorp Industries. This is KodeKloud System Administration Lab `
    13. cat decrypt_me.asc
    ```
    'h'??OoD+)??1RK*PH
    L1!f    21 ??ZDvpFBCV(\59.9??%Rv
    ```
    14. cat encrypt_me.txt
    ```
    My name is "My Name"

    My credit card number is 1234-5678-9012-3456

    The password for my phone is 42
    ```
    15. cat encrypted_me.asc
    ```
    -----BEGIN PGP MESSAGE-----
    Version: GnuPG v2.0.22 (GNU/Linux)

    hQEMA91rhQaGXAcNAQf/VLHXFOPwIMhIDMFkDFPk3XjeOqYvxLg3g1pNPiwlexrJ
    4PJ1/QaULM/q1j68cMUyTdka+FeBE9XKyKgE2wWxi/v89UyfZfj3Q0ydIAoZHSUG
    bvpGUVvHbT9aDHjJKI5w1zZYmt6LfejFsdD3UTKyAlPjPXxbDCDPPZpBXD800ZvK
    YXBvu2ew7zPlDs2g/XgSYxF7KCG/Z+4qyFLZBW/p1/yCj0VH1MfocJo5j7P9/Lp7
    WNVXmROkOc1mBuYE1ifvy1179ouuGG65YE5n9KmMPxojfv9zYUt+cdgaflF7V6C2
    k8FBMG3NCfHw0iElGNM66VtXIlfiizPYyw9cJWeb39KUASNmI+sIWb638+vmoTLy
    L3uPKWCWzyOiAK1lBduEMcR4DATPvE+Yx82siM00qOdAdZ/PKYJbyYr/kmHmyfkj
    r3vCPAe1zXhjjMjtSP3SekeJkFBI50pTj/xE4qlZ8K4/vU1SHYl+flEdUXpY72SZ
    cxj87AwoqZpUOCgHJDW/AMrhvtNZLT1IQQIBj6DsR1ef86sE5Q==
    =ZqT2
    -----END PGP MESSAGE-----
    ```