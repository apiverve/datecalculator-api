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
        /// Example: 2022-01-01
        /// </summary>
        [JsonProperty("start")]
        public string Start { get; set; }

        /// <summary>
        /// The end date for calculating the difference (format: YYYY-MM-DD)
        /// Example: 2024-08-31
        /// </summary>
        [JsonProperty("end")]
        public string End { get; set; }
    }
}
