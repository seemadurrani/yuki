#!/bin/bash

export UNAME=seema
SENDER=durraniseema@gmail.com
MAILID_FILE=mailid.txt
MAIL_FILE=email.txt
MAIL_ATTACHMENT=build.log
RECEIVER=$(cat $MAILID_FILE| grep $UNAME| cut -d : -f 2 )

make build

ps -ef > $MAIL_ATTACHMENT

create_email() {

	ls /etc/ > $MAIL_FILE

}


modify_template(){
	template_name=template1.html

 sed -i "s/SPECTRO_BRANCH_NAME/$JOB_NAME/"  ${template_name=template1.html}
 sed -i "s/SPECTRO_BUILD_ID/$BUILDID/"  ${template_name=template1.html}
}

sleep 600
bin/main 
exit 0
