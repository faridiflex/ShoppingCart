package com.reb.customProperties

import java.sql.Time
import java.text.SimpleDateFormat
import org.springframework.beans.PropertyEditorRegistrar
import org.springframework.beans.PropertyEditorRegistry
import org.springframework.beans.propertyeditors.CustomDateEditor

public class CustomPropertiesEditorRegistrar implements PropertyEditorRegistrar {

    public void registerCustomEditors(PropertyEditorRegistry registry) {
        registry.registerCustomEditor(Date, new CustomDateEditor(new SimpleDateFormat('MM/dd/yyyy'), true))
        registry.registerCustomEditor(Time, new CustomTimeEditor(true))
    }
}
