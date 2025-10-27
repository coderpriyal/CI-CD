package com.example.dockerapp.controller;
import org.junit.jupiter.api.Test;
import static org.assertj.core.api.Assertions.assertThat;

public class HelloControllerTest {

    @Test
    void testSayHello() {
        HelloController controller = new HelloController();
        String response = controller.sayHello();
        assertThat(response).isEqualTo("Hello from CI/CD pipeline!");
    }
}