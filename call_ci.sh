#!/bin/bash


# BUILD_ID
# PULL_NUMBER
# JOB_TYPE
# JOB_NAME
# ARTIFACTS
# REPO_OWNER

SENDER=durraniseema@gmail.com
MAILID_FILE=mailid.txt
RECEIVER=$(cat $MAILID_FILE| grep $REPO_OWNER | cut -d : -f 2 )
CC_USER=shenayakhan94567@gmail.com
MAIL_FILE=''
MAIL_ATTACHMENT=''


echo "Seema is trying to send a mail"

modify_template(){
	template_name=$1
	sed -i "s/SPECTRO_BRANCH_NAME/$JOB_NAME/"  $template_name
 	sed -i "s/SPECTRO_BUILD_ID/$BUILD_ID/"  $template_name
}
send_mail() {
		
	export SENDER
	export RECEIVER
	export MAIL_ATTACHMENT
	export MAIL_FILE
	export CC_USER
	modify_template ${MAIL_FILE}
	make build
	bin/main 
	echo "hey the mail is sent"	
}


true
if [[ $? -ne 0 ]]
then
	MAIL_FILE=template11.html
	MAIL_ATTACHMENT=build.log	
	send_mail
fi

if [[ $JOB_TYPE == postsubmit ]]
then
	echo "hai" > manifest.yaml
	MAIL_FILE=template2.html
	MAIL_ATTACHMENT=manifest.yaml
	send_mail
fi	
		

echo "The values used were $JOB_TYPE and $MAIL_FILE"

exit 0
