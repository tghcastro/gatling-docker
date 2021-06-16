package perftest.requests

import io.gatling.core.Predef._
import io.gatling.core.body.Body
import io.gatling.core.structure.ScenarioBuilder
import io.gatling.http.Predef._
import io.gatling.http.protocol.HttpProtocolBuilder
import io.gatling.http.request.builder.HttpRequestBuilder

class ExampleRequestClass() {

    def request1(): HttpRequestBuilder = {
        http("Request1")
        .get("/")
        .check(status.is(200))
    }

}