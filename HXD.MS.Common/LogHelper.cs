using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
[assembly: log4net.Config.XmlConfigurator(Watch = true, ConfigFile = "log4net.config")]
namespace HXD.MS.Common
{
    public static class LogHelper
    {
        public static void Debug(Type type, string message)
        {
            ILog log = log4net.LogManager.GetLogger(type);
            if (log.IsDebugEnabled)
            {
                log.Debug(message);
            }
        }

        public static void Exception(Type type, string message, Exception exception)
        {
            ILog log = log4net.LogManager.GetLogger(type);
            log.Fatal(message, exception);
        }

        public static void Info(Type type, string message)
        {
            ILog log = log4net.LogManager.GetLogger(type);
            if (log.IsInfoEnabled)
            {
                log.Info(message);
            }
        }

        public static void Warn(Type type, string message)
        {
            ILog log = log4net.LogManager.GetLogger(type);
            log.Warn(message);
        }

        public static void Error(Type type, string message)
        {
            ILog log = log4net.LogManager.GetLogger(type);
            log.Error(message);
        }
    }
}
