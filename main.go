package main

import "github.com/go-mail/mail"
import "io/ioutil"
import "os"
import "fmt"

/*
 Change the hard codings to variables
 Aggregate all the smtp info into a struct
 Before build compile & check


 Get Reciever Email from Env variable
 Get the mail content & attachment as two file variables
   Ex: mail_file := "email.txt"
       attach_file := "build.log"
  Read the mail_file content to a variable called mail_content
  Send the mail now

  Error checks
*/
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
	attachFile := onewmail.gos.Getenv("EMAIL_ATTACHMENT")
	smptPort := 587
	password := os.Getenv("SMTP_PASSWORD")
	emailContent, _ := ioutil.ReadFile(mailFile)
	str1 := BytesToString(emailContent)

	smtpInfo := &EmailUser{
		sender,
		password,
		"smtp.gmail.com",
		smptPort}

	m := mail.NewMessage()
	m.SetHeader("From", sender)
	m.SetHeader("To", receiver)
	m.SetAddressHeader("Cc", ccUser, "The great")
	m.SetBody("text/html", str1)
	m.Attach(attachFile)

	d := mail.NewDialer(smtpInfo.EmailServer, smtpInfo.Port, smtpInfo.Username, smtpInfo.Password)
	if err := d.DialAndSend(m); err != nil {
		panic(err)
	}
}
