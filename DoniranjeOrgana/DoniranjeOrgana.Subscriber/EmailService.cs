using System;
using System.Net;
using System.Net.Mail;

namespace DoniranjeOrgana.Subscriber
{
    public class EmailService
    {
        private readonly string _smtpServer;
        private readonly int _smtpPort;
        private readonly string _adminEmail;
        private readonly string _adminPassword;

        public EmailService()
        {
            _smtpServer = Environment.GetEnvironmentVariable("SMTP_SERVER") ?? "smtp.gmail.com";
            _smtpPort = int.Parse(Environment.GetEnvironmentVariable("SMTP_PORT") ?? "587");
            _adminEmail = Environment.GetEnvironmentVariable("SMTP_USERNAME") ?? "testposiljaoca11@gmail.com";
            _adminPassword = Environment.GetEnvironmentVariable("SMTP_PASSWORD") ?? "pass456TR$";
        }

        public async Task SendEmailAsync(string recipientEmail, string subject, string body)
        {
            using var message = new MailMessage();
            message.From = new MailAddress(_adminEmail);
            message.To.Add(recipientEmail);
            message.Subject = subject;
            message.Body = body;
            message.IsBodyHtml = false;

            using var client = new SmtpClient(_smtpServer, _smtpPort)
            {
                Credentials = new NetworkCredential(_adminEmail, _adminPassword),
                EnableSsl = true
            };

            await client.SendMailAsync(message);
        }
    }


}