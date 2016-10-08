FROM pluie/alpine-apache

MAINTAINER Lei Wang https://github.com/bonnlei

ADD ./install.d/20-extensions.sh /scripts/install.d
ADD ./pre-init.d/20-extensions.sh /scripts/pre-init.d


ENV      SHENV_NAME=Apache \
        SHENV_COLOR=67 \
   HTTP_SERVER_NAME=localhost \
            WWW_DIR=web \
          WWW_INDEX=index.php \
      FIX_OWNERSHIP=1 \
      TZ=Europe/Berlin


EXPOSE 80 9000

RUN bash /scripts/install.sh
