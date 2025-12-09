// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     DateCalculatorData data = Converter.fromJsonString(jsonString);

package com.apiverve.datecalculator.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static DateCalculatorData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(DateCalculatorData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(DateCalculatorData.class);
        writer = mapper.writerFor(DateCalculatorData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// DateCalculatorData.java

package com.apiverve.datecalculator.data;

import com.fasterxml.jackson.annotation.*;

public class DateCalculatorData {
    private long minutes;
    private long hours;
    private long days;
    private long weeks;
    private long months;
    private long years;
    private End start;
    private End end;

    @JsonProperty("minutes")
    public long getMinutes() { return minutes; }
    @JsonProperty("minutes")
    public void setMinutes(long value) { this.minutes = value; }

    @JsonProperty("hours")
    public long getHours() { return hours; }
    @JsonProperty("hours")
    public void setHours(long value) { this.hours = value; }

    @JsonProperty("days")
    public long getDays() { return days; }
    @JsonProperty("days")
    public void setDays(long value) { this.days = value; }

    @JsonProperty("weeks")
    public long getWeeks() { return weeks; }
    @JsonProperty("weeks")
    public void setWeeks(long value) { this.weeks = value; }

    @JsonProperty("months")
    public long getMonths() { return months; }
    @JsonProperty("months")
    public void setMonths(long value) { this.months = value; }

    @JsonProperty("years")
    public long getYears() { return years; }
    @JsonProperty("years")
    public void setYears(long value) { this.years = value; }

    @JsonProperty("start")
    public End getStart() { return start; }
    @JsonProperty("start")
    public void setStart(End value) { this.start = value; }

    @JsonProperty("end")
    public End getEnd() { return end; }
    @JsonProperty("end")
    public void setEnd(End value) { this.end = value; }
}

// End.java

package com.apiverve.datecalculator.data;

import com.fasterxml.jackson.annotation.*;
import java.time.LocalDate;

public class End {
    private LocalDate date;
    private String day;
    private String month;
    private String year;
    private String words;

    @JsonProperty("date")
    public LocalDate getDate() { return date; }
    @JsonProperty("date")
    public void setDate(LocalDate value) { this.date = value; }

    @JsonProperty("day")
    public String getDay() { return day; }
    @JsonProperty("day")
    public void setDay(String value) { this.day = value; }

    @JsonProperty("month")
    public String getMonth() { return month; }
    @JsonProperty("month")
    public void setMonth(String value) { this.month = value; }

    @JsonProperty("year")
    public String getYear() { return year; }
    @JsonProperty("year")
    public void setYear(String value) { this.year = value; }

    @JsonProperty("words")
    public String getWords() { return words; }
    @JsonProperty("words")
    public void setWords(String value) { this.words = value; }
}