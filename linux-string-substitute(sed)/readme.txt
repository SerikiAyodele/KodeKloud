There is some data on Nautilus App Server 1 in Stratos DC. Data needs to be altered in several of the files. 
On Nautilus App Server 1, alter the /home/BSD.txt file as per details given below:

a. Delete all lines containing word following and save results in /home/BSD_DELETE.txt file. (Please be aware of case sensitivity)
b. Replace all occurrence of word and to their and save results in /home/BSD_REPLACE.txt file.

Note: Let's say you are asked to replace word to with from. In that case, make sure not to alter any words containing this string; for example upto, contributor etc.

APP SERVER 1
=============
    1. ll /home/
    2. cat /home/BSD.txt |grep following
    3. sed '/\<following\>/d' /home/BSD.txt > /home/BSD_DELETE.txt
    4. cat /home/BSD_DELETE.txt |grep and
    5. cat /home/BSD.txt |grep their
    6. sed 's/\band\b/their/g' /home/BSD.txt > /home/BSD_REPLACE.txt
    7. cat /home/BSD_REPLACE.txt |grep and
    8. cat /home/BSD_REPLACE.txt |grep their