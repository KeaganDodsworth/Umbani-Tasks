using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MeasurementDataTracker.Models
{
    public class Measurement
    {
        public int MeasurementID { get; set; }
        public int Temperature { get; set; } = 0;
        public int Humidity { get; set; } = 0;
        public decimal Weight { get; set; } = 0;
        public decimal Width { get; set; } = 0;
        public decimal Length { get; set; } = 0;
        public decimal Depth { get; set; } = 0;
        public int ProductionLineID { get; set; } = 1;
        public bool PassFail { get; set; } = false;
        public DateTime Timestamp { get; set; }
        public string UserID { get; set; }
        public string UserName { get; set; } 

        public Measurement( int temperature, int humidity, decimal weight, decimal width, decimal length, decimal depth, int productionLineID, bool passFail, DateTime timestamp, string userID, string userName)
        {
            
            Temperature = temperature;
            Humidity = humidity;
            Weight = weight;
            Width = width;
            Length = length;
            Depth = depth;
            ProductionLineID = productionLineID;
            PassFail = passFail;
            Timestamp = timestamp;
            UserID = userID;
            UserName = userName;
        }

        public Measurement()
        {
        }
    }

}