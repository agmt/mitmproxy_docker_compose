ARG DEBUGEE_IMAGE_ORIG
FROM $DEBUGEE_IMAGE_ORIG
RUN apk add ca-certificates
COPY cert/mitmproxy-ca-cert.pem /usr/local/share/ca-certificates/
RUN update-ca-certificates
