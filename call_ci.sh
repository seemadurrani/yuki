#!/bin/bash

export UNAME=seema
SENDER=durraniseema@gmail.com
MAILID_FILE=mailid.txt
MAIL_FILE=email.txt
RECEIVER=$(cat $MAILID_FILE| grep $UNAME| cut -d : -f 2 )
MAIL_ATTACHMENT=build.log
CC_USER=shenayakhan94567@gmail.com


ps -ef > $MAIL_ATTACHMENT

create_email() {
	ls /etc/ > $MAIL_FILE
}


modify_template(){
	template_name=template1.html
	sed -i "s/SPECTRO_BRANCH_NAME/$JOB_NAME/"  ${template_name=template1.html}
 	sed -i "s/SPECTRO_BUILD_ID/$BUILDID/"  ${template_name=template1.html}
}



true
if [[ $? -ne 0 ]]
then
	MAIL_FILE=template11.html
	MAIL_ATTACHMENT=build.log	
fi

if [[ $JOB_TYPE == periodic ]]
	MAIL_FILE=template2.html
	MAIL_ATTACHMENT=manifest.yaml
fi	
		

make build
bin/main 
exit 0
