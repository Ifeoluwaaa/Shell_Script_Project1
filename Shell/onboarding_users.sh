NAMES=$(<names.csv)

echo "$NAMES"

read $NAMES

getent passwd $NAMES > /dev/null


   if [ $? -ne 0 ]; then

	   for i in $NAMES;

	   do
		   sudo useradd -m $i;
		   sudo passwd $i;
		   root;
		   sudo usermod -G developers $i;
		   sudo mkdir /home/$i/.ssh/
		   cd /home/$i/.ssh/
		   sudo touch authorized_keys
		   sudo cp /home/ifeoluwa/.ssh/id_rsa.pub /home/$i/.ssh/authorized_keys
		   echo "Success. An account has been created for $i."
	   done

   else echo "Denied. An account already exists for $i"

   fi
 
