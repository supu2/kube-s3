###############################################################################
# The FUSE driver needs elevated privileges, run Docker with --privileged=true
###############################################################################

FROM alpine:3.20

RUN apk add --no-cache bash s3fs-fuse
RUN sed -i s/"#user_allow_other"/"user_allow_other"/g /etc/fuse.conf

COPY docker-entrypoint.sh /
RUN ["chmod", "+x", "/docker-entrypoint.sh"]
CMD /docker-entrypoint.sh
