package thedevconf.jaxrs.util;

import static com.fasterxml.jackson.databind.SerializationFeature.INDENT_OUTPUT;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.json.JsonMapper;

public class JSON {
    static ObjectMapper mapper = JsonMapper.builder()
                                                 .findAndAddModules()
                                                 .enable(INDENT_OUTPUT)
                                                 .build();

    public static String stringify(Object o) {
        try {
            return mapper.writeValueAsString(o)+"\n";
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}