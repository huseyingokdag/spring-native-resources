package ca.neilwhite.cloudfunctionlambda;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportRuntimeHints;

import ca.MyRuntimeHints;

@SpringBootApplication
@ImportRuntimeHints(value = MyRuntimeHints.class)
public class CloudFunctionLambdaApplication {
    public static void main(String[] args) {
        SpringApplication.run(CloudFunctionLambdaApplication.class, args);
    }

    /*
     * The functional bean definition style works for custom runtimes as well, and
     * is faster than the @Bean style. A custom runtime can start up much quicker
     * even than a functional bean implementation of a Java lambda - it depends
     * mostly on the number of classes you need to load at runtime.
     * See
     * https://docs.spring.io/spring-cloud-function/reference/adapters/aws-intro.
     * html
     */
    //@formatter:off
    // @Bean
    // Function<String, String> reverseString() {
    //     return value -> new StringBuilder(value).reverse().toString();
    // }
    //@formatter:on

}
