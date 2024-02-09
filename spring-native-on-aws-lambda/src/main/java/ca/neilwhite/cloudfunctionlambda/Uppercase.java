package ca.neilwhite.cloudfunctionlambda;

import java.util.function.Function;

import org.springframework.stereotype.Component;

import ca.neilwhite.cloudfunctionlambda.models.Request;
import ca.neilwhite.cloudfunctionlambda.models.Response;

@Component
public class Uppercase implements Function<Request, Response> {

    @Override
    public Response apply(Request request) {
        return new Response(request.getMessage().toUpperCase(), request.getMessage().length());
    }
    
}
