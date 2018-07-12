package br.ufsm.csi.seguranca.model;

import java.security.Timestamp;

/**
 * Created by Glenio on 09/07/2018.
 */

public class CaptchaResponse {
    private boolean success;
    private String[] errorCodes;
    private Timestamp challenge_ts;  // timestamp of the challenge load (ISO format yyyy-MM-dd'T'HH:mm:ssZZ)
    private String hostname;

    public CaptchaResponse() {
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String[] getErrorCodes() {
        return errorCodes;
    }

    public void setErrorCodes(String[] errorCodes) {
        this.errorCodes = errorCodes;
    }

    public Timestamp getChallenge_ts() {
        return challenge_ts;
    }

    public void setChallenge_ts(Timestamp challenge_ts) {
        this.challenge_ts = challenge_ts;
    }

    public String getHostname() {
        return hostname;
    }

    public void setHostname(String hostname) {
        this.hostname = hostname;
    }
}

