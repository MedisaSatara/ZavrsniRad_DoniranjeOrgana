using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.Service
{
    public class EmailService : IEmailService
    {
        private readonly string _fromEmail = "testposiljaoca11@gmail.com";
        private readonly string _password = "ormzipfjoktqosnh";

        public async Task SendEmailAsync(string toEmail, string subject, string body)
        {
            var message = new MailMessage(_fromEmail, toEmail, subject, body);
            message.IsBodyHtml = false;

            using var client = new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new NetworkCredential(_fromEmail, _password),
                EnableSsl = true
            };

            await client.SendMailAsync(message);
        }
    }
}