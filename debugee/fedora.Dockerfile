ARG DEBUGEE_IMAGE_ORIG
FROM $DEBUGEE_IMAGE_ORIG
COPY cert/mitmproxy-ca-cert.pem /etc/pki/ca-trust/source/anchors/
RUN update-ca-trust