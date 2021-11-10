using Realestate_portal.Controllers;
using Realestate_portal.Models;
using Realestate_portal.Services.Contracts;
using Realestate_portal.Services.Repositories;
using System.Web.Mvc;
using Unity;
using Unity.Mvc5;

namespace Realestate_portal
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
			var container = new UnityContainer();

            container.RegisterType<Imarket, MarketRepository>();
            container.RegisterType<IGeneral, clsGeneral>();
            container.RegisterType<Realstate_agentsEntities>();
            container.RegisterType<IEmail,EmailRepository>();     
            container.RegisterType<IUser, UserRepository>();
            // register all your components with the container here
            // it is NOT necessary to register your controllers

            // e.g. container.RegisterType<ITestService, TestService>();

            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
        }
    }
}