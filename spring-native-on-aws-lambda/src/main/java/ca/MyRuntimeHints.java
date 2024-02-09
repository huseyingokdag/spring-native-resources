package ca;

import org.springframework.aot.hint.RuntimeHints;
import org.springframework.aot.hint.RuntimeHintsRegistrar;

import ca.neilwhite.cloudfunctionlambda.models.Request;
import ca.neilwhite.cloudfunctionlambda.models.Response;

public class MyRuntimeHints implements RuntimeHintsRegistrar {

    @Override
    public void registerHints(RuntimeHints hints, ClassLoader classLoader) {

        // Register serialization
        hints.serialization().registerType(Request.class);
        hints.serialization().registerType(Response.class);

    }

}
