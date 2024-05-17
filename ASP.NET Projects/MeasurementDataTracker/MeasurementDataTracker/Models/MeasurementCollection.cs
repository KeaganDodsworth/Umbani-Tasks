using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;

namespace MeasurementDataTracker.Models
{
    public class MeasurementCollection : IEnumerable<Measurement>
    {
        public List<Measurement> Measurements { get; set; }

        public MeasurementCollection()
        {
            Measurements = new List<Measurement>();
        }
        public void Add(Measurement measurement)
        {
            Measurements.Add(measurement);
        }

        public IEnumerator<Measurement> GetEnumerator()
        {
            return Measurements.GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }


    }
}
       
  