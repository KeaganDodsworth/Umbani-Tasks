using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MeasurementDataTracker.Startup))]
namespace MeasurementDataTracker
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
