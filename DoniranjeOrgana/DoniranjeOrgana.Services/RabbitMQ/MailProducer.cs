using DoniranjeOrgana.Models.Model;
using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Services.RabbitMQ;
using Newtonsoft.Json;
using RabbitMQ.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Service.RabbitMQ
{
    public class MailProducer : IMailProducer
    {
        public void SendEmailMessage(DonacijaKrviNotifier message)
        {
            var factory = new ConnectionFactory()
            {
                HostName = Environment.GetEnvironmentVariable("RABBITMQ_HOST") ?? "rabbitmq",
                Port = int.Parse(Environment.GetEnvironmentVariable("RABBITMQ_PORT") ?? "5672"),
                UserName = Environment.GetEnvironmentVariable("RABBITMQ_USERNAME") ?? "test",
                Password = Environment.GetEnvironmentVariable("RABBITMQ_PASSWORD") ?? "test"
            };

            using var connection = factory.CreateConnection();
            using var channel = connection.CreateModel();

            string exchangeName = "EmailExchange";
            string routingKey = "email_queue";

            channel.ExchangeDeclare(exchangeName, ExchangeType.Direct);

            var json = JsonConvert.SerializeObject(message);
            var body = Encoding.UTF8.GetBytes(json);

            channel.BasicPublish(exchange: exchangeName,
                                 routingKey: routingKey,
                                 basicProperties: null,
                                 body: body);
        }
    }
}
