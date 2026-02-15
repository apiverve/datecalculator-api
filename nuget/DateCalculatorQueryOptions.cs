using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.DateCalculator
{
    /// <summary>
    /// Query options for the Date Calculator API
    /// </summary>
    public class DateCalculatorQueryOptions
    {
        /// <summary>
        /// The start date for calculating the difference (format: YYYY-MM-DD)
        /// </summary>
        [JsonProperty("start")]
        public string Start { get; set; }

        /// <summary>
        /// The end date for calculating the difference (format: YYYY-MM-DD)
        /// </summary>
        [JsonProperty("end")]
        public string End { get; set; }
    }
}
