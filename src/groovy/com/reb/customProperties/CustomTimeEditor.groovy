package com.reb.customProperties

import java.beans.PropertyEditorSupport
import java.sql.Time
import java.text.ParseException
import org.springframework.util.StringUtils

class CustomTimeEditor extends PropertyEditorSupport {
    boolean allowEmpty

    public CustomTimeEditor(boolean allowEmpty) {
        this.allowEmpty = allowEmpty

    }

    public void setAsText(java.lang.String text) throws java.lang.IllegalArgumentException {
        if (this.allowEmpty && !StringUtils.hasText(text)) {
            // Treat empty String as null value.
            setValue(null);
        }
        else {
            try {
                setValue(Time.valueOf(text));
            }
            catch (ParseException ex) {
                throw new IllegalArgumentException("Could not parse time: " + ex.getMessage(), ex);
            }
        }
    }

    public java.lang.String getAsText() {
        Time time =  (Time) getValue()
        return time?.format('HH:mm:ss')
    }
}
