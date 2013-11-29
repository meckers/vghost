VENGEFUL GHOST README

1. Make sure that the folder "vg" is in an accessible location, for example

	usr/local


2. Make sure that the script file (vghost.sh) is chmodded to allow execution:

	$ chmod +x vghost.sh


3. The files in the project structure of your Play! project that you wish to add/replace should be placed in the directory add-on-files


4. Then run the script like so:

	$ vghost.sh <projectname> <options> <port>

   options being:
	-i : idealize (perpare the project for development in IntelliJ)
        -e : eclipsify (prepare the project for development in Eclipse)