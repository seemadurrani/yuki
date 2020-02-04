package main

import "github.com/go-mail/mail"
import "io/ioutil"
import "os"
import "fmt"


type EmailUser struct {
	Username    string
	Password    string
	EmailServer string
	Port        int
}

func BytesToString(data []byte) string {
	return string(data[:])
}

func main() {

	sender := os.Getenv("SENDER")
	receiver := os.Getenv("RECEIVER")
	ccUser := os.Getenv("CC_USER")
	mailFile := os.Getenv("MAIL_FILE")
	attachFile := os.Getenv("MAIL_ATTACHMENT")
	smptPort := 587
	password := os.Getenv("SMTP_PASSWORD")
	emailContent, err := ioutil.ReadFile(mailFile)
	if ( err != nil ) {
		panic(err)
	}

	str1 := BytesToString(emailContent)

	smtpInfo := &EmailUser{
		sender,
		password,
		"smtp.gmail.com",
		smptPort}

	m := mail.NewMessage()
        m.SetHeader("Subject", "Prow Job Info")
	m.SetHeader("From", sender)
	m.SetHeader("To", receiver)
	m.SetAddressHeader("Cc", ccUser, "The great")
	m.SetBody("text/html", str1)
	m.Attach(attachFile)


	fmt.Println("Server:",smtpInfo.EmailServer, "Port:",smtpInfo.Port, "user:",smtpInfo.Username, "pass:",smtpInfo.Password)
	fmt.Println("senderaddress:",sender,"receiveraddress:",receiver,"ccaddress:",ccUser,"attachmentfiles:",attachFile)

	d := mail.NewDialer(smtpInfo.EmailServer, smtpInfo.Port, smtpInfo.Username, smtpInfo.Password)
	if err = d.DialAndSend(m); err != nil {
		panic(err)
	}
}
