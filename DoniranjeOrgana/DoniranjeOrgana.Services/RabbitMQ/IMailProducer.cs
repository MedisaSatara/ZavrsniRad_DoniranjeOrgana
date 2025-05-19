﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.RabbitMQ
{
    public interface IMailProducer
    {
        public void SendEmail<T>(T message);
    }
}
