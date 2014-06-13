## HOW TO LAUNCH THE SCRIPT

We wrote the script into a text file with the .sh extension 

So You have to make it executable with the chmod command :

	chmod +x fileName.sh

To use the created script:

	./fileName.sh (if we are in the same folder)
	../fileName.sh (if we are in a below folder)

Then following the instructions to get movies (make a choice, enter an email and/or write some keywords)

## SENDING MAILS CONFIGURATION : THE STEPS

	sudo apt-get install postfix mailutils libsasl2-2 ca-certificates libsasl2-modules

	vim /etc/postfix/main.cf
	relayhost = [smtp.gmail.com]:587 smtp_sasl_auth_enable = yes smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd smtp_sasl_security_options = noanonymous smtp_tls_CAfile = /etc/postfix/cacert.pem smtp_use_tls = yes

	vim /etc/postfix/sasl_passwd
	       [smtp.gmail.com]:587 USERNAME@gmail.com:PASSWORD

	sudo chmod 400 /etc/postfix/sasl_passwd sudo postmap /etc/postfix/sasl_passwd

	cat /etc/ssl/certs/Thawte_Premium_Server_CA.pem | sudo tee -a /etc/postfix/cacert.pem

	sudo /etc/init.d/postfix reload
