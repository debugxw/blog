package com.iblog.util;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;

/**
 * Used to convert an object to a string or a string to an object.
 */
public class ObjectTransformUtils {

    public static ObjectMapper objectMapper = new ObjectMapper();

    /**
     * Converts an Object to a String.
     */

    public static String toString(Object object) {
        try {
            return objectMapper.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Converts a String to an Object
     */
    public static <T> T toObject(String string, Class<T> objectType) {
        try {
            return objectMapper.readValue(string, objectType);
        } catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
