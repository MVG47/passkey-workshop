package com.yubicolabs.PasskeyAuthenticator;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;

@Getter
public class AssertionResult {

  @JsonProperty("status")
  String status;

  @JsonCreator
  public AssertionResult(@JsonProperty("status") String status) {
    this.status = status;
  }

}
