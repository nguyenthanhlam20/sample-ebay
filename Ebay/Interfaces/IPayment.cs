using System;
using AuthorizeNet.Api.Contracts.V1;

namespace Ebay.Interfaces
{
    public interface IPayment
    {
        bool Run(double total, creditCardType creditCard, customerAddressType billingAdress);
    }
}
