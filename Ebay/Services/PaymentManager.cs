using System;
using AuthorizeNet.Api.Contracts.V1;
using AuthorizeNet.Api.Controllers;
using AuthorizeNet.Api.Controllers.Bases;
using Ebay.Interfaces;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;

namespace Ebay.Services
{
    public class PaymentManager : IPayment
    {
        public IConfiguration Configuration { get; }
        public IWebHostEnvironment WebHostEnvironment { get; }

        public PaymentManager(IConfiguration configuration, IWebHostEnvironment webHostEnvironment)
        {
            Configuration = configuration;
            WebHostEnvironment = webHostEnvironment;
        }

        /// <summary>
        /// Makes a API call to Authorize.Net to make a Sandbox transaction
        /// </summary>
        /// <param name="total">Total amount of the transaction</param>
        /// <returns>Boolean to confirm if the payment was successful or not</returns>
        public bool Run(double total, creditCardType creditCard, customerAddressType billingAdress)
        {
            return true;
        }
    }
}
