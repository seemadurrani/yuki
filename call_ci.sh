#!/bin/bash

MAIL_FILE=email.txt
MAIL_ATTACHMENT=build.log

make build

ps -ef > $MAIL_ATTACHMENT

create_email() {

	ls /etc/ > $MAIL_FILE

}


bin/main 
exit 0
