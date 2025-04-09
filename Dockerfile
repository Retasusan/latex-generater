FROM registry.gitlab.com/islandoftex/images/texlive:latest

COPY tex/compile.sh /usr/local/bin/compile.sh
RUN chmod +x /usr/local/bin/compile.sh

CMD ["/bin/sh"]
