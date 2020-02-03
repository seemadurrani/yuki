#!/bin/bash

UNAME=seema
SENDER=durraniseema@gmail.com
MAILID_FILE=mailid.txt
MAIL_FILE=template11.html
RECEIVER=$(cat $MAILID_FILE| grep $UNAME| cut -d : -f 2 )
MAIL_ATTACHMENT=build.logs
CC_USER=shenayakhan94567@gmail.com


ps -ef > $MAIL_ATTACHMENT

create_email() {
	ls /etc/ > $MAIL_FILE
}


modify_template(){
	template_name=$1
	sed -i "s/SPECTRO_BRANCH_NAME/$JOB_NAME/"  $template_name
 	sed -i "s/SPECTRO_BUILD_ID/$BUILDID/"  $template_name
}



# Print all the env variables from CI
echo $JOB_NAME
echo $BUILDID


true
if [[ $? -ne 0 ]]
then
	MAIL_FILE=template11.html
	MAIL_ATTACHMENT=build.log	
fi

if [[ $JOB_TYPE == periodic ]]
then
	MAIL_FILE=template2.html
	MAIL_ATTACHMENT=manifest.yaml
fi	
		

export SENDER
export RECEIVER
export MAIL_ATTACHMENT
export MAIL_FILE
export CC_USER
modify_template ${MAIL_FILE}
make build
bin/main 
exit 0
