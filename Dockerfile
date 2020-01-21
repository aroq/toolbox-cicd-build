# Main stage
FROM aroq/toolbox

COPY Dockerfile.packages.txt /etc/apk/packages.txt
RUN apk add --no-cache --update $(grep -v '^#' /etc/apk/packages.txt)

COPY rootfs/ /
RUN chown root:root /root/.ssh/config && chmod 600 /root/.ssh/config
