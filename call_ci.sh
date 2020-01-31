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


bin/main 
exit 0
